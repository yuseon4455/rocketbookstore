<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "com.the.dto.*" %>
<%@ page import = "com.the.dao.*" %>
<%@ page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
    String user_id = (String) session.getAttribute("user_id");
    Long book_id = Long.parseLong(request.getParameter("book_id"));
    CartDao dao = new CartDao();

    ArrayList<CartDto> cartList = dao.selectAll(user_id);
    request.setAttribute("cartList", cartList);
    CartDto dto = new CartDto(user_id, book_id);

    dao.insert(dto);

    session.setAttribute("cartAdded", true);

    response.sendRedirect("cartList.jsp");
%>
</body>
</html>
