<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="com.the.dao.*"%>
<%@page import="com.the.dto.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../00css/base.css">
<link rel="stylesheet" href="../00css/pwCheck.css">
<link rel="stylesheet" href="../00css/updateUser.css">
<link rel="stylesheet" href="../00css/common.css">

    <script>
        // 탈퇴 성공 시 alert 띄우기
        function showAlert() {
            alert("회원 탈퇴가 완료되었습니다.");
            window.location.href = "../main.jsp";  // 메인 페이지로 리다이렉트
        }
    </script>
</head>
<body>

	<div id="wrap">
		<div class="eventHeader">
			<p>
				회원 가입 시<span> 첫구매 100원</span> 이벤트
			</p>
		</div>
		<header id="header">
			<div class="headerTop">
				<h1 class="logo">
					<a href="../main.jsp"><img src="../00img/logo.png" alt="로켓서점"></a>
				</h1>
				<form class="searchForm">
					<input type="text" placeholder="검색어를 입력하세요">
					<button class="submit"></button>
				</form>
				<%@ include file="header.jsp"%>
			</div>
			<!-- headerTop -->
			<div class="headerBottom">
				<a href="#" class="open_btn"> <span></span> <span></span> <span></span>
					<span></span>
				</a>

				<ul class="menu">
					<%@ include file="../03categories/select.jsp"%>
				</ul>

				<ul class="hbUtil">
					<li><a href="../04cart/cartList.jsp"> <img
							src="../00img/ico_cart.png">
					</a></li>
					<li><a href="../mypage.jsp"> <img
							src="../00img/ico_user.png">
					</a></li>
				</ul>
			</div>
			<!-- "headerBottom" -->
			<div class="headerLine"></div>
		</header>
		
		<c:if test="${param.result == 'success'}">
			<script>
				// 탈퇴 성공 시 alert 메시지 표시
				showAlert();
			</script>
		</c:if>
		
		<div id="main">
			<p class="font1">회원 탈퇴</p>
			<div id="box1">
				<p class="font1">비밀번호 확인</p>
				<p class="font-small2">회원 탈퇴 시 계정은 삭제되며 정보는 복구되지 않습니다.</p>
				<hr class="divider">
				<!-- 가름선 -->
				<form action="deleteUserDB.jsp" method="post" class="form1">
					<label class="font3">비밀번호 </label> <input type="password"
						name="user_pw" class="input1"> <input type="submit"
						value="확인" class="submit-btn">
				</form>
				<c:if test="${not empty param.errorMessage}">
					<p class="warning-msg">
						&#9888;
						<c:out value="${param.errorMessage}" />
					</p>
				</c:if>

			</div>

		</div>
	</div>

	
</body>
</html>