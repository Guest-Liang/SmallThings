import datetime
import time
import serial
import serial.tools.list_ports
import matplotlib


# 从蓝牙读数据并画图
def ReadBluetooth_Ultrasonic():
    Ser=serial.Serial('COM4', 9600)
    if Ser.isOpen():
        print("串口已打开")
    else:
        print("串口打开失败")
    DataList=[]
    nowtime=datetime.datetime.now()
    while datetime.datetime.now() - nowtime < datetime.timedelta(seconds=10):
    # while True:
        Data=Ser.readline().decode('utf-8').replace('\r\n','')
        print(Data)
        # Elements=Data.split(',')
        # if len(Elements) != 3:
        #     Elements = [0] * 3
        # DataList.append((Elements[0], Elements[1], Elements[2]))
    Ser.close()

def ReadBluetooth_MPU():
    Ser=serial.Serial('COM4', 9600)
    if Ser.isOpen():
        print("串口已打开")
    else:
        print("串口打开失败")
    nowtime=datetime.datetime.now()
    while datetime.datetime.now() - nowtime < datetime.timedelta(seconds=10):
    # while True:
        Data=Ser.readline().decode('utf-8').replace('\r\n','')
        print(Data)
    Ser.close()

if __name__=='__main__':
    # ReadBluetooth_Ultrasonic()
    ReadBluetooth_MPU()