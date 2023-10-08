<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="robotWeb.vo.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Profile</title>
<style type="text/css">

.abtn1{
position: absolute;
width: 100.92px;
height: 43px;
left: 965px;
top: 326px;
box-sizing: border-box;
border: 1px solid rgb(52, 26, 198);
box-shadow: 0px 4px 4px 0px rgba(52, 26, 198, 0.25);
border-radius:9px;

}

.abtn2{
position: absolute;
width: 100.92px;
height: 43px;
left: 1088px;
top: 326px;
box-sizing: border-box;
border: 1px solid rgb(52, 26, 198);
box-shadow: 0px 4px 4px 0px rgba(52, 26, 198,  0.25);
border-radius:9px;
}

.graph-plus-text {
    width: 100%;
    background-color: #fff;
    background-image: url("upload/data/img/Service 01.svg");
    background-repeat: no-repeat;
    background-size: cover; 
    height: 600px;
    width: 100%;
    text-align: center;
}

.div-img {
    margin: 20px;
    padding: 20px;
}

.div-text {
    position: relative;
    text-align: center
}

.graph-title-text {
    font-size: 36px;
    position: absolute;
    width: 512px;
	height: 49px;
	left: 557px;
	right: 371px;
	top: 39px;
    font-family:"Microsoft YaHei UI Medium",sans-serif;
	font-weight: 700;
	line-height: 130%;
	letter-spacing: 0px;
	text-align: left;
    color: rgb(45,29,97);
    width: 60%;    
}

.graph-body-text {
    position: absolute;
	height: 49px;
	left: 328px;
	right: 100px;
	top: 106px;
	color: rgb(45, 29, 97);
	font-family: Poppins;
	font-size: 36px;
	font-weight: 700;
	line-height: 130%;
	letter-spacing: 0px;
	text-align: left;
}

.graph-body-texts { 
  position: absolute;
	height: 49px;
	left: 457px;
	top: 326px;
	color: rgb(45, 29, 97);
	font-family: Poppins;
	font-size: 36px;
	font-weight: 700;
	line-height: 130%;
	letter-spacing: 0px;
	text-align: left;
}   

.play-plus-text {
	position: absolute;
	width: 193px;
	height: 58px;
	left: 600px;
	top: 330px;
	border-radius:9px;
	background-color: #8172D4; 
} 

.img-text {
	line-height: 60px;
	font-weight: 700;
	letter-spacing: 0.3px;
	text-decoration: none;
	font-family: Poppins;
	font-size: 24px;
	color: #FFFFFF;
	align-items: center;
}  

.text {
    line-height: 100px;
    color: #341AC6;
    text-decoration: none; 
    margin-left: 10px;   
	position: absolute;
	font-family: Poppins;
	font-size: 22px;
	    margin-top:3px;
	font-weight: 700;
	line-height: 170.19%;
	letter-spacing: 0.3px;
	text-align: center;
	display: flex;
	flex-direction: row;
	align-items: center;
}

.texts{
    line-height: 100px;
    color: #341AC6;
    text-decoration: none; 
    margin-left: 20px;
    margin-top:3px;   
	position: absolute;
	font-family: Poppins;
	font-size: 22px;
	font-weight: 700;
	line-height: 170.19%;
	letter-spacing: 0.3px;
	text-align: center;
	display: flex;
	flex-direction: row;
	align-items: center;
} 

.btn{
	position: absolute;
	width: 193px;
	height: 58px;
	left: 634px;
	top: 400px;
	border-radius:9px;
	background-color: #8172D4; 
} 
 
.img-texts{
	line-height: 60px;
	font-weight: 700;
	letter-spacing: 0.3px;
	text-decoration: none;
	font-family: Poppins;
	font-size: 24px;
	color: #FFFFFF;
	align-items: center;
	margin-left: 10px;
} 

.abtn1:hover {
    background-color: rgba(183, 175, 232, 0.8);
}

.play-plus-text:hover {
    box-shadow:  0px 4px 4px 0px rgba(0, 0, 0, 0.25);
}

.abtn2:hover {
    background-color: rgba(183, 175, 232, 0.8);
}

.btn:hover {
    box-shadow:  0px 4px 4px 0px rgba(0, 0, 0, 0.25);
}
</style>


</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<%
	UserInfo user = (UserInfo)request.getSession().getAttribute("LOGIN_USER");
	%>	
	<div class="graph-plus-text">
    <div class="div-text">
        <div class="graph-title-text">Welcome  ,  <%=user.getUsername() %>
        </div>
		<%
			if(request.getAttribute("robot")==null){%>
        <div class="graph-body-text">Connection Status:<span style="color:#674DFA;">  Not Connected</span></div>
        </div>	      
         <div class="play-plus-text"><a href="connectRobotServlet" class="img-text">
        Connect
        </a>
        </div> 
		
		<%}else{%>
		<div class="graph-body-text">Connection Status:<span style="color:#674DFA;">  Successfully Connected</span></div>
        </div>
        <div class="graph-body-texts">Robot Information：<span style="color:#674DFA;">${robot.robotName}</span></div>
        </div>	
				<div class="abtn1"><a href="modify.jsp?id=${robot.robotId }" class="text">modify</a></div>
				<div class="abtn2"><a href="revokeRobotServlet?id=${robot.robotId }" class="texts">undo</a></div>
				<div class="btn"><a href="explore.jsp" class="img-texts">
        Find Treasure
        </a>
        </div>
		<%}%>
	</div>	
</body>
</html>