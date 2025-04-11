<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.the.dto.*" %>
<%
	BooksDto dto=new BooksDto(null,
		request.getParameter("title"),
		request.getParameter("author"),
		Long.parseLong(request.getParameter("price")),
		Long.parseLong(request.getParameter("stock")),
		Long.parseLong(request.getParameter("category_id")),
		request.getParameter("detail")
	);
	com.the.dao.BooksDao dao=new com.the.dao.BooksDao();
	dao.insert(dto);
	
	response.sendRedirect("adminSelect.jsp");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
</body>
</html>