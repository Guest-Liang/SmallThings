<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>首页</title>
	<style type="text/css">
		.reg_div {
			width: 680px;
			margin: auto;
		}
		a{text-decoration: none;color:#333;}
		a:hover, a:visited, a:link, a:active {
			color:#3f7f7f;
		}
		.header{
			width: 800px;
			margin: 0 auto;
			text-align: center;
			background-color: #4d6782;
		}
		.header ul{
			margin: 0;
			padding: 0;
			list-style: none;
		}
		.header li{
			display: inline-block;
			width: 100px;
			height: 45px;
			line-height: 45px;
			color: #fff;
			text-align: center;
		}
		.header li:hover{
			background-color: #5c9dba;
			cursor: pointer;
		}
		.header a{text-decoration: none;color:#fff;}
		.header a:hover, a:visited, a:link, a:active {
			color:#fff;
		}
	</style>
</head>
<body>
<div class="header">
	<ul>
		<!--未登录-->
		<a href="login.jsp"><li>登录</li></a>
		<a href="register.jsp"><li>注册</li></a>
	</ul>
</div>
<div class="reg_div">
	<%
		request.getSession().removeAttribute("LOGIN_USER");
	%>
	<h3 style="text-align: center;">已退出登录</h3>
</div>
</body>
</html>