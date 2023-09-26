<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="robotWeb.vo.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>首页</title>
<style type="text/css">
.reg_div {
	width: 680px;
	margin: auto;
	color: #555;
}
a{text-decoration: none;color:#333;}
 a:hover, a:visited, a:link, a:active {
    color:#fff;
}
.reg_div .btn{
	width: 180px;
	display: inline-block;
	text-align: center;
	height: 35px;
	line-height: 35px;
	background-color: #41A8A8;
	margin: 0 auto;
	border-radius: 5px;
}
.reg_div .connect{
	display: block;
}
.reg_div .a-btn{
	display: inline-block;
	text-align: center;
	height: 35px;
	line-height: 35px;
	line-height: 35px;
	padding: 0 15px;
	margin: 0 10px;
	font-size: 14px;
	color: #fff;
	cursor: pointer;
	border-radius: 5px;
}
.reg_div .abtn1{
	background-color: #41A8A8;
}
.reg_div .abtn2{
	background-color: #D77F57;
}
</style>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<div class="reg_div">
		<%
		UserInfo user = (UserInfo)request.getSession().getAttribute("LOGIN_USER");
		%>
		<h3 style="text-align: center;">欢迎您，<%=user.getUsername() %></h3>
		<%
			if(request.getAttribute("robot")==null){%>
				<h3 style="text-align: center;">连接状态：<span style="color:#D77F57;">尚未连接机器人</span></h3>
				<div class="btn connect"><a  href="connectRobotServlet">连接机器人</a></div>
		<%}else{%>
				<h3 style="text-align: center;">连接状态：<span style="color:#41A8A8;">您已成功连接机器人</span></h3>
				<h3 style="text-align: center;">机器人信息：<span style="color:#41A8A8;">${robot.robotName }</span>
				<a class="a-btn abtn1" href="modify.jsp?id=${robot.robotId }">修改</a><a class="a-btn abtn2" href="revokeRobotServlet?id=${robot.robotId }">撤销</a></h3>
				<div style="text-align: center;margin: 10px 0;">
					<div class="btn"><a  href="history.jsp">历史探索记录查询</a></div>
					<div class="btn" style="background-color: #D77F57;"><a  href="explore.jsp">开始探索宝藏</a></div>
				</div>
		<%}%>
	</div>
</body>
</html>