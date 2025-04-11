<%@page import="java.net.URLEncoder"%>
<%@page import="com.the.dto.*"%>
<%@page import="com.the.dao.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
request.setCharacterEncoding("UTF-8");

// 로그인한 사용자 정보 가져오기
UsersDto loggedInUser = (UsersDto) session.getAttribute("loggedInUser");

if (loggedInUser == null) {
    out.println("로그인되지 않았습니다.");
    return;
}

String user_name = loggedInUser.getUser_name();
String user_pw = loggedInUser.getUser_pw();
String email = loggedInUser.getEmail();
String phone = loggedInUser.getPhone();

// 수정할 정보 받기
String newUserName = request.getParameter("user_name");
String newUserPw = request.getParameter("user_pw");
String newEmail = request.getParameter("email");
String newPhone = request.getParameter("phone");

// DAO 객체 생성
UsersDao usersDao = new UsersDao();
boolean isUpdated = false;

// 비밀번호 수정 처리
if (newUserPw != null && !newUserPw.trim().isEmpty()) {
    if (newUserPw.equals(user_pw)) {
        String errorMessage = URLEncoder.encode("새로운 비밀번호는 이전과 동일할 수 없습니다.", "UTF-8");
        response.sendRedirect("updateUser.jsp?errorMessage=" + errorMessage);
        return;
    }
    isUpdated = usersDao.updateUser(user_name, loggedInUser.getUser_id(), newUserPw, email, phone);
    loggedInUser.setUser_pw(newUserPw);
}

// 이름 수정
if (newUserName != null && !newUserName.trim().isEmpty()) {
    isUpdated = usersDao.updateUser(newUserName, loggedInUser.getUser_id(), user_pw, email, phone);
    loggedInUser.setUser_name(newUserName);
}

// 이메일 수정
if (newEmail != null && !newEmail.trim().isEmpty()) {
	boolean emailExists = usersDao.checkUserEmail(newEmail);
	
	if(emailExists){
		 String errorMessageEmail = URLEncoder.encode("해당 이메일은 이미 사용 중입니다.", "UTF-8");
	     String redirectUrl = "updateUser.jsp?errorMessage_email=" + errorMessageEmail + "&email=" + URLEncoder.encode(newEmail, "UTF-8");
	     response.sendRedirect(redirectUrl);
	     return; // 더 이상 진행하지 않음
		
	}
	isUpdated = usersDao.updateUser(user_name, loggedInUser.getUser_id(), user_pw, newEmail, phone);
	loggedInUser.setEmail(newEmail);
	
}

// 전화번호 수정
if (newPhone != null && !newPhone.trim().isEmpty()) {
	boolean phoneExists = usersDao.checkUserPhone(newPhone);
	
	if(phoneExists){
		 String errorMessagePhone = URLEncoder.encode("해당 전화번호는 이미 사용 중입니다.", "UTF-8");
	     String redirectUrl = "updateUser.jsp?errorMessage_phone=" + errorMessagePhone + "&phone=" + URLEncoder.encode(newPhone, "UTF-8");
	     response.sendRedirect(redirectUrl);
	     return; // 더 이상 진행하지 않음
		
	}
	
    isUpdated = usersDao.updateUser(user_name, loggedInUser.getUser_id(), user_pw, email, newPhone);
    loggedInUser.setPhone(newPhone);
}

// 세션 업데이트 및 리디렉트
if (isUpdated) {
    session.setAttribute("loggedInUser", loggedInUser);
    String successMessage = URLEncoder.encode("회원 정보가 수정되었습니다.", "UTF-8");
    response.sendRedirect("/00BookJSP/07users/updateUser.jsp?successMessage=" + successMessage);
} else {
    out.println("수정 실패");
}
%>
