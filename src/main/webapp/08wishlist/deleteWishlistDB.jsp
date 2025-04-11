<%@page import="java.lang.ProcessBuilder.Redirect"%>
<%@page import="com.the.dao.WishListDao"%>
<%@page import="com.the.dto.WishListDto"%>
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
      String user_id = (String)session.getAttribute("user_id");
      Long book_id = Long.parseLong(request.getParameter("book_id"));
      
      WishListDao wishListDao = new WishListDao();
      wishListDao.deleteWishList(user_id, book_id);
   
      response.sendRedirect("mywishlist.jsp");
   %>
</body>
</html>