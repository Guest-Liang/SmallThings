import matplotlib.pyplot as plt

# 初始位置和方向
x = 0
y = 0
direction = "north"  # 假设一开始朝向正北


# 读取文本文件
with open('way.txt', 'r') as file:
    lines = file.readlines()

# 初始化distances列表,# 超声波传感器数据（示例数据）
distances = []

# 循环遍历每一行文本并将其转换为元组，然后添加到distances列表中
for line in lines:
    parts = line.strip().split(',')
    if len(parts) == 3:
        distance_tuple = tuple(map(float, parts))
        distances.append(distance_tuple)

# 保存轨迹的坐标列表
trajectory = [(x, y)]

# 根据超声波数据更新位置和方向
for cm1, cm2, cm3 in distances:
    if (cm1 <= 30 and cm2 <= 30 and cm3 > 30) or (cm1 <= 30 and cm2 > 30 and cm3 > 30):  # 右转
        if direction == "north":
            direction = "east"
        elif direction == "east":
            direction = "south"
        elif direction == "south":
            direction = "west"
        elif direction == "west":
            direction = "north"
    elif (cm1 > 30 and cm2 <= 30 and cm3 <= 30) or (cm1 > 30 and cm2 > 30 and cm3 <= 30) or (cm1 > 30 and cm2 <= 30 and cm3 > 30) or (cm1>30 and cm2>30 and cm3>30):  # 直行
        if direction == "north":
            y += 1
        elif direction == "east":
            x += 1
        elif direction == "south":
            y -= 1
        elif direction == "west":
            x -= 1
    elif (cm1 <= 30 and cm2 > 30 and cm3 <= 30) or (cm1 <= 30 and cm2 <= 30 and cm3 <= 30):  # 左转
        if direction == "north":
            direction = "west"
        elif direction == "east":
            direction = "north"
        elif direction == "south":
            direction = "east"
        elif direction == "west":
            direction = "south"

    trajectory.append((x, y))
print(trajectory)
# 绘制轨迹
x_values, y_values = zip(*trajectory)
plt.plot(x_values, y_values, marker='o')
plt.xlabel('X')
plt.ylabel('Y')
plt.title('way')
plt.grid(True)
plt.show()
