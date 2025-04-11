<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.the.dao.*" %>
<%@page import="com.the.dto.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	long ship_id = Long.parseLong(request.getParameter("ship_id"));

	ShipDao.delete(ship_id);
	
	response.sendRedirect("shiplist.jsp");
%>
</body>
</html>