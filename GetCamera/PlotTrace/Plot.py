import serial
import serial.tools.list_ports
import numpy as np
import matplotlib.pyplot as plt
import contextlib
with contextlib.redirect_stdout(None):
    import pygame
from pygame.locals import *

# 初始化校准参数
acceleration_offset = np.array([0.0, 0.0, 0.0])
gyroscope_offset = np.array([0.0, 0.0, 0.0])

# 设置采样频率和时间间隔（可以根据性能调整）
sample_rate = 20  # Hz
dt = 1.0 / sample_rate

# 初始化位置和速度
position = np.array([0.0, 0.0])
velocity = np.array([50.0, 50.0])

# 初始化蓝牙
Ser = serial.Serial('COM4', 9600)
if Ser.isOpen():
    print("串口已打开")
else:
    print("串口打开失败")

# 统计平均校准陀螺仪参数
gyroscope_calibrate_duration = 3.0  # 校准时间3s
gyroscope_calibrate_samples = int(gyroscope_calibrate_duration * sample_rate)
gyroscope_buffer = np.zeros((gyroscope_calibrate_samples, 3))

print("开始陀螺仪校准，请保持设备静止...")

for i in range(gyroscope_calibrate_samples):
    Data = Ser.readline().decode('utf-8').replace('\r\n', '')
    data = [float(x) for x in Data.split(',')]

    # 提取陀螺仪数据
    gyroscope = np.array(data[3:])
    gyroscope_buffer[i, :] = gyroscope

# 计算陀螺仪零漂（偏置）的平均值
gyroscope_offset = np.mean(gyroscope_buffer, axis=0)

print("陀螺仪校准完成，得到的偏置值为:", gyroscope_offset)

# 初始化Pygame窗口
pygame.init()
width, height = 300, 300
screen = pygame.display.set_mode((width, height))
pygame.display.set_caption('MPU9250 Trajectory')

# 自定义的7x7迷宫数据，1表示墙壁，0表示地面
maze = [
    [1, 1, 1, 1, 1, 1, 1],
    [1, 0, 0, 0, 0, 0, 1],
    [1, 0, 1, 1, 1, 0, 1],
    [1, 0, 1, 0, 1, 0, 1],
    [1, 0, 1, 1, 1, 0, 1],
    [1, 0, 1, 0, 0, 0, 1],
    [1, 0, 1, 1, 1, 1, 1]
]

# 迷宫单元格的大小（最窄和最矮）
cell_size = min(width // len(maze[0]), height // len(maze))

# 初始yaw角度为0表示朝向正北
yaw = 90.0

# 墙壁颜色
wall_color = (0, 0, 0)

# 主循环
running = True
while running:
    for event in pygame.event.get():
        if event.type == QUIT:
            running = False

    # 绘制迷宫
    screen.fill((255, 255, 255))

    # 获取实际MPU9250数据
    Data = Ser.readline().decode('utf-8').replace('\r\n', '')
    data = [float(x) for x in Data.split(',')]

    # 提取数据
    acceleration = np.array(data[:3])
    gyroscope = np.array(data[3:])

    # 校准陀螺仪数据
    gyroscope_calibrated = gyroscope - gyroscope_offset

    # 更新位置和速度
    velocity += acceleration[:2] * dt
    position += velocity * dt

    # 绘制迷宫
    screen.fill((255, 255, 255))
    
    # 绘制迷宫墙壁和地面
    for i in range(len(maze)):
        for j in range(len(maze[i])):
            if maze[i][j] == 1:
                # 绘制墙壁部分，涂成黑色
                pygame.draw.rect(screen, wall_color, (j * cell_size, i * cell_size, cell_size, cell_size))

    # 绘制小车位置和方向
    car_x = int(position[0] + cell_size / 2)
    car_y = int(height - position[1] - cell_size / 2)
    
    # 绘制小车方向箭头
    arrow_length = 20
    arrow_end_x = int(car_x + arrow_length * np.cos(yaw))
    arrow_end_y = int(car_y - arrow_length * np.sin(yaw))
    pygame.draw.line(screen, (0, 0, 255), (car_x, car_y), (arrow_end_x, arrow_end_y), 3)
    
    # 绘制小车
    pygame.draw.circle(screen, (0, 0, 255), (car_x, car_y), 5)
    
    pygame.display.flip()

# 退出程序时关闭Pygame
pygame.quit()
