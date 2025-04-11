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
<link rel="stylesheet" href="../00css/base.css">
<link rel="stylesheet" href="../00css/register.css">
</head>
<body>
	<%
	request.setCharacterEncoding("UTF-8"); // 한글 인코딩

	// 입력값 받기. requests.getParameter
	String user_id = request.getParameter("user_id");
	String user_pw = request.getParameter("user_pw");
	String user_name = request.getParameter("user_name");
	String email = request.getParameter("email");
	String phone = request.getParameter("phone");

	if (user_id == null || user_id.isEmpty()) {
		// 자바스크립트로 경고 메시지를 띄운 후, 회원가입 페이지로 돌아가게 함
		String errorMessage2 = URLEncoder.encode("아이디 중복 확인을 먼저 해주세요.", "UTF-8");
		/* 		response.sendRedirect("register.jsp?errorMessage2=" + errorMessage2); */
		String redirectUrl = "register.jsp?errorMessage2=" + errorMessage2 + "&user_id="
		+ user_id + "&user_name=" + user_name + "&email="
		+ URLEncoder.encode(email, "UTF-8") + "&phone=" + URLEncoder.encode(phone, "UTF-8");

		response.sendRedirect(redirectUrl);
		return; // 더 이상 처리하지 않음
	}
	
	// DAO 객체 생성
		UsersDao usersDao = new UsersDao();
	
	// 중복 체크
		boolean emailExists = usersDao.checkUserEmail(email);
		boolean phoneExists = usersDao.checkUserPhone(phone);

		// 중복 메시지 설정
		String redirectUrl = "register.jsp?user_id=" + URLEncoder.encode(user_id, "UTF-8") +
		                    "&user_name=" + URLEncoder.encode(user_name, "UTF-8") +
		                    "&email=" + URLEncoder.encode(email, "UTF-8") +
		                    "&phone=" + URLEncoder.encode(phone, "UTF-8");

		if (emailExists) {
		    redirectUrl += "&errorMessage_email=" + URLEncoder.encode("해당 이메일은 이미 사용 중입니다.", "UTF-8");
		}
		if (phoneExists) {
		    redirectUrl += "&errorMessage_phone=" + URLEncoder.encode("해당 전화번호는 이미 사용 중입니다.", "UTF-8");
		}

		// 중복된 데이터가 하나라도 있으면 다시 회원가입 페이지로 이동
		if (emailExists || phoneExists) {
		    response.sendRedirect(redirectUrl);
		    return;
		}

	// UsersDto 객체 생성 및 회원 정보 초기화
	UsersDto usersDto = new UsersDto(user_id, user_name, user_pw, email, phone);

	// UsersDao 객체 생성하여 DB 작업 준비
	//UsersDao usersDao = new UsersDao();

	// insertUsers 메소드 실행 : usersDto 객체를 인자로 전달하여 사용자 정보를 DB에 저장
	usersDao.insertUsers(usersDto);
/* 	response.sendRedirect("../main.jsp"); */
	%>
	<div id = "wrap2">
		<p class = "regisSuccess">회원가입이 완료되었습니다.</p>
		<a href="login.jsp" class = "regisSuccess-btn">로그인하러가기</a>
	
	</div>
</body>
</html>