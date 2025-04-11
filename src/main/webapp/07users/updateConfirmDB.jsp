<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.the.dao.*"%>
<%@page import="com.the.dto.*"%>
<%@ page import="java.net.URLEncoder"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	// 세션에서 현재 사용자 가져오기
	session = request.getSession();
	UsersDto loggedInUser = (UsersDto) session.getAttribute("loggedInUser");
	
	if ( loggedInUser == null){
		response.sendRedirect("../main.jsp");
		return;
	}

	String user_pw = request.getParameter("user_pw");
	
	if(user_pw != null && !user_pw.isEmpty()){
		if (loggedInUser.getUser_pw().equals(user_pw)){

			response.sendRedirect("updateUser.jsp");
			
		} else {
			String errorMessage = URLEncoder.encode("사용자 비밀번호가 일치하지 않습니다.", "UTF-8");
	        response.sendRedirect("updateConfirm.jsp?errorMessage=" + errorMessage);
		}
	}
%>
</body>
</html>