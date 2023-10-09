from ultralytics import YOLO
import cv2
# from ultralytics.yolo.utils.benchmarks import benchmark

# img_path = "./test/images/"
# img_path = r"D:\files\VSCode\SmallThings\GetCamera\Pictures"
img_path = r"D:\files\VSCode\SmallThings\GetCamera\train42\testimage"
# results = model.predict(img_path, save=True, conf=0.5) # device=0 by default, conf:置信度阈值
WindowName='YOLOv8 Inference'
# Load the YOLOv8 model
model = YOLO("./best.pt")

# Open the video file
video_path = r"D:\files\VSCode\SmallThings\GetCamera\train42\weights\demo4k.mp4"
cap = cv2.VideoCapture(video_path)

# Loop through the video frames
while cap.isOpened():
    # Read a frame from the video
    success, frame = cap.read()
    cv2.namedWindow(WindowName, cv2.WINDOW_NORMAL | cv2.WINDOW_KEEPRATIO)    # 窗口大小可以改变
    if success:
        # Run YOLOv8 inference on the frame
        results = model(frame)

        # Visualize the results on the frame
        annotated_frame = results[0].plot()

        # Display the annotated frame
        cv2.imshow(WindowName, annotated_frame)

        # Break the loop if 'q' is pressed
        if cv2.waitKey(1) & 0xFF == ord("q"):
            break
    else:
        # Break the loop if the end of the video is reached
        print('video file end or wrong filename!')
        break

# Release the video capture object and close the display window
cap.release()
cv2.destroyAllWindows()


