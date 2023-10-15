import turtle
import serial
import datetime

Ser=serial.Serial('COM4', 9600)
movetest=['前进','左转','左转','左转','前进','前进','左转','左转','左转','右转','右转','右转','左转','左转','左转','前进','前进','前进','前进','左转','左转','左转','前进','前进','左转','左转','前进','前进','左转','前进','前进']
if Ser.isOpen():
    print("串口已打开")
else:
    print("串口打开失败")
    exit()
turtle.setup(750,450,400,150)
turtle.penup()
turtle.goto(0,-100)
turtle.pendown()
turtle.pensize(5)
turtle.pencolor("pink")
nowtime=datetime.datetime.now()
# while datetime.datetime.now() - nowtime < datetime.timedelta(seconds=10):
while True:
    move=Ser.readline().decode('utf-8').replace('\r\n','')
    # print(move)
# for move in movetest:
    if move=='前进':
        turtle.fd(50)
    if move=='左转':
        turtle.circle(30, 30)
    if move=='右转':
        turtle.circle(-30, 30)
    if move=='后退':
        turtle.fd(-5)
    if (Ser.isOpen() == 0):
        break
Ser.close()
turtle.done()