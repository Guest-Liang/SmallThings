from ultralytics import YOLO
import cv2
import datetime
import numpy
import time

# Load a model
model = YOLO(r".\best.pt")

# whether to save the video-----------------
save_video = 1

url = "http://192.168.8.1:8083/?action=stream" # avaliable only when wifi is connected
WindowName = "YOLOv8 Inference Group9"

# predict video
# cap = cv2.VideoCapture(0) # index 0 is obs virtual camera
cap = cv2.VideoCapture(url)

counter = 0
start_time = time.time()
fps = cap.get(cv2.CAP_PROP_FPS)  # 获取帧率
frame_height = int(cap.get(cv2.CAP_PROP_FRAME_HEIGHT))
frame_width = int(cap.get(cv2.CAP_PROP_FRAME_WIDTH))
if save_video:
    nowtime = datetime.datetime.now().strftime("%Y%m%d_%H%M%S")
    fourcc = cv2.VideoWriter_fourcc(*"XVID")  # 设置视频的编码格式
    out_proc = cv2.VideoWriter(f"./SavedVideo/{nowtime}_proconly.avi", fourcc, fps, (frame_width, frame_height), True)
    out_bio = cv2.VideoWriter(f"./SavedVideo/{nowtime}_bio.avi", fourcc, fps, (frame_width * 2, frame_height), True)


# Loop through the video frames
while cap.isOpened():
    # Read a frame from the video
    success, frame = cap.read()
    cv2.namedWindow(WindowName, 0)
    cv2.namedWindow(WindowName, cv2.WINDOW_NORMAL | cv2.WINDOW_KEEPRATIO)
    cv2.resizeWindow(WindowName, 1280, 360)
    counter += 1
    if success:
        # Run YOLOv8 inference on the frame
        results = model(frame)
        annotated_frame = results[0].plot()

        imgs = numpy.hstack((frame, annotated_frame))  # 水平拼接两帧图像

        # Display the FPS
        # cv2.putText(imgs,"FPS {0}".format(float('%.1f' % (counter / (time.time() - start_time)))), (0, 20), cv2.FONT_HERSHEY_SIMPLEX, 0.5, (0, 255, 0), 1)
        # Display the annotated frame
        cv2.imshow(WindowName, imgs)

        counter = 0
        start_time = time.time()
        if save_video:
            out_proc.write(annotated_frame)  # 仅检测结果
            out_bio.write(imgs)  # 检测结果和原图

        # Break the loop if 'q' is pressed
        if cv2.waitKey(1) & 0xFF == ord("q"):
            break
        if cv2.getWindowProperty(WindowName, 0) == -1:  # 可以关闭后停止运行
            break
    else:
        # Break the loop if the end of the video is reached
        break

# Release the video capture object and close the display window
cap.release()
cv2.destroyAllWindows()
