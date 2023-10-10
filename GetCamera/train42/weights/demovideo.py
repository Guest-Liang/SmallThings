from ultralytics import YOLO
import cv2
import numpy
import datetime

# img_path = r"D:\files\VSCode\SmallThings\GetCamera\Pictures"
img_path = r"D:\files\VSCode\SmallThings\GetCamera\train42\testimage"
# results = model.predict(img_path, save=True, conf=0.5) # device=0 by default, conf:置信度阈值
WindowName='YOLOv8 Inference Group9'
# Load the YOLOv8 model
model = YOLO("./best.pt")
# Open the video file
video_path = r"D:\files\VSCode\SmallThings\GetCamera\train42\weights\demo720p.mp4"


cap = cv2.VideoCapture(video_path)
frame_height = int(cap.get(cv2.CAP_PROP_FRAME_HEIGHT))
frame_width = int(cap.get(cv2.CAP_PROP_FRAME_WIDTH))
"""
视频的编码格式参考如下：
cv2.VideoWriter_fourcc('I','4','2','0'):YUV编码，4:2:0色度子采样。这种编码广泛兼容，但会产生大文件。文件扩展名应为.avi。
cv2.VideoWriter_fourcc('P','I','M','1'):MPEG-1编码。文件扩展名应为.avi。
cv2.VideoWriter_fourcc('X','V','I','D'):MPEG-4编码。如果要限制结果视频的大小，这是一个很好的选择。文件扩展名应为.avi。
cv2.VideoWriter_fourcc('m','p','4','v'):较旧的MPEG-4编码。如果要限制结果视频的大小，这是一个很好的选择。文件扩展名应为.m4v。
cv2.VideoWriter_fourcc('X','2','6','4'):较新的MPEG-4编码。如果你想限制结果视频的大小，这可能是最好的选择。文件扩展名应为.mp4。
cv2.VideoWriter_fourcc('T','H','E','O'):这个选项是Ogg Vorbis。文件扩展名应为.ogv。
cv2.VideoWriter_fourcc('F','L','V','1'):此选项为Flash视频。文件扩展名应为.flv。
:return:
"""
nowtime = datetime.datetime.now().strftime('%Y%m%d_%H%M%S')
fps = int(cap.get(cv2.CAP_PROP_FPS)) # 获取帧率
fourcc = cv2.VideoWriter_fourcc(*'XVID') # 设置视频的编码格式
out_proc = cv2.VideoWriter(f'./SavedVideo/{nowtime}_proconly.avi', fourcc, fps, (frame_width, frame_height), True)
out_bio = cv2.VideoWriter(f'./SavedVideo/{nowtime}_bio.avi', fourcc, fps, (frame_width * 2, frame_height), True)


# Loop through the video frames
while cap.isOpened():
    # Read a frame from the video
    success, frame = cap.read()
    cv2.namedWindow(WindowName, cv2.WINDOW_NORMAL | cv2.WINDOW_KEEPRATIO)    # 窗口大小可以改变
    cv2.moveWindow(WindowName, 0, 50)    # 窗口位置可以改变，左上角坐标
    cv2.resizeWindow(WindowName, 1440, int(1440 * frame_height / frame_width / 2)) # 设置窗口大小，以适合两个图像并排显示
    if success:
        # Run YOLOv8 inference on the frame
        results = model(frame)
        annotated_frame = results[0].plot()

        imgs=numpy.hstack((frame, annotated_frame)) # 水平拼接两帧图像

        out_proc.write(annotated_frame) # 仅检测结果
        out_bio.write(imgs) # 检测结果和原图

        cv2.imshow(WindowName, imgs)

        # Break the loop if 'q' is pressed
        if cv2.waitKey(1) & 0xFF == ord("q"):
            break
    else:
        # Break the loop if the end of the video is reached
        print('video file end or wrong filename!')
        break

out_proc.release()
out_bio.release()

# Release the video capture object and close the display window
cap.release()
cv2.destroyAllWindows()
