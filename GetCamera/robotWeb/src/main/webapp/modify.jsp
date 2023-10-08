<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ page import="java.util.*"%>
	<%@ page import="robotWeb.vo.*"%>
	<%@ page import="robotWeb.dao.*"%>
	<%@ page import="robotWeb.dao.impl.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Modify</title>
<style type="text/css">

body{
    background-color: #F7F4FD;
    background-image: url("upload/data/img/login-bg.svg");
    background-size: cover;
    background-repeat: no-repeat;
    background-position: top right;
    min-height: 900px;
    min-width: 800px;
    width: 100vw;
    height: 100vh;
}

label {
	width: 90px;
	height: 28px;
	display: inline-block;
	text-align: right;
	padding-right: 10px;
}

input {
	width: 200px;
	height: 28px;
	border: #06F 1px solid;
	border-radius: 3px;
	margin: 5px 0 5px 0;
}

.submit_btn {
	width: 100%;
	height: 50px;
	line-height: 50px;
	text-align: center;
	margin: 10px 10px 0 0;		
	display: flex;
    justify-content: center; 
    align-items: center; 
    
}
.submit_btn input{
	width: 80px;
	font-size: 18px;
	height: 40px;
}


.h_title {
	text-align: center;
	margin-top: 130px;
    margin-bottom: 30px;
}
.reg_div {
	width: 380px;
	margin: auto;
}
.h_title {
	text-align: center;
}

h1{
    color:#352b53;
    font-family: bold,"Microsoft YaHei Heavy",sans-serif;
    margin-top:130px;
    margin-bottom: 30px;
    margin-left:50px;
}

.submit_btn input[value="submit"]:hover {
    box-shadow:  0px 4px 4px 0px rgba(0, 0, 0, 0.25);
}
</style>
</head>
<body>
	<div class="reg_div">
	<div class="h_title">
	<h1>Modify the name</h1>
					
		</div>
		<%
		//查询要修改的机器人信息
		Integer id = Integer.parseInt(request.getParameter("id"));
		RobotDAO dao = new RobotDaoImpl();
		RobotInfo robot = dao.findRobotById(id);
		%>
		<form action="updateRobotServlet" method="post">
			<label>Former</label><input type="text" value="<%=robot.getRobotName()%>" readonly="readonly"/><br />
			<label>New</label><input type="text" name="newName"/><br />
			<div class="submit_btn">
				<input type="hidden" value="<%=robot.getRobotId()%>" name="id">
				<input type="submit" value="submit" style="background-color: #897ADF;border: none; color: #ffffff;font-weight:bold;">
			</div>
		</form>
	</div>
</body>
</html>