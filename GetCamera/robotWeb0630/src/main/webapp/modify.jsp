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
<title>修改机器人名称</title>
<style type="text/css">
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
	display: block;
	width: 80%;
	height: 28px;
	line-height: 28px;
	text-align: center;
	float: right;
	margin: 10px 15px 0 0;
}
.submit_btn input{width: 80px;}
.h_title {
	text-align: center;
}
.reg_div {
	width: 380px;
	margin: auto;
}
.h_title {
	text-align: center;
}
</style>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<div class="reg_div">
		<div class="h_title">
			<h3>修改机器人名称</h3>
		</div>
		<%
		//查询要修改的机器人信息
		Integer id = Integer.parseInt(request.getParameter("id"));
		RobotDAO dao = new RobotDaoImpl();
		RobotInfo robot = dao.findRobotById(id);
		%>
		<form action="updateRobotServlet" method="post">
			<label>当前名称</label><input type="text" value="<%=robot.getRobotName()%>" readonly="readonly"/><br />
			<label>新名称</label><input type="text" name="newName"/><br />
			<div class="submit_btn">
				<input type="hidden" value="<%=robot.getRobotId()%>" name="id">
				<input type="submit" value="提交">
			</div>
		</form>
	</div>
</body>
</html>