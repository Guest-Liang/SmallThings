import os
import datetime
import time
import requests
import cv2
import numpy
import matplotlib
useragent='Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/117.0.0.0 Safari/537.36 Edg/117.0.2045.31'
header={'User-Agent':useragent}
postdata={'password':'11111111'}
portandaction='' #进后台找
url=f"192.168.8.1:{portandaction}"
response = requests.post(url,data=postdata,headers=header) #登录
print(f"statusCode = {response.status_code}")
print(f"text = {response.text}")
WindowName="video"
SavePath=r"./"
def open_live():
    os.system("ffplay -i f{url}")
    time.sleep(0.2)
    print(os.path.join('c','Windows','test.png')) #图片名字
def Getimg():
    Cap=cv2.VideoCapture(url)
    print(Cap.isOpened())
    cv2.namedWindow(WindowName, 0)
    cv2.resizeWindow(WindowName, 320, 200)
    while (Cap.isOpened()):
        dt_ms=datetime.datetime.now().strftime('%Y-%m-%d %H:%M:%S.%f')
        dt_msnodate=datetime.datetime.now().strftime('%H-%M-%S.%f')
        print(dt_ms)
        ret, frame=Cap.read()
        if(ret==False):
            break
        npar=numpy.array(frame)
        cv2.imshow(WindowName, frame)
        print(cv2.imwrite(f'{SavePath}\{dt_msnodate}.jpg',frame))
        if cv2.waitKey(1)&0xFF==ord('q'):
            break
    Cap.release()
    cv2.destroyAllWindows()
    matplotlib.pyplot.imshow(npar)

open_live()
Getimg()