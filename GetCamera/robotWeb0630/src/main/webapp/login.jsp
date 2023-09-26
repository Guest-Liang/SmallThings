<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>用户登录</title>
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
			<h3>用户登录</h3>
			<%if(request.getAttribute("msg") !=null){ %>
			<p style="color:red;"><%=request.getAttribute("msg") %></p>
			<%} %>
		</div>
		<form action="loginServlet" method="post">
			<label>用户名</label><input type="text"  name="username"/><br />
			<label>密码</label><input type="password" name="password"/><br />
			<div class="submit_btn">
				<input type="submit" value="登录">
				<a href="register.jsp"><input type="button" value="注册"></a>
			</div>
		</form>
	</div>
</body>
</html>