<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="00css/base.css">
<link rel="stylesheet" href="00css/common.css">
<link rel="stylesheet" href="00css/main.css">
<!--플러그인 필수 css cdn 연결-->
<link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.css">
<link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css">
<!--플러그인 필수 JS cdn 연결-->
<script src="https://unpkg.com/swiper/swiper-bundle.js"></script>
<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
</head>
<body>
	<header id="header">
		<div class="header_box">
			<img src="./logo.png" alt="Logo">
			<div class="search_box">
				<input type="text" class="search" placeholder="검색어 입력"> <img
					src="./ico_search.png" alt="Search Icon" class="search_logo">
			</div>
			<div class="header_log">
				<ul>
					<li><a href="/00BookJSP/07users/login.jsp">로그인</a></li>
					<li>|</li>
					<li><a href="#">회원가입</a></li>
					<li>|</li>
					<li><a href="#">주문배송</a></li>
					<li>|</li>
					<li><a href="#">고객센터</a></li>
				</ul>
			</div>
		</div>
		<div id="header_box2">
			<div class="head_sub1">
				<img src="./ico_header.png" alt="" class="head_sub_logo">
				<ul>
					<li><a href="#">베스트셀러</a></li>
					<li><a href="#">신상품</a></li>
					<li><a href="#">화제작</a></li>
					<li><a href="#">추천작</a></li>
					<li><a href="#">이벤트</a></li>
				</ul>
			</div>
			<div class="head_sub2">
				<img src="./cart.png" alt=""> <img src="./login.png" alt="">
			</div>
		</div>
	</header>
	<a href="/00BookJSP/02books/select.jsp">도서 리스트</a><br>
<a href="/00BookJSP/03categories/select.jsp">도서 카테고리</a><br>
<a href="main.jsp"> 마이페이지 </a>

</body>
</html>