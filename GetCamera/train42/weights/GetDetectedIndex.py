import os
import time
print("正在运行，请稍等")
os.system('python demo.py > output.txt 2>&1') # 复写文件，不做追加
print("识别完成，正在导出结果")
time.sleep(1)
print(os.path.getsize(r'./output.txt'))
dataraw=open(r'./output.txt', encoding='utf-8').readlines()
open(r'./output.txt','w').writelines(dataraw[7:len(dataraw)-2]) # 先筛出准确记录
data=open(r'./output.txt', encoding='utf-8').readlines()
open(r'./output.txt', 'w').writelines(item for item in data if '(no detections)' not in item)
print(os.path.getsize(r'./output.txt'))