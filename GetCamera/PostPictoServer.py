import requests
Url='http://127.0.0.1:8080/robotWeb/UploadPictureServlet'
Headers = {'Content-Type': 'multipart/form-data'}
files = {'file': ('image.jpg', open('image.jpg', 'rb'), 'image/jpeg')}

response = requests.post(Url, headers=Headers, files=files)

print(response.text)  # 输出接口返回的内容