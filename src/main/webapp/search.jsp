<%@page import="com.the.dto.BooksDto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.the.dao.BooksDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>search</title>
<link rel="stylesheet" href="./00css/base.css">
<link rel="stylesheet" href="./00css/common.css">
<link rel="stylesheet" href="./00css/search.css">
</head>
<%
request.setCharacterEncoding("UTF-8");

String searchKeyword = request.getParameter("searchKeyWord");

BooksDao bookDao = new BooksDao();
List<BooksDto> searchResults = new ArrayList<>();

if (searchKeyword != null && !searchKeyword.trim().isEmpty()) {
	searchResults = bookDao.searchBooksByKeyword(searchKeyword.trim());
}

request.setAttribute("searchResults", searchResults);
request.setAttribute("searchKeyword", searchKeyword);
%>
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
					<a href="main.jsp"><img src="00img/logo.png" alt="로켓서점"></a>
				</h1>
				<form action="search.jsp" class="searchForm">
					<input type="text" name="searchKeyWord" placeholder="검색어를 입력하세요">
					<button class="submit"></button>
				</form>
				<%@ include file="../07users/header.jsp"%>

			</div>
			<!-- headerTop -->
			<div class="headerBottom">
				<a href="#" class="open_btn"> <span></span> <span></span> <span></span>
					<span></span>
				</a>
				<ul class="menu">
					<%@ include file="03categories/select.jsp"%>
				</ul>
				<ul class="hbUtil">
					<li><a href="04cart/cartList.jsp"> <img
							src="00img/ico_cart.png">
					</a></li>
					<li><a href="mypage.jsp"> <img src="00img/ico_user.png">
					</a></li>
				</ul>
			</div>
			<!-- "headerBottom" -->
			<div class="headerLine"></div>
		</header>

		<div id="box1">
			<h2>
				"<%=searchKeyword%>"에 대한 검색 결과
			</h2>

			<c:if test="${empty searchResults}">
				<p>검색 결과가 없습니다.</p>
			</c:if>

			<ul class="searchList">
				<c:forEach var="book" items="${searchResults}">
					<li class="book-container"><a
						href="02books/bookDetail.jsp?book_id=${book.book_id}"> <img
							src="${pageContext.request.contextPath}${book.image}"
							alt="${book.title}" />
							<h3>${book.title}</h3>
							<p>
								<strong>저자:</strong> ${book.author}
							</p>
							<p>
								<strong>설명:</strong> ${book.detail}
							</p>
					</a></li>
				</c:forEach>
			</ul>
		</div>
	</div>
	<footer id="footer">
		<div id="footercontent">
			<a href="/00BookJSP/main.jsp"><img
				src="/00BookJSP/00img/logo.png" alt="Logo"></a>
			<div id="footertext">
				<p>고객센터</p>
				<p style="font-size: 20px;">1577-5141</p>
				<p>평일 09:00 - 18:00 (주말, 공휴일 제외)</p>
				<div id="buttongroup">
					<button>자주 하는 질문</button>
					<button>1:1 문의</button>
				</div>
			</div>
		</div>
		<div id="footerline">
			<div class="ftinner">
				<img src="../00img/ft_logo.png" alt="로켓서점">
				<ul class="footerInfor">
					<li>서울특별시 종로구 우정국로 2025길 1</li>
					<li>대표이사: 박수민</li>
					<li>사업자등록번호 202-504-030111 <span><a>(사업자정보확인 > )</a></span></li>
				</ul>
				<p>&copy; 2025 로켓 서점</p>
			</div>
		</div>
	</footer>
	<div>
		<a href="#" id="topBtn">TOP</a>
	</div>
	<script>
		//헤더 상단 고정
		document.addEventListener("DOMContentLoaded", function() {
			let header = document.getElementById("header");
			window.addEventListener("scroll", function() {
				if (window.scrollY > 35) {
					header.classList.add("scrolled");
					eventBanner.style.display = "none";
				} else {
					header.classList.remove("scrolled");
					eventBanner.style.display = "block";
				}
			});
		});
		//메인비주얼 스와이퍼
		const main = new Swiper('.main', {
			autoplay : {
				delay : 4000
			},
			loop : true,
			navigation : {
				prevEl : '.main .swiper-button-prev',
				nextEl : '.main .swiper-button-next',
			},
			pagination : {
			// el: '.main .swiper-pagination',
			},
		})
	</script>
</body>
</html>