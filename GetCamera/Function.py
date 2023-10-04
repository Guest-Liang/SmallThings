'<img id="img1" src="http://192.168.8.1:8083/?action=stream" style="width: 320px; height: 240px;">'
'avalible resolution: 1280x720(变形),640*480,320*240,320*180,800*600,848*480,640*360(花屏),1280*800'
import os
import datetime
import time
import cv2
import serial
import serial.tools.list_ports
import matplotlib
import threading

url="http://192.168.8.1:8083/?action=stream"
WindowName=f"{url}:Video" # 窗口标题
def open_live():
    os.system("ffplay -i http://192.168.8.1:8083/?action=stream")

#从摄像头读取图像
SavePath=r"D:\files\VSCode\SmallThings\GetCamera\Pictures"
def Getimg():
    Cap=cv2.VideoCapture(url)
    # Cap.set(cv2.CAP_PROP_FOURCC, cv2.VideoWriter_fourcc('M', 'J', 'P', 'G'))
    i=1
    print(Cap.isOpened())
    cv2.namedWindow(WindowName, 0)
    cv2.resizeWindow(WindowName, 320, 200)
    while (Cap.isOpened()):
        dt_ms=datetime.datetime.now().strftime('%Y-%m-%d %H:%M:%S.%f')
        dt_hms=datetime.datetime.now().strftime('%H%M%S')
        dt=datetime.datetime.now().strftime("%Y%m%d")
        print(dt_ms)
        ret, frame=Cap.read() # ret是读取成功与否，bool
        cv2.namedWindow(WindowName, 0)
        cv2.namedWindow(WindowName, cv2.WINDOW_NORMAL | cv2.WINDOW_KEEPRATIO) 
        cv2.imshow(WindowName, frame)
        s = '%05d' % i
        print(f'{SavePath}\{dt}_{s}.jpg')
        print(cv2.imwrite(f'{SavePath}\{dt}_{s}.jpg',frame)) # 文件名不能有Windows禁止的符号
        if cv2.waitKey(1) & 0xFF == ord('q'):
            break
        if cv2.getWindowProperty(WindowName,0)==-1: # 可以关闭后停止运行
            break
        time.sleep(0.1) # 休息一下吧
        # 不限制20张/s
        i = i + 1
    Cap.release()
    cv2.destroyAllWindows()

# 从蓝牙读数据并画图
def ReadBluetooth():
    Ser=serial.Serial('COM4', 115200)
    if Ser.isOpen():
        print("串口已打开")
    else:
        print("串口打开失败")
    DataList=[]
    nowtime=datetime.datetime.now()
    while datetime.datetime.now() - nowtime < datetime.timedelta(seconds=10):
    # while True:
        Data=Ser.readline().decode('utf-8').replace('\r\n','')
        Elements=Data.split(',')
        if len(Elements) != 3:
            Elements = [0] * 3
        DataList.append((Elements[0], Elements[1], Elements[2]))
    Ser.close()
    print(DataList)
    # while True:
    #     Data=Ser.readline().decode('utf-8').replace('\r\n','')
    #     print(Data)

Threads=[]
# Threads.append(threading.Thread(target=Getimg))
Threads.append(threading.Thread(target=open_live))
# Threads.append(threading.Thread(target=ReadBluetooth))

if __name__=='__main__':
    # for t in Threads:
    #     t.start()
    # for t in Threads:
    #     t.join()
    # Getimg()
    open_live()
    # ReadBluetooth()
    # 'http://ni012.gl-inet.com/'