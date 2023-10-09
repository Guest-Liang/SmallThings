from ultralytics import YOLO
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
img_path = r"D:\files\VSCode\SmallThings\GetCamera\Pictures"
# img_path = r"D:\files\VSCode\SmallThings\GetCamera\train42\testimage"
results = model.predict(img_path, save=True, conf=0.5) # device=0 by default, conf:置信度阈值
#print(results)

' 用下面这行代码运行'
' python demo.py >> output.txt 2>&1 ' # 不带前台显示，>>追加写入，>覆盖写入
' python demo.py 2>&1 | tee output.txt ' # 带前台显示，但是为红色错误输出

# results = model.predict(img_path,save=True,classes=[0,2],conf=0.5) # i.e. classes=0,classes=[0,3,4]

# save detection results *
# results = model.predict(img_path,save=True,save_txt=True,classes=0,conf=0.4)



# predict video
#video_path = "./video/1.mp4"
#cap = cv2.VideoCapture(0)

# # Loop through the video frames
# while cap.isOpened():
#     # Read a frame from the video
#     success, frame = cap.read()

#     if success:
#         # Run YOLOv8 inference on the frame
#         results = model(frame)

#         # Visualize the results on the frame
#         annotated_frame = results[0].plot()

#         # Display the annotated frame
#         cv2.imshow("YOLOv8 Inference", annotated_frame)

#         # Break the loop if 'q' is pressed
#         if cv2.waitKey(1) & 0xFF == ord("q"):
#             break
#     else:
#         # Break the loop if the end of the video is reached
#         break

# Release the video capture object and close the display window
# cap.release()
# cv2.destroyAllWindows()
