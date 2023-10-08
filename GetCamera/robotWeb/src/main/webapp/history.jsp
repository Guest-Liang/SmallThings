<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*"%>
<%@ page import="robotWeb.*"%>
<%@ page import="robotWeb.dao.*"%>
<%@ page import="robotWeb.vo.*"%>
<%@ page import="robotWeb.dao.impl.*"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>History Record</title>
    <style>
    
    body{
    background-color: #F4F1FF;
    background-image: url("upload/data/img/CTA.svg"); 
/*     background-size: cover; */
    background-repeat: no-repeat;
/*     background-position: top right; */
     min-height: 900px;
    min-width: 800px;
    width: 100vw;
    height: 100vh; 
}

        .container {
            text-align: center;
            width: 800px;
            margin: 0 auto;
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

		.container .sort a{
			display: inline-block;
			margin: 0 30px;
			padding: 5px 10px;
			font-family: 'Poppins', sans-serif; /* 设置字体为 Poppins */
			color: #341AC6;
			box-sizing: border-box;
			border: 1px solid rgb(52, 26, 198);
			box-shadow: 0px 4px 4px 0px rgba(52, 26, 198, 0.25);
			border-radius:9px;			
			text-decoration: none;
		}
		.container .sort a:visited, .container .sort a:link, .container .sort a:active{
			color: #341AC6;
		}
		.container .sort a:hover{
		background-color: #E6DEFF;
		}		
    </style>
</head>
<body>
	<jsp:include page="headers.jsp"></jsp:include>
    <div class="container">
    	<div class="sort" style="margin: 24px 0;">
    		<a  href="findHistoryServlet?sort=quantity">Sort by numbers</a>
    		<a  href="findHistoryServlet?sort=time">Sort by exploration duration</a>
    	</div>
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
            	HisDAO dao = new HisDAOImpl();
                List<ExplorationRecord> records = dao.getAllHistory();

                for (ExplorationRecord record : records) {
            %>
            <tr>
                <td><%= record.getBegintime() %></td>
                <td><%= record.getEndtime() %></td>
                <td><%= record.getTreasureCount() %></td>
                <td><%= record.getTreasuretype().equals("special")?"precious":"normal" %></td>
                <td><img alt="图片" src="<%=record.getImg()%>" style="width: 80px; height: 60px;"></td>
                <td><%= record.getRobotId() %></td>
            </tr>
            <% } %>
        </table>
    </div>
</body>
</html>


