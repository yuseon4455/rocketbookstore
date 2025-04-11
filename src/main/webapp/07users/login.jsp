<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.net.URLDecoder"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<link rel="stylesheet" href="../00css/base.css">
<link rel="stylesheet" href="../00css/userForm.css">

</head>
<body>
	<div id="wrap">
		<a href="../main.jsp"><img alt="logo" src="../00img/logo.png"></a>
		<p class = "login-ft">로그인</p>

		<form action="loginDB.jsp" method="post">
			<input type="text" name="user_id" class="input-st" required
				placeholder="아이디를 입력해 주세요"><br>
			<input type="password" name="user_pw" class="input-st" required 
			placeholder="비밀번호를 입력해 주세요"><br>
		<!-- 로그인 실패 시 메시지 출력 -->
		<c:if test="${not empty param.errorMessage}">
    	    <p class = "warning-msg">
    	    	<!-- 경고 아이콘 유니코드 U+26A0
    	    	    html 에선 10진수로 변경 &#9888-->
				 &#9888;<c:out value="${param.errorMessage}" />
			</p>
		</c:if>
			<div class="find-st">
				<a href="#">아이디 찾기</a>&nbsp;/&nbsp;
				<a href="#">비밀번호 찾기</a>
			</div>

			<input type="submit" value="로그인" class="login-btn"> 
			<a href="register.jsp" class="register-btn">회원 가입</a>
		</form>
	</div>


</body>
</html>
