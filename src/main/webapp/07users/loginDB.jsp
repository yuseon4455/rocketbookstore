<%@page import="com.the.dao.UsersDao"%>
<%@page import="com.the.dto.UsersDto"%>
<%@page import="java.util.ArrayList"%>
<%@ page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="shortcut icon" href="./00img/ico_favicon.ico" type="image/x-icon">
</head>
<body>
<%
	session = request.getSession();
    String user_id = request.getParameter("user_id");
    String user_pw = request.getParameter("user_pw");

    UsersDao usersDao = new UsersDao();
    UsersDto usersDto = usersDao.checkLogin(user_id, user_pw);

    if (usersDto != null) {
		// 로그인 성공 후 세션에 사용자 정보 저장
		session.setAttribute("user_id", user_id);
		session.setAttribute("loggedInUser", usersDto); // 'userDto'는 로그인한 사용자 정보
		if(user_id.equals("admin")){
			response.sendRedirect("../00administrator/ownerPage.jsp");
		}else{
			response.sendRedirect("../main.jsp"); // 로그인 성공 후 main.jsp로 리다이렉트
		}
		// 로그인 후 세션에서 사용자 정보 가져오기
		out.println("로그인 성공");
	} else {
        // 로그인 실패 시, errorMessage를 전달하여 다시 로그인 페이지로 리다이렉트
    	String errorMessage = URLEncoder.encode("아이디 또는 비밀번호가 일치하지 않습니다.", "UTF-8");
        response.sendRedirect("login.jsp?errorMessage=" + errorMessage);
    }
%>
</body>
</html>






