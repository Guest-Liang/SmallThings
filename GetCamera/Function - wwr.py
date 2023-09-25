import os
import datetime
import time
import cv2
url=""
WindowName="video"
SavePath=r".\Pictures"
def open_live():
    os.system("ffplay -i f{url}")
    time.sleep(0.2)
def Getimg():
    Cap=cv2.VideoCapture(url)
    print(Cap.isOpened())
    cv2.namedWindow(WindowName, 0)
    cv2.resizeWindow(WindowName, 50, 50)
    while (Cap.isOpened()):
        dt_ms=datetime.datetime.now().strftime('%Y-%m-%d %H:%M:%S.%f')
        dt_msnodate=datetime.datetime.now().strftime('%H-%M-%S.%f')
        print(dt_ms)
        ret, frame=Cap.read()
        if(ret==False):
            break
        cv2.imshow(WindowName, frame)
        print(cv2.imwrite(f'{SavePath}\{dt_msnodate}.jpg',frame))
        if cv2.waitKey(1)&0xFF==ord('q'):
            break
    Cap.release()
    cv2.destroyAllWindows()

open_live()
Getimg()