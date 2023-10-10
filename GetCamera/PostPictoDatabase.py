import requests
# Headers = {'Content-Type': 'multipart/form-data'}
Url='http://127.0.0.1:8080/robotWeb/UploadPictureServlet'
Files={'file':open(r"D:\files\VSCode\SmallThings\GetCamera\train42\testimage\5.jpg",'rb')}
response=requests.post(Url,files=Files)
print(response.text)
print(response.status_code)