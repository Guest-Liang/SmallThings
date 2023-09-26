<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style type="text/css">
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
<div class="header">
	<ul>
		<% if(request.getSession().getAttribute("LOGIN_USER")!=null){ %>
		<a href="profile.jsp"><li>个人主页</li></a>
		<a href="history.jsp"><li>探索历史</li></a>
		<a href="history_add.jsp"><li>添加记录</li></a>
		<%}%>
		<% if(request.getSession().getAttribute("LOGIN_USER")==null){ %>
		<!--未登录-->
			<a href="login.jsp"><li>登录</li></a>
			<a href="register.jsp"><li>注册</li></a>
		<%}else{%>
			<a href="logout.jsp"><li>退出</li></a>
		<%}%>

	</ul>
</div>