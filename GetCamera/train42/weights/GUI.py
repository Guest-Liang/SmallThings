import tkinter as tk
from tkinter import filedialog
from PIL import ImageTk, Image
import cv2
import torch
from torchvision.transforms import functional as F
from ultralytics import YOLO
import numpy as np
import tensorflow as tf

# 加载模型
device = torch.device('cuda' if torch.cuda.is_available() else 'cpu')
model = YOLO(r".\best.pt")
model.to(device)
# model.val()

# 创建GUI窗口
window = tk.Tk()
window.title("YOLOv5 Demo")

# 创建画布
canvas = tk.Canvas(window, width=800, height=300)
canvas.pack()

# 定义预测函数
def predict(image_path):
    # 加载图像
    image = cv2.imread(image_path)
    image = cv2.cvtColor(image, cv2.COLOR_BGR2RGB)
    image = Image.fromarray(image)

    # 预处理图像
    image = F.to_tensor(image).unsqueeze(0).to(device)
    with torch.no_grad():
        detections = model(image)

    # 处理预测结果
    # TODO: 根据预测结果在图像上绘制边界框等信息
    for detection in detections:
        class_name = detection['class']
        confidence = detection['confidence']
        bbox = detection['bbox']

        # 提取边界框坐标和尺寸
        x, y, width, height = bbox

        # 绘制边界框
        cv2.rectangle(image, (x, y), (x + width, y + height), (0, 255, 0), 2)

    # 在边界框上方绘制类别和置信度
    text = f'{class_name}\nConfidence: {confidence:.2f}'
    cv2.putText(image, text, (x, y - 10), cv2.FONT_HERSHEY_SIMPLEX, 0.9, (0, 255, 0), 2)


    # 显示预测结果
    # TODO: 在画布上显示图像和预测结果

# 定义按钮点击事件
def browse_image():
    root = tk.Tk()
    root.withdraw()
    file_path = filedialog.askopenfilename()
    if file_path:
        predict(file_path)

# 创建按钮
browse_button = tk.Button(window, text="选择图像", command=browse_image)
browse_button.pack()

# 运行GUI事件循环
window.mainloop()