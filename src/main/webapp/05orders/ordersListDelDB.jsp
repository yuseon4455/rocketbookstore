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
		String order_id = request.getParameter("order_id");
	
		OrdersDao.delete(order_id);
		
		response.sendRedirect("ordersList.jsp");
	%>
</body>
</html>