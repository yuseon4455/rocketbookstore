<%@page import="com.the.dao.CategoriesDao"%>
<%@page import="com.the.dao.CBDao"%>
<%@page import="com.the.dao.BooksDao"%>
<%@page import="com.the.dto.UsersDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<%
// DAO 객체 생성 (각자의 DAO 생성 방식에 맞게 수정)
BooksDao bookDao = new BooksDao();
CategoriesDao categoryDao = new CategoriesDao();

// 전체 도서 목록 가져오기
List<BooksDto> bookList = bookDao.selectAll();
request.setAttribute("bookList", bookList);

// 전체 카테고리 목록 가져오기
List<CategoriesDto> categoriesList = categoryDao.selectAll();
request.setAttribute("categoriesList", categoriesList);
%>
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
<link rel="stylesheet" href="./00css/main.css">
<link rel="shortcut icon" href="./00img/ico_favicon.ico" type="image/x-icon">
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
					<a href="main.jsp"><img src="00img/logo.png" alt="로켓서점"></a>
				</h1>
				<form class="searchForm" action="search.jsp">
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
		<main>
			<div class="swiper main">
				<div class="swiper-wrapper mainVisual">
					<a href="#" class="swiper-slide"><img
						src="00img/mainVisual1.avif" alt="mainVisual"></a> <a href="#"
						class="swiper-slide"><img src="00img/mainVisual2.avif"
						alt="mainVisual"></a> <a href="#" class="swiper-slide"><img
						src="00img/mainVisual3.avif" alt="mainVisual"></a>
				</div>
				<div class="swiper-button-prev"></div>
				<div class="swiper-button-next"></div>
				<div class="swiper-pagination"></div>
			</div>
		</main>
		<section class="product-container">
			
			<!-- new 최신 등록된 하위 4권-->
			<section id="newBook">
				<div class="bestItem">
					<div class="bestTxt">
						<p class="title">NEW</p>
						<ul class="category">
							<c:forEach var="category" items="${categoriesList}"
								varStatus="status">
								<li><a href="#" data-category="cat${category.category_id}"
									class="${status.first ? 'active' : ''}"> ${category.name} </a>
								</li>
							</c:forEach>
						</ul>
					</div>
					<div class="wrap">
						<div class="productList">
							<c:forEach var="category" items="${categoriesList}"
								varStatus="status">
								<div class="product cat${category.category_id} ${status.first ? 'active' : ''}">
									<ul>
										<c:forEach var="book" items="${bookList}">
											<c:if test="${book.category_id == category.category_id}">
												<li><a href="02books/bookDetail.jsp?book_id=${book.book_id}">
														<p class="photo">
															<img
																src="${pageContext.request.contextPath}${book.image}" alt="${book.title}">
														</p>
														<div class="infor">
															<h3>${book.title}</h3>
															<p class="price">
																<fmt:formatNumber value="${book.price}" type="number" groupingUsed="true" />
															원</p>
														</div>
												</a></li>
											</c:if>
										</c:forEach>
									</ul>
								</div>
							</c:forEach>
						</div>
					</div>
				</div>
			</section>



			<!-- best 상위 4권 -->
			<section id="bestBook">
				<div class="bestItem">
					<div class="bestTxt">
						<p class="title">BEST</p>
						<ul class="category">
							<c:forEach var="category" items="${categoriesList}"
								varStatus="status">
								<li><a href="#" data-category="cat${category.category_id}"
									class="${status.first ? 'active' : ''}"> ${category.name} </a>
								</li>
							</c:forEach>
						</ul>
					</div>
					<div class="wrap">
						<div class="productList">
							<c:forEach var="category" items="${categoriesList}"
								varStatus="status">
								<div
									class="product cat${category.category_id} ${status.first ? 'active' : ''}">
									<ul>
										<c:forEach var="book" items="${bookList}">
											<c:if test="${book.category_id == category.category_id}">
												<li><a href="02books/bookDetail.jsp?book_id=${book.book_id}">
														<p class="photo">
															<img
																src="${pageContext.request.contextPath}${book.image}"
																alt="${book.title}">

														</p>
														<div class="infor">
															<h3>${book.title}</h3>
															<p class="price"><fmt:formatNumber value="${book.price}" type="number" groupingUsed="true" />원</p>
														</div>
												</a></li>
											</c:if>
										</c:forEach>
									</ul>
								</div>
							</c:forEach>
						</div>
					</div>
				</div>
			</section>
			<section class="recommend"></section>
			<!-- recommend -->

		</section>
		<!-- product-container -->
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
					<img src="00img/ft_logo.png" alt="로켓서점">
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

		// 행버거 버튼 클릭
		$('.open_btn').on(
				'click',
				function() {
					$(this).toggleClass('active').siblings('.over')
							.toggleClass('block');
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

		// New, Best active
		$(document).ready(function() {
			// NEW
			// #newBook 섹션 내의 각 상품 목록(<ul>)에서 모든 항목을 먼저 숨긴 후, 
			//마지막 4개 항목만 다시 보여주도록 처리
			$('#newBook .productList .product ul').each(function() {
				$(this).children('li').hide().slice(-4).show();
			});

			// 카테고리 탭 클릭 이벤트 처리
			$('#newBook .category a').click(function(e) {
				e.preventDefault();
				$('#newBook .category a').removeClass('active');
				$(this).addClass('active');

				var category = $(this).data('category'); // 예: "cat1"
				$('#newBook .productList .product').hide();
				$('#newBook .productList .product.' + category).show();
			});

			// BEST
			$('#bestBook .productList .product ul').each(function() {
				$(this).children('li').hide().slice(0,4).show();
			});

			$('#bestBook .productList .product.active').show();
			$('#bestBook .category a').click(function(e) {
				e.preventDefault();
				$('#bestBook .category a').removeClass('active');
				$(this).addClass('active');
				var category = $(this).data('category');
				$('#bestBook .productList .product').hide();
				$('#bestBook .' + category).show();
			});
		});

		/* topBtn 버튼 */
		let topBtn = document.getElementById('topBtn');
		topBtn.addEventListener('click', function(e) {
			e.preventDefault(); //a태그의  href기능을 막아줌
			window.scrollTo({
				top : 0,
				behavior : "smooth"
			});
		});
	</script>
</body>
</html>