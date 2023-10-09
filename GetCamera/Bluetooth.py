import datetime
import time
import serial
import serial.tools.list_ports
import matplotlib


# 从蓝牙读数据
def ReadBluetooth():
    Ser=serial.Serial('COM4', 9600)
    if Ser.isOpen():
        print("串口已打开")
    else:
        print("串口打开失败")
    nowtime=datetime.datetime.now()
    # while datetime.datetime.now() - nowtime < datetime.timedelta(seconds=10):
    while True:
        Data=Ser.readline().decode('utf-8').replace('\r\n','')
        print(Data)
        if (Ser.isOpen() == 0):
            break
    Ser.close()

if __name__=='__main__':
    ReadBluetooth()