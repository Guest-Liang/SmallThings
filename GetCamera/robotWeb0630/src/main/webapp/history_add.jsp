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
<title>添加探索记录</title>
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
	width: 60%;
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
.h_title {
	text-align: center;
}
.reg_div {
	width: 320px;
	margin: auto;
}
</style>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
	<div class="reg_div">
		<div class="h_title">
			<h3>添加探索记录</h3>
		</div>
		<!-- 
		robotId
		Treasuretype
		Treasure_Count
		begintime
		endtime
		img
		 -->
		<form action="SaveHistoryServlet" method="post" enctype="multipart/form-data">
			<label>机器人</label>
				<select name="robotId">
					<%
					RobotDAO dao = new RobotDaoImpl();
					List<RobotInfo> list = dao.findAllRobots();
					for(int i=0; i<list.size(); i++) {%>
					<option value="<%=list.get(i).getRobotId() %>"><%=list.get(i).getRobotName() %></option>
					<%} %>
				</select>
			<br />
			<label>宝藏类型</label>
				<select name="treasuretype">
					<option value="common">普通</option>
					<option value="special">珍稀</option>
				</select>
			<br />
			<label>寻宝数量</label><input type="number"  name="treasureCount"/><br />
			<label>开始时间</label><input type="time"  name="begintime"/><br />
			<label>结束时间</label><input type="time"  name="endtime"/><br />
			<label>图片</label><input type="file" name="file"><br />
			<div class="submit_btn">
				<input type="submit" value="提交">
			</div>
		</form>
	</div>
</body>
</html>