<%@page import="java.net.URLEncoder"%>
<%@page import="com.the.dao.*"%>
<%@page import="com.the.dto.*"%>
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
	boolean isUpdated = false;
	
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
			UsersDao usersDao = new UsersDao();
			usersDao.deleteUser(loggedInUser.getUser_id());
			
			session.invalidate(); // 세션 종료
/* 			out.println("회원 탈퇴가 완료되었습니다."); */
			response.sendRedirect("deleteUser.jsp?result=success");
			
		} else {
			String errorMessage = URLEncoder.encode("사용자 비밀번호가 일치하지 않습니다.", "UTF-8");
	        response.sendRedirect("deleteUser.jsp?errorMessage=" + errorMessage);
		}
	}
%>
</body>
</html>






