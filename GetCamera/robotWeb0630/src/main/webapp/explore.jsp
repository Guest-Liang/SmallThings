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
.exp-btns .btn{
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
.exp-info{
	float: left;
	width: 60%;
	border: 1px solid #41A8A8;
}
.exp-info p{
	margin: 10px 0;
	text-align: center;
}
.exp-info .title{
	color: #41A8A8;
	font-weight: bold;
}
.exp-btns{
	float: right;
	width: 35%;
}
</style>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<div class="reg_div">
		<h3 style="text-align: center;">机器人探索页面</h3>
		<div class="exp-info">
			<p class="title">探索信息</p>
			<p>探索实况：</p>
			<p>宝藏图片：</p>
			<p>机器人未开始探索：</p>
		</div>
		<div class="exp-btns">
			<div class="btn">开始探索</div>
		</div>
	</div>
</body>
</html>