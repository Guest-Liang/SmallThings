import pymysql
mysql_host = "localhost"
mysql_port = 3306
mysql_db = 'robotWebdb'
mysql_user = "root"
mysql_passwd = '1023mysql'

#连接操作：编码格式的指定，默认返回数据类型的指定 
conn = pymysql.Connect(host=mysql_host, user=mysql_user, password=mysql_passwd, 
                       db=mysql_db, port=mysql_port, charset="utf8mb4", cursorclass=pymysql.cursors.DictCursor)
