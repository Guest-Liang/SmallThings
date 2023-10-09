from ultralytics import YOLO
import cv2
# from ultralytics.yolo.utils.benchmarks import benchmark

# Load a model
# model = YOLO("yolov8n.yaml")  # build a new model from scratch
# model = YOLO("best.pt")  # load a pretrained model (recommended for training)
model = YOLO(r".\best.pt")

# Use the model
# model.train(data="coco128.yaml", epochs=3,workers=0)  # train the model,workers=0 if windows
# metrics = model.val()  # evaluate model performance on the validation set
'''
results = model("bus.jpg")  # predict on an image
print(results)
# '''

# img_path = "./test/images/"
# img_path = r"D:\files\VSCode\SmallThings\GetCamera\Pictures"
img_path = r"D:\files\VSCode\SmallThings\GetCamera\train42\testimage"
# results = model.predict(img_path, save=True, conf=0.5) # device=0 by default, conf:置信度阈值
WindowName='video1023'

' 用下面这行代码运行'
' python demo.py >> output.txt 2>&1 ' # 不带前台显示，>>追加写入，>覆盖写入
' python demo.py 2>&1 | tee output.txt ' # 带前台显示，但是为红色错误输出

# results = model.predict(img_path,save=True,classes=[0,2],conf=0.5) # i.e. classes=0,classes=[0,3,4]

# save detection results *
# results = model.predict(img_path,save=True,save_txt=True,classes=0,conf=0.4)

import numpy as np
import supervision as sv
from ultralytics import YOLO


class CountObject():

    def __init__(self, input_video_path, output_video_path) -> None:
        # 加载YOLOv8模型
        self.model = YOLO(r'.\best.pt')

        # 输入视频, 输出视频
        self.input_video_path = input_video_path
        self.output_video_path = output_video_path

        # 视频信息
        self.video_info = sv.VideoInfo.from_video_path(input_video_path)

        # 检测框属性
        self.box_annotator = sv.BoxAnnotator(thickness=4, text_thickness=4, text_scale=2)

    def process_frame(self, frame: np.ndarray, _) -> np.ndarray:
        # 检测
        results = self.model(frame, imgsz=1280)[0]
        detections = sv.Detections.from_yolov8(results)
        detections = detections[detections.class_id == 0]

        # 绘制检测框
        box_annotator = sv.BoxAnnotator(thickness=4, text_thickness=4, text_scale=2)
        labels = [f"{self.model.names[class_id]} {confidence:0.2f}" for _, confidence, class_id, _ in detections]
        frame = box_annotator.annotate(scene=frame, detections=detections, labels=labels)

        return frame

    def process_video(self):
        # 处理视频
        sv.process_video(source_path=self.input_video_path, target_path=self.output_video_path,
                         callback=self.process_frame)


if __name__ == "__main__":
    obj = CountObject('demo.mp4', 'single.mp4')
    obj.process_video()