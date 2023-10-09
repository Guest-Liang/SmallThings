import os
import time
import datetime
print("正在运行，请稍等")
nowtime=datetime.datetime.now().strftime('%Y%m%d')
os.system(f'python demo.py > {nowtime}output.txt 2>&1') # 复写文件，不做追加
print("识别完成，正在导出结果")
time.sleep(1)
print(os.path.getsize(f'./{nowtime}output.txt'))
data=open(f'./{nowtime}output.txt', encoding='utf-8').readlines()
# open(f'./{nowtime}output.txt','w').writelines(dataraw[7:len(dataraw)-2]) # 先筛出准确记录
# data=open(f'./{nowtime}output.txt', encoding='utf-8').readlines()
# open(f'./{nowtime}output.txt', 'w').writelines(item for item in data if '(no detections)' not in item)
open(f'./{nowtime}output.txt', 'w').writelines(item for item in data if 'book' in item or 'key' in item or 'cube' in item)
print(os.path.getsize(f'./{nowtime}output.txt'))