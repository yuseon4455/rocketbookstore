<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	Long deleteid=Long.parseLong(request.getParameter("book_id"));
	com.the.dao.BooksDao dao=new com.the.dao.BooksDao();
	dao.delete(deleteid);
	
	response.sendRedirect("adminSelect.jsp"); // adminSelect.jsp로 리다이렉트 
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