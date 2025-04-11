<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.the.dto.*" %>
<%
	Long updateamount=Long.parseLong(request.getParameter("amount"));
	Long updatecartid=Long.parseLong(request.getParameter("cart_id"));
	
	com.the.dao.CartBookDao dao=new com.the.dao.CartBookDao();
	dao.update(updateamount, updatecartid);
	
	response.sendRedirect("/00BookJSP/04cart/cartList.jsp");
	
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update Order</title>
</head>
<body>

</body>
</html>
