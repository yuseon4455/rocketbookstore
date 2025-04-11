<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	session = request.getSession();

	session.invalidate(); // 세션에서 삭제
	
	response.sendRedirect("../main.jsp");

%>
</body>
</html>