<%@page import="com.the.dto.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	// 로그인 후 세션에서 사용자 정보 가져오기
	UsersDto loggedInUser = (UsersDto) session.getAttribute("loggedInUser");
	
	if (loggedInUser != null){
		System.out.println("로그인 성공");
		out.println(loggedInUser.getUser_name() + " 님");
	} else {
		out.println("로그인 되지 않았습니다.");
	}

%>
</body>
</html>