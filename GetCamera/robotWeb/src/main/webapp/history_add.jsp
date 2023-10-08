<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="robotWeb.*"%>
<%@ page import="robotWeb.dao.*"%>
<%@ page import="robotWeb.vo.*"%>
<%@ page import="robotWeb.dao.impl.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Add Record</title>
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
/* 	display: block; */
	width: 100%;
	height: 50px;
	line-height: 50px;
	text-align: center;
/* 	float: right; */
	margin: 10px 10px 0 0;	
	
	display: flex;
    justify-content: center; /* 水平居中 */
    align-items: center; /* 垂直居中 */
}
.submit_btn input{width: 80px;font-size: 18px;height: 40px;}
.h_title {
	text-align: center;
}
.h_title {
	text-align: center;
}
.reg_div {
	width: 320px;
	margin: auto;
}

.submit_btn input[value="submit"]:hover {
    box-shadow:  0px 4px 4px 0px rgba(0, 0, 0, 0.25);
}
</style>
</head>
<body>
<jsp:include page="headers.jsp"></jsp:include>
	<div class="reg_div">
		<div class="h_title">
<!-- 			<h3>Add Exploration Record</h3> -->
			<h2>Add the Record</h2>
		</div>
		<form action="SaveHistoryServlet" method="post" enctype="multipart/form-data">
			<label>Robot</label>
				<select name="robotId">
					<%
					RobotDAO dao = new RobotDaoImpl();
					List<RobotInfo> list = dao.findAllRobots();
					for(int i=0; i<list.size(); i++) {%>
					<option value="<%=list.get(i).getRobotId() %>"><%=list.get(i).getRobotName() %></option>
					<%} %>
				</select>
			<br />
			<label>Type</label>
				<select name="treasuretype">
					<option value="common">normal</option>
					<option value="special">precious</option>
				</select>
			<br />
			<label>Number</label><input type="number"  name="treasureCount"/><br />
			<label>Start Time</label><input type="time"  name="begintime"/><br />
			<label>End Time</label><input type="time"  name="endtime"/><br />
			<label>Image</label><input type="file" name="file"><br />
			<div class="submit_btn">
				<input type="submit" value="submit" style="background-color: #897ADF;border: none; color: #ffffff;font-weight:bold;">
			</div>
		</form>
	</div>
</body>
</html>