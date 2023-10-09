from ultralytics import YOLO
import cv2
import tkinter
from tkinter import filedialog
from PIL import Image, ImageTk
# from ultralytics.yolo.utils.benchmarks import benchmark

# Load a model
# model = YOLO("yolov8n.yaml")  # build a new model from scratch
# model = YOLO("best.pt")  # load a pretrained model (recommended for training)
model = YOLO(r".\best.pt")

# img_path = r"D:\files\VSCode\SmallThings\GetCamera\Pictures"
img_path = r"D:\files\VSCode\SmallThings\GetCamera\train42\testimage"
# results = model.predict(img_path, save=True, conf=0.5) # device=0 by default, conf:置信度阈值
# print(results)

' 用下面这行代码运行'
' python demo.py >> output.txt 2>&1 ' # 不带前台显示，>>追加写入，>覆盖写入
' python demo.py 2>&1 | tee output.txt ' # 带前台显示，但是为红色错误输出

# results = model.predict(img_path,save=True,classes=[0,2],conf=0.5) # i.e. classes=0,classes=[0,3,4]

# Display the annotated frame
# i=0
# while i<len(results):
#     annotated_frame = results[i].plot()
#     cv2.imshow("YOLOv8 Inference", annotated_frame)
#     cv2.waitKey()
#     cv2.destroyAllWindows()
#     i+=1





# 创建GUI窗口
Window = tkinter.Tk()
Window.title("YOLOv8 Demo")
Window.geometry('1280x720')

# 创建画布
# Canvas = tkinter.Canvas(Window, width=800, height=300)
# Canvas.pack()

# 定义按钮点击事件
def browse_image():
    root = tkinter.Tk()
    root.withdraw()
    IMGPath = filedialog.askopenfilename()
    if IMGPath:
        Plot(IMGPath)

# 创建按钮
tkinter.Button(Window, text="选择图像", command=browse_image).pack(side='top')
Raw=Image.open(r"D:\files\VSCode\SmallThings\GetCamera\train42\testimage\7.jpg")
Label_Raw=tkinter.Label(Window, image=ImageTk.PhotoImage(Raw.resize((500, 500))))
Label_Raw.pack(side='left')
Processed=Image.open(r"D:\files\VSCode\SmallThings\GetCamera\train42\weights\runs\detect\predict4\7.jpg")
Label_Processed=tkinter.Label(Window, image=ImageTk.PhotoImage(Processed.resize((500,500))))
Label_Processed.pack(side='right')

# 运行GUI事件循环
Window.mainloop()

def Plot(IMGPath):
    return