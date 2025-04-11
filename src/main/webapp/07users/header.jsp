<%@page import="com.the.dto.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page session="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Rocket Bookstore | 대한민국 최고의 서점</title>
<link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.css">
<link rel="stylesheet"
	href="https://unpkg.com/swiper/swiper-bundle.min.css">
<!--플러그인 필수 JS cdn 연결-->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://unpkg.com/swiper/swiper-bundle.js"></script>
<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
<link rel="stylesheet" href="./00css/base.css">
<link rel="stylesheet" href="./00css/common.css">
<link rel="shortcut icon" href="./00img/ico_favicon.ico"
	type="image/x-icon">
<style></style>
</head>
<body>
	<%
	// 로그인 후 세션에서 사용자 정보 가져오기
	UsersDto loggedInUser = (UsersDto) session.getAttribute("loggedInUser");

	if (loggedInUser != null) {
		// 로그인 성공 시
		out.println(loggedInUser.getUser_name() + " 님");
	%>
	<ul class="util">
		<li><a href="<%=request.getContextPath()%>/07users/logout.jsp">로그아웃</a></li>
		<li><a
			href="<%=request.getContextPath()%>/05orders/ordersList.jsp">주문배송</a></li>
		<li><a href="<%=request.getContextPath()%>/04cart/cartList.jsp">장바구니</a></li>
		<li><a href="#">고객센터</a></li>
	</ul>
	<%
	} else {
	// 로그인되지 않았을 때
	%>
	<ul class="util">
		<li><a href="<%=request.getContextPath()%>/07users/login.jsp">로그인</a></li>
		<li><a href="<%=request.getContextPath()%>/07users/register.jsp">회원가입</a></li>
		<li><a href="<%=request.getContextPath()%>/05orders/ordersList.jsp">주문배송</a></li>
		<li><a href="#">고객센터</a></li>
	</ul>
	<%
	}
	%>
</body>
</html>