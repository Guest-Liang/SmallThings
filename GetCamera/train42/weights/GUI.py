import PySimpleGUI as sg
from ultralytics import YOLO
import cv2
import os
import glob

# Load a model
model = YOLO("best.pt")  # load a pretrained model (recommended for training)

# Define the GUI layout
layout = [
    [sg.Text("请选择要检测的图片文件夹："), sg.Input(key="-FOLDER-"), sg.FolderBrowse("浏览")],
    [sg.Text("请输入置信度阈值（0-1）："), sg.Input(key="-CONF-", default_text="0.5")],
    [sg.Button("开始检测"), sg.Button("Next Image"), sg.Button("退出")],
    [sg.Image(key="-IMAGE-", size=(480, 270))],
    [sg.Text(key="-INFO-", size=(60, 1))],
    [sg.Image(filename='./confusion_matrix_normalized2.png', key="-ACCURACY-", size=(480, 270))],
]

# Create the GUI window
window = sg.Window("YOLOv8对象检测", layout, size=(1280, 720))

# Initialize image_files to an empty list
image_files = []

# Loop through the GUI events
while True:
    event, values = window.read()
    if event == "退出" or event == sg.WIN_CLOSED:
        break
    elif event == "开始检测":
        # Get the folder path and confidence threshold from the user input
        folder_path = values["-FOLDER-"]
        conf = float(values["-CONF-"])

        # Check if the folder path is valid
        if folder_path:
            # Get the list of image files in the folder
            image_files = glob.glob(os.path.join(folder_path, "*"))
            image_files = [f for f in image_files if os.path.splitext(f)[1] in [".jpg", ".png", ".bmp"]]

            # Check if there are any image files in the folder
            if not image_files:
                # Show an error message if there are no image files in the folder
                sg.popup_error("文件夹中没有图片文件！")
                continue

        else:
            # Show an error message if the folder path is invalid
            sg.popup_error("请选择一个有效的文件夹！")
            continue

        # Predict on the first image file using YOLOv8
        results = model.predict(image_files[0], conf=conf)

        # Get the output image and accuracy from the results
        output_image = results[0].plot()
        # accuracy = results[0].accuracy

        # Convert the output image to bytes and update the GUI image with it
        _, output_image_bytes = cv2.imencode(".png", output_image)
        window["-IMAGE-"].update(data=output_image_bytes.tobytes())

        # Remove the first image file from the list
        image_files.pop(0)

    elif event == "Next Image" and image_files:
        # Predict on the next image file using YOLOv8
        results = model.predict(image_files[0], conf=conf)

        # Get the output image from the results and update the GUI image with it
        output_image = results[0].plot()
        _, output_image_bytes = cv2.imencode(".png", output_image)
        window["-IMAGE-"].update(data=output_image_bytes.tobytes())

        # Remove the first image file from the list
        image_files.pop(0)

    elif not image_files:
        window["-INFO-"].update("所有图片已识别")

# Close the GUI window
window.close()
