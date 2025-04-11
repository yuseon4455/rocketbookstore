<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.the.dao.*"%>
<%@page import="com.the.dto.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../00css/base.css">
<link rel="stylesheet" href="../00css/register.css">
</head>
<body>
	<div id="wrap">
		<a href="../main.jsp"><img alt="logo" src="../00img/logo.png"></a>

		<!-- 자바스크립트로 경고 메시지를 띄우기 -->
		<c:if test="${not empty param.errorMessage2}">
			<script>
				alert("${param.errorMessage2}");
			</script>
		</c:if>
		<p class = "p-font1">이미 회원이신가요?
			<a href = "login.jsp">로그인하러가기</a>
		</p>
		<!-- 아이디 입력 필드 -->
		<form action="checkUserId.jsp" method="post">
			<div class="box1">
				<label>아이디</label> 
				<input type="text" name="user_id"
					value="${param.user_id }" required class="inputId-st"> <input
					type="submit" value="중복확인" class="checkUserId">
			</div>
			<c:if test="${not empty param.errorMessage}">
				<p class="warning-msg">
					&#9888;
					<c:out value="${param.errorMessage}" />
				</p>
			</c:if>
			<c:if test="${not empty param.successMessage}">
				<p class="success-msg">
					&#x2713;
					<c:out value="${param.successMessage}" />
				</p>
			</c:if>
		</form>


		<!-- 회원가입 입력 필드 -->
		<form action="registerDB.jsp" method="post"
			onsubmit="return validateForm()">
			<!-- 숨겨진 아이디 필드 -->
			<input type="hidden" name="user_id" value="${param.user_id }">

			<div class="box1">
				<!-- 비밀번호 입력 필드 -->
				<label>비밀번호</label> <input type="password" name="user_pw1"
					id="user_pw1" placeholder="최소 8자, 문자+숫자+특수문자" required><br>
			</div>

			<div class="box1">
				<!-- 비밀번호 확인 입력 필드 -->
				<label>비밀번호 확인</label> <input type="password" name="user_pw"
					id="user_pw" placeholder="비밀번호 확인" required> <br>
			</div>
			<p id="warning-msg2" style="display: none;">
				&#9888; 비밀번호가 일치하지 않습니다.</p>


			<div class="box1">
				<!-- 이름 입력 필드 -->
				<label>이름</label> <input type="text" name="user_name" required
					value="${param.user_name }"><br>
			</div>

			<div class="box1">
				<!-- 이메일 입력 필드 -->
				<label>이메일</label> <input type="email" name="email" required
					value="${param.email }">
			</div>
			<c:if test="${not empty param.errorMessage_email}">
				<p class="warning-msg">
					<c:out value="${param.errorMessage_email}" />
				</p>
			</c:if>

			<div class="box1">
				<!-- 전화번호 입력 필드 -->
				<label>전화번호</label> <input type="tel" name="phone" required
					value="${param.phone }">
			</div>
			<c:if test="${not empty param.errorMessage_phone}">
				<p class="warning-msg">
					<c:out value="${param.errorMessage_phone}" />
				</p>
			</c:if>
			<!-- 가입하기 버튼 -->

			<input type="submit" value="회원가입하기" class="register-btn">

		</form>

		<script>
			function validateForm() {
				var password1 = document.getElementById("user_pw1").value;
				var password2 = document.getElementById("user_pw").value;

				// 비밀번호가 일치하지 않으면 오류 메시지 표시
				if (password1 !== password2) {
					document.getElementById("warning-msg").style.display = "inline"; // 메시지 표시
					return false; // 폼 제출을 막음
				} else {
					document.getElementById("warning-msg").style.display = "none"; // 메시지 숨김
					return true; // 폼 제출 허용
				}
			}
		</script>


	</div>

</body>
</html>
