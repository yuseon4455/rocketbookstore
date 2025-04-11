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
	request.setCharacterEncoding("UTF-8");
	response.setContentType("text/html; charset=UTF-8");	
	
	String user_id = (String) session.getAttribute("user_id");
	String address = request.getParameter("address");
	
	ShipDto dto = new ShipDto(user_id, address);
	ShipDao.insert(dto);

	response.sendRedirect("shiplist.jsp");
%>
</body>
</html>