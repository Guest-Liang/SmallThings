'<img id="img1" src="http://192.168.8.1:8083/?action=stream" style="width: 320px; height: 240px;">'
'avalible resolution: 1280x720(变形),640*480,320*240,320*180,800*600,848*480,640*360(花屏),1280*800'
import os
def open_live():
    os.system("ffplay -i http://192.168.8.1:8083/?action=stream")

import datetime
import time
import cv2
url="http://192.168.8.1:8083/?action=stream"
WindowName=f"{url}-Video" # 窗口标题
SavePath=r".\Pictures"
def Getimg():
    Cap=cv2.VideoCapture(url)
    print(Cap.isOpened())
    cv2.namedWindow(WindowName, 0)
    cv2.resizeWindow(WindowName, 320, 200)
    while (Cap.isOpened()):
        dt_ms=datetime.datetime.now().strftime('%Y-%m-%d %H:%M:%S.%f')
        dt_msnodate=datetime.datetime.now().strftime('%H%M%S.%f')
        print(dt_ms)
        ret, frame=Cap.read() # ret是读取成功与否，bool
        cv2.namedWindow(WindowName, 0)
        cv2.namedWindow(WindowName, cv2.WINDOW_NORMAL|cv2.WINDOW_KEEPRATIO) 
        cv2.imshow(WindowName, frame)
        print(f'{SavePath}\{dt_msnodate}.jpg')
        print(cv2.imwrite(f'{SavePath}\{dt_msnodate}.jpg',frame)) # 文件名不能有Windows禁止的符号
        if cv2.waitKey(1)&0xFF==ord('q'):
            break
        if cv2.getWindowProperty(WindowName,0)==-1: # 可以关闭后停止运行
            break
        time.sleep(0.25) # 休息一下吧
    Cap.release()
    cv2.destroyAllWindows()

if __name__=='__main__':
    Getimg()