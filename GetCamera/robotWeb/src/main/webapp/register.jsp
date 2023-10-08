<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Register</title>
<style type="text/css">
@font-face {
    font-family: regular;
    src: url("upload/data/fonts/regular.ttf") format("truetype");
}

@font-face {
    font-family: bold;
    src: url("upload/data/fonts/bold.ttf") format("truetype");
}

*{
    margin: 0;
    padding: 0;
    background-color: #fff;
    font-family: regular,"Microsoft YaHei UI Medium",sans-serif;
}

body{
    background-color: #ffffff;
    background-image: url("upload/data/img/signup-bg.svg");
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
    margin-bottom: 30px;
}

.signup-box{
    width: 900px;
    height: 600px;
    margin:auto;
    position:absolute;
    top:0;
    bottom:0;
    left:0;
    right:0;
}

.signup-logo{
    background-color:rgba(0,0,0,0);
    float: left;
    margin-top: 15px;
    margin-left: 15px;
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

.box-bg{
    float: left;
    width: 336px;
    height: 100%;
    background-image: url("upload/data/img/box-bg.png");
    background-size: auto 100%;
}

.box-content{
    float:left;
    width: 564px;
    height: 100%;
    box-sizing: border-box;
    padding:30px 50px;
}

.signup-list{
    width: 100%;
    height: 50px;
    border-bottom: #e5e5e5 solid 1px;
    margin:30px 0;
}

.signup-list img {
    float: left;
    height: 20px;
    margin: 15px 0;
}

.signup-list input{
    width: 400px;
    height: 50px;
    border:none;
    outline:none;
    margin-left:20px;
    font-size: 18px;
}

#verification{
    width: 300px;
}

#lock{
    width: 24px;
}

.signup-list .button{
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

.select label{
    color: #4E1292;
}

.select select{
    display: flex;
    width: 100%;
    height: 40px;
    border: #4E1292 dashed 1px;
    border-radius: 10px;
    padding-left: 15px;
    margin-top:15px;
    color: #696d72;
}

.input-radio{
    box-sizing: border-box;
    padding:40px 10px 20px 10px;
    width: 100%;
    line-height: 30px;
    color: #696d72;
}

a{
    text-decoration: none;
    color:#8157b2;
}

:checked{
    text-decoration: none;
    color:#8157b2;
}

.submit_btn{
    width: 50%;
    height: 50px;
    background-color: #e6deff;
    color: #706697;
    border:none;
    border-radius: 10px;
    line-height: 50px;
    text-align: center; 
    font-size: 18px;
    font-weight:bold;
    margin: -10px auto 20px 130px; 
    box-shadow: 0px 4px 4px rgba(0, 0, 0, 0.25);
}


.box-content>span{
    color: #696d72;
    font-size: 18px;      
}

.submit_btn:hover {
    background-color: #b7afe8; 
}
</style>
</head>
<body>
<div class="signup-logo" onclick="window.location.href='index.jsp'">
	<img class="logo" src="upload/data/img/logo.svg" alt="聚智领航图标">
	 <img class="com-name" src="upload/data/img/com-name.png" alt="company-name">
</div>
<div class="signup-box">
	<div class="box-bg"></div>
	<div class="box-content">
		<h1>Welcome to Register</h1>
		<form action="" method="post">
			<div class="signup-list">
				<img src="upload/data/img/user-circle.svg" alt="mail">
				<label>
					<input type="text" placeholder="Please enter the username">
				</label>
			</div>
			<div class="signup-list">
				<img src="upload/data/img/lock.svg" alt="lock" id="lock">
				<label>
					<input id="verification" type="text" placeholder="Please enter the password">
				</label>
			</div>
			<div class="select">
				<label>Account Type
					<select name="account-type" id="account-type">
						<option value="1">Personal Account</option>
						<option value="2">School Account</option>
						<option value="3">Business Account</option>
						<option value="4">Other Type</option>
					</select>
				</label>
			</div>
			<div class="input-radio">
				<label>
					<input type="radio" name="agree" id="agree">
					I have read and agree<a href="#">《"RoboMaze Explorer Hub" User Service Agreement》</a>、
					<a href="#">《"RoboMaze Explorer Hub" Privacy Policy》</a>
				</label>
			</div>
			<div class="submit_btn" onclick="window.location.href = 'login.jsp'">
			        Register
			</div>
		</form>
		<span>Already have an account?<a href="login.jsp">  Login now</a></span>
	</div>
</div>
</body>
</html>