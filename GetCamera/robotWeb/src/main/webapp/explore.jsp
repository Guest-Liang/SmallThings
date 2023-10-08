<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="robotWeb.vo.*"%>
<%@ page import="robotWeb.dao.*"%>
<%@ page import="robotWeb.dao.impl.*"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="/robotWeb/js/jquery-1.12.4.min.js"></script>
<meta charset="utf-8">
<title>Exploration</title>
<style type="text/css">
    body{
    background-color: #F4F1FF;
    background-image: url("upload/data/img/CTA.svg"); 
    background-repeat: no-repeat;
     min-height: 900px;
    min-width: 800px;
    width: 100vw;
    height: 100vh; 
}

.reg_div {
	width: 680px;
	margin: auto;
	color: #555;
	clear: both;
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
	background-color: #897ADF;
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
	font-weight: bold;
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
	border: /* 1px solid #41A8A8; */ 2px solid rgba(52, 26, 198,0.5);
	box-shadow: 0px 4px 4px 0px rgba(52, 26, 198, 0.25);
	border-radius:9px;
}
.exp-info p{
	margin: 10px 0;
	text-align: center;
}
.exp-info .title{
	color: rgba(52, 26, 198);
	font-weight: bold;
}
.exp-btns{
	float: right;
	width: 35%;
}
table {
    border-collapse: collapse;
    width: 100%;
    text-align: center;
	font-size: 14px;
}
td, th {
		    border: 2px solid /* black */rgba(52, 26, 198, 0.25);
		    padding: 5px 10px;
		}
tr:first-child th {
    background-color: #f4f1ff; /* 修改为你想要的背景颜色 */
}
.lupdate{
	text-align: center;
}
.expform{
	padding: 20px 0 0 50px;
	display: none;
}
label {
	width: 90px;
	height: 28px;
	display: inline-block;
	text-align: right;
	padding-right: 10px;
}

input , .expform select{
	width: 200px;
	height: 28px;
	border: #06F 1px solid;
	border-radius: 3px;
	margin: 5px 0 5px 0;
}
.expform .submit_btn{
    padding-left: 80px;
    cursor: pointer;
}

.submit_btn input[value="submit"]:hover {
    box-shadow:  0px 4px 4px 0px rgba(0, 0, 0, 0.25);
}
</style>
</head>
<body>
	<jsp:include page="headers.jsp"></jsp:include>
	<form action="InsertExplorDataServlet" method="post" enctype="multipart/form-data">
	<div class="reg_div" style="height: 150px;">
		<%
		if(request.getSession().getAttribute("LOGIN_USER")==null){
			response.sendRedirect("login.jsp");
			return;
		}
		UserInfo user = (UserInfo)request.getSession().getAttribute("LOGIN_USER");
		RobotDAO dao = new RobotDaoImpl();
		RobotInfo robot = dao.findMyRobots(user.getUserId());
		//开始时间
		Date startTime = new Date();
		request.getSession().setAttribute("EXPLOR_START_TIME", startTime);
		long t0 = startTime.getTime();
		%>
		<h3 style="text-align: center;">Exploration Update</h3>
		<div class="exp-info">
			<p class="title">Update Information</p>
			<div class="lupdate">
				Labyrinth Update：<img alt="宝藏图片" src="" style="width: 80px; height: 60px;" id="expPicture">
			</div>
			<p>Treasure Image：<input type="file" name="file" style="width: 150px;"></p>
			<p id="explorStatus">Robot has explored for <strong id="minCount" style="color: #341ac6;">0</strong> minutes</p>
		</div>
		<div class="exp-btns">
			<div class="btn" onclick="explorComplete()" id="completeBtn">Exploration completed</div>
		</div>
		
		<div class="exp-btns" style="margin-top: 20px;">
			<a href="/robotWeb/ExportServlet"><div class="btn">Export Record</div></a>
		</div>		
	</div>
	<div  class="reg_div expform" id="expForm">
		<label style="width: 140px;">Robot：<%=robot.getRobotName()%></label>
		<input type="hidden" name="robotId" value="<%=robot.getRobotId()%>">
		<br />
		<label>Type</label>
			<select name="treasuretype">
				<option value="common">normal</option>
				<option value="special">precious</option>
			</select>
		<br />
		<label>Number</label><input type="number"  name="treasureCount"/><br />
		<div class="submit_btn">
			<input type="submit" value="submit" style="background-color: #897ADF; color: #ffffff; width:10%;border: none;font-weight:bold;margin-left:20px;">
		</div>
	</div>
	</form>
	<div class="reg_div" style="padding-top: 10px;">
		<h3 style="text-align: center;/* color: #41A8A8; */">Exploration Record</h3>
		<table border="1">
            <tr>
                <th>Start Time</th>
                <th>End Time</th>
                <th>Number of Treasures</th>
                <th>Type</th>
                <th>Treasure Image</th>
                <th>Robot ID</th>
            </tr>
            <%
            	/* HisDAO historyDao = new HisDAOImpl();
                List<ExplorationRecord> records = historyDao.getHistoryByRobotID(robot.getRobotId());
				System.out.println("查询历史："+records.size());
                for (ExplorationRecord record : records) { */
                	System.out.println("查询历史："+request.getAttribute("record")!=null);
                	if(request.getAttribute("record")!=null){
                		ExplorationRecord record = (ExplorationRecord)request.getAttribute("record");
                	
            %>
            <tr>
                <td><%= record.getBegintime() %></td>
                <td><%= record.getEndtime() %></td>
                <td><%= record.getTreasureCount() %></td>
                <td><%= record.getTreasuretype().equals("special")?"precious":"normal" %></td>
                <td><img alt="图片" src="<%=record.getImg()%>" style="width: 80px; height: 60px;"></td>
                <td><%= record.getRobotId() %></td>
            </tr>
            <%}%>
        </table>
        <input type="hidden" name="" id="t0" value="<%=t0%>">
	</div>
	<script type="text/javascript">
		let isComplete = 0; //探索结束标识
		let t0mill = $("#t0").val()
		let t0 = new Date()
		t0.setTime(t0mill)
		 let timer =   setInterval(function(){
			 console.log(t0)
			 let t1 = new Date()
			 let minut = parseInt(t1 - t0) / 1000 / 60
			 console.log(minut.toFixed(0));//两个时间相差的分钟数
			 minut = minut.toFixed(0)
			 $("#minCount").text(minut)
	     }, 60000);
		
		let pictureTimer =   setInterval(function(){
			console.log('读取最新图片：'+(new Date()))
			$.get(
					"/robotWeb/GetNewPicture",
					{},
					function(data){
						 $("#expPicture"). attr("src", data)
					}
			)
	     },2000);

		//探索完成事件
		function explorComplete(){
			if(isComplete==1){
				return
			}
			isComplete = 1
			$("#expForm").show()
			$("#completeBtn").css("background-color", "#999")
			clearInterval(timer)
			clearInterval(pictureTimer)
		}
		
		<%if(request.getAttribute("record")!=null){%>
			explorComplete()
			$("#explorStatus").html("Exploration completed")
		<%}%>
	</script>
</body>
</html>