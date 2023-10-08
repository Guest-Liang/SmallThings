 <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Welcome to the RoboMaze Explorer Hub</title>
<style type="text/css">
.sidebar {
    box-sizing: border-box;
    height: 70px;
    width: 100%;
    background-color: #ffffff;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    display: block;
    vertical-align:middle;
    padding-left:40px;
}

.sidebar .logo {
    float:left;
    height: 60px;
    margin:10px 0;
}

.com-name{
    float: left;
    margin:10px 20px 10px 0;
    height: 40px;
    margin-top:20px;
    margin-left:10px;
}

.menu {
    box-sizing: border-box;
    float: right;
    list-style-type: none;
    padding-right: 20px;
}

.menu li {
    padding: 0 15px;
    display: inline;
    line-height:60px;
}

.menu li a {
    text-decoration: none;
    color: #000000;
    transition: color 0.3s ease;
}

.menu li a:hover {
    color: #4f1392;
}

.content {
    box-sizing: border-box;
    flex-grow: 1;
    background-color: #f4f1ff;
    background-image: url("../data/img/head-bg.svg");
    background-repeat: no-repeat;
    background-size: cover;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    height: 800px;
    width: 100%;
}

.content h1 {
    font-size: 45px;
    color: #2d1d61;
    margin-bottom: 10px;
}

.text p {
    color: #7e788c;
    margin-bottom: 20px;
}

button {
     background-color: #e6deff; 
     color: #706697; 
     border: none; 
    padding: 10px 20px;
    font-size: 18px;
    font-weight: bold;    
    cursor: pointer;
    transition: background-color 0.3s ease;
 	box-shadow: 0px 4px 4px 0px rgba(0, 0, 0, 0.25); 
    border-radius: 10px;
}

button:hover {
    background-color: #b7afe8;
}

.text{
    box-sizing: border-box;
    float: left;
    width: 50%;
    padding:15% 2% 15% 7%;
}

.photo {
    position: absolute;
    width: 1075px;
    height: 624px;
    left: 562px;
    right: -197px;
    top: 200px;
    bottom: 69px;
}

.photo img{
    height: 100%;
    text-align: center;
        right: -100px;
}
.photoo img{
    position: absolute;
    width: 151px;
    height: 114px;
    left: 450px;
    right: 772px;
    top: 300px;
    bottom: 466px;
}
</style>
</head>
<body>
<div class="container">
    <div class="sidebar">
       <a href="./index.jsp"> 
            <img class="logo" src="upload/data/img/logo.svg" alt="聚智领航图标">
             <img class="com-name" src="upload/data/img/com-name.png" alt="company-name">
        </a>
        <ul class="menu">
            <li><a href="#">Products and Services</a></li>
            <li><a href="#">Cases and Reviews</a></li>
            <li><a href="#">News and Events</a></li>
            <li><a href="#">About Us</a></li>
            <li><a href="#">Contact Us</a></li>
            <li><button onclick="window.location.href='register.jsp'">Register</button></li>
            <li><button onclick="window.location.href='login.jsp'"> Login</button></li>
        </ul>
    </div>
    <div class="content">
       <div class="text">
           <h1>Welcome to the
               RoboMaze Explorer Hub</h1>
           <p>Navigating with collecting wisdom:Pioneering the construction and application</p>
           <button onclick="window.location.href='index.jsp'">Group 9</button>

       </div>
        <div class="photo">
            <img src="upload/data/img/head-photo.png" alt="heading-photo">
        </div>

        <div class="photoo">
            <img src="upload/data/img/des-photo.png" alt="des-photo">
        </div>
    </div>
</div>
</body>
</html>