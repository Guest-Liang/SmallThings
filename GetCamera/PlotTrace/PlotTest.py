import contextlib
with contextlib.redirect_stdout(None):
    import pygame
from pygame.locals import *

# 初始化Pygame窗口
pygame.init()
width, height = 300, 300
screen = pygame.display.set_mode((width, height))
pygame.display.set_caption('Custom Maze')

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
    
    # 绘制迷宫墙壁和地面
    for i in range(len(maze)):
        for j in range(len(maze[i])):
            if maze[i][j] == 1:
                # 绘制墙壁部分，涂成黑色
                pygame.draw.rect(screen, wall_color, (j * cell_size, i * cell_size, cell_size, cell_size))
    
    pygame.display.flip()

# 退出程序时关闭Pygame
pygame.quit()
