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
		    border: 1px solid black;
		    padding: 5px 10px;
		}
		.container .sort a{
			display: inline-block;
			margin: 0 10px;
			padding: 5px 10px;
			color: #4d6782;
			text-decoration: none;
		}
		.container .sort a:hover, .container .sort a:visited, .container .sort a:link, .container .sort a:active{
			color: #4d6782;
		}
    </style>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
    <div class="container">
    	<div class="sort" style="margin: 12px 0;">
    		<a  href="findHistoryServlet?sort=quantity">根据宝藏数量排序</a>
    		<a  href="findHistoryServlet?sort=time">根据探索时长排序</a>
    	</div>
        <table border="1">
            <tr>
                <th>探索开始时间</th>
                <th>探索结束时间</th>
                <th>寻到宝藏数量</th>
                <th>宝藏类型</th>
                <th>宝藏图片</th>
                <th>机器人ID</th>
            </tr>
            <%
                List<ExplorationRecord> records = (List<ExplorationRecord>)request.getAttribute("records");
                for (ExplorationRecord record : records) {
            %>
            <tr>
                <td><%= record.getBegintime() %></td>
                <td><%= record.getEndtime() %></td>
                <td><%= record.getTreasureCount() %></td>
                <td><%= record.getTreasuretype().equals("special")?"珍稀":"普通" %></td>
                <td><img alt="图片" src="<%=record.getImg()%>" style="width: 80px; height: 60px;"></td>
                <td><%= record.getRobotId() %></td>
            </tr>
            <% } %>
        </table>
    </div>
</body>
</html>


