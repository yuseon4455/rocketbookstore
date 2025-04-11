<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.the.dao.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	String history_id = request.getParameter("history_id");
	int ship_state = Integer.parseInt(request.getParameter("ship_state"));
	
	request.setAttribute("history_id", history_id);

	HistoryDao.update(history_id, ship_state);
	
	response.sendRedirect("historyIdOwner.jsp?history_id=" + history_id);
%>
</body>
</html>