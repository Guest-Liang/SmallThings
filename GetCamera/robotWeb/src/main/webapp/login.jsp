<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Login</title>
<style type="text/css">
@font-face {
    font-family: regular;
    src: url("../data/fonts/regular.ttf") format("truetype");
}

@font-face {
    font-family: bold;
    src: url("../data/fonts/bold.ttf") format("truetype");
}

*{
    margin: 0;
    padding: 0;
    background-color: #fff;
    font-family: regular,"Microsoft YaHei UI Medium",sans-serif;
}

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

h1{
    color:#352b53;
    font-family: bold,"Microsoft YaHei Heavy",sans-serif;
    margin-top:130px;
    margin-bottom: 30px;
    margin-left:50px;
}

.signup-box{
    width: 500px;
    height: 500px;
    margin:auto;
    position:absolute;
    top:0;
    bottom:0;
    left:0;
    right:0;
}

.signup-logo{
    transform: scale(1.5);
    background-color:rgba(0,0,0,0);
    float: left;
    margin-top: 50px;
   margin-left: 160px;
}

.signup-logo .logo,
.signup-logo .com-name{
    background-color: rgba(0,0,0,0);
}

.signup-logo .logo{
    height: 50px;
}

.signup-logo .com-name{
    height:40px;
}

.signup-list{
    /*background-color: #6cf;*/
    width: 80%;
    height: 50px;
    border-bottom: #e5e5e5 solid 1px;
    margin:30px 50px;
}

.signup-list img {
    float: left;
    height: 20px;
    margin: 15px 0;

}

.signup-list input{
    width: 250px;
    height: 50px;
    border:none;
    outline:none;
    font-size: 18px;
    margin-left:10px;
}

#verification{
    width: 250px;
}

#user{
    width: 24px;
}

#lock{
    width: 24px;
}

.signup-list.button{
    width: 100px;
    height: 40px;
    margin: 5px;
    background-color: #e6deff;
    border-radius: 10px;
    font-size: 14px;
    color: #706697;
    transition: background-color 0.3s ease;
}

.signup-list .button:hover{
    background-color: #ccc8e7;
}

a{
    text-decoration: none;
    color:#8157b2;
    margin: 20px 50px;
}

:checked{
    text-decoration: none;
    color:#8157b2;
}

input[type="submit"]{
    width: 50%;
    height: 50px;
    background-color: #e6deff;
    color: #706697;
    border:none;
    border-radius: 10px;
    font-size: 18px;
    margin: -10px auto 20px 130px;
    box-shadow: 0px 4px 4px rgba(0, 0, 0, 0.25);
}

.box-content>span{
    color: #696d72;
    font-size: 18px;
}

input[type="submit"]:hover{
    background-color: #b7afe8; 
}
</style>
</head>
<body>
 <div class="signup-box" > 
	<div class="signup-logo">
	<img class="logo" src="upload/data/img/logo.svg" alt="聚智领航图标">
	<img class="com-name" src="upload/data/img/com-name.png" alt="company-name">
</div>
		<h1>Welcome to login</h1>
		<%if(request.getAttribute("msg") !=null){ %>
			<p style="color:red;margin-top:-10px;text-align: center;"><%=request.getAttribute("msg") %></p>
			<%} %>
		<form action="loginServlet" method="post">
			<div class="signup-list">
				<img src="upload/data/img/user-circle.svg" alt="mail">			
				<label>
					<input type="text" name="username" placeholder="Please enter the username">
				</label> 
			</div>
			<div class="signup-list">
				<img src="upload/data/img/lock.svg" alt="lock" id="lock">
				<label>
					<input id="verification" type="text" name="password" placeholder="Please enter the password">
				</label>
			</div>		
			<input type="submit" value="Login">		
		<span><a href="register.jsp">Register</a></span>
		</form>
</div>
</body>
</html>