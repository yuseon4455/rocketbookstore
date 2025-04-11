<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.the.dto.*"%>
<%@ page import="com.the.dao.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%
    // 카테고리 ID 가져오기
    String catParam = request.getParameter("category_id");
    long catId = 0; // 0이면 전체 책 목록을 의미
    if (catParam != null && !catParam.trim().isEmpty()) {
        try {
            catId = Long.parseLong(catParam);
        } catch (Exception e) {
            catId = 0;
        }
    }

    // DAO를 통해 책 목록 가져오기
    CBDao dao = new CBDao();
    List<CBDto> allBooks = (catId > 0) ? dao.selectBooksByCategoryId(catId) : dao.selectAllBooks();
    
    // 페이지 번호 가져오기 (기본값: 1)
    String pageParam = request.getParameter("page");
    int currentPage = (pageParam != null) ? Integer.parseInt(pageParam) : 1;
    int itemsPerPage = 12;

    // 전체 개수 및 페이지 계산
    int totalBooks = allBooks.size();
    int totalPages = (int) Math.ceil((double) totalBooks / itemsPerPage);

    // 현재 페이지의 책 리스트 추출
    int startIndex = (currentPage - 1) * itemsPerPage;
    int endIndex = Math.min(startIndex + itemsPerPage, totalBooks);
    List<CBDto> pagedBooks = allBooks.subList(startIndex, endIndex);

    // 데이터 request에 담기
    request.setAttribute("pagedBooks", pagedBooks);
    request.setAttribute("totalPages", totalPages);
    request.setAttribute("currentPage", currentPage);
    request.setAttribute("catId", catId); // 페이지네이션 링크에 필요

    // 카테고리 목록도 담기
    CategoriesDao cateDao = new CategoriesDao();
    List<CategoriesDto> categories = cateDao.selectAll();
    request.setAttribute("categoriesList", categories);
    
    
    String user_id = (String) session.getAttribute("user_id");
    WishListDao wishListDao = new WishListDao();
    for(CBDto book : allBooks){
    	
    	// 해당 책이 사용자가 찜한 책인지 확인
    	boolean isWished = wishListDao.isBookInWishlist(user_id, book.getBook_id());
    	
    	// 책 객체에 찜 여부 저장
    	book.setWishAdded(isWished);
    }
    
    request.setAttribute("catebooks", allBooks);
%>

<c:set var="wishAdded" value="${sessionScope.wishAdded}" />
<c:set var="cartAdded" value="${sessionScope.cartAdded }" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Rocket Bookstore | <%= (catId > 0 ? + catId : "전체") %></title>

<link rel="stylesheet" href="../00css/base.css">
<link rel="stylesheet" href="../00css/categoryList.css">
<link rel="stylesheet" href="../00css/main.css">
<link rel="stylesheet" href="../00css/common.css">
<link rel="shortcut icon" href="../00img/ico_favicon.ico"
	type="image/x-icon">
</head>
<body>
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
			<form class="searchForm" action="../search.jsp">
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

			</ul>
			<ul class="hbUtil">
				<li><a href="../04cart/cartList.jsp"> <img
						src="../00img/ico_cart.png">
				</a></li>
				<li><a href="/00BookJSP/mypage.jsp"> <img
						src="../00img/ico_user.png">
				</a></li>
			</ul>
		</div>
		<!-- "headerBottom" -->
		<div class="headerLine"></div>
	</header>
	<div class="category-menu">
		<a href="categorylist.jsp">전체</a>
		<c:forEach var="category" items="${categoriesList}">
			<a href="categorylist.jsp?category_id=${category.category_id}">${category.name}</a>
		</c:forEach>
	</div>

	<ul class="book-list">
		<c:forEach var="catebook" items="${pagedBooks}">
			<li class="book-container">
				<a href="../02books/bookDetail.jsp?book_id=${catebook.book_id}"> 
					<img src="${pageContext.request.contextPath}${catebook.image}" alt="${catebook.title}">
				</a>
	
					<h3>${catebook.title}</h3>
					<p><strong>저자:</strong> ${catebook.author}</p>
					<p><strong>설명:</strong> ${catebook.detail}</p>
					<form action="/00BookJSP/08wishlist/wishlistDB.jsp" method="get">
						<input type="hidden" name="book_id" value="${catebook.book_id}">
						<c:choose>
							<c:when test="${catebook.wishAdded}">
								<button type="submit" class="detail-btn">찜하기 ❤️</button>
							</c:when>
							<c:otherwise>
								<button type="submit" class="detail-btn">찜하기 🤍</button>
							</c:otherwise>
						</c:choose>

					</form>

					<form action="/00BookJSP/04cart/insertDB.jsp" method="get">
						<input type="hidden" name="book_id" value="${catebook.book_id}">
						<c:choose>
							<c:when test="${cartBookIds.contains(wish.book_id)}">
								<button type="submit" class="detail-btn">장바구니 🛍️</button>
							</c:when>
							<c:otherwise>
								<button type="submit" class="detail-btn">장바구니 🛒</button>
							</c:otherwise>
						</c:choose>
					</form></li>
		</c:forEach>
	</ul>
	<div class="pagination">
		<c:if test="${currentPage > 1}">
			<a
				href="categorylist.jsp?category_id=${catId}&page=${currentPage - 1}">이전</a>
		</c:if>

		<c:forEach begin="1" end="${totalPages}" var="page">
			<a href="categorylist.jsp?category_id=${catId}&page=${page}"
				class="${currentPage == page ? 'active' : ''}">${page}</a>
		</c:forEach>

		<c:if test="${currentPage < totalPages}">
			<a
				href="categorylist.jsp?category_id=${catId}&page=${currentPage + 1}">다음</a>
		</c:if>
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
   
   /* topBtn 버튼 */
   let topBtn = document.getElementById('topBtn');
   topBtn.addEventListener('click', function(e) {
      e.preventDefault(); //a태그의  href기능을 막아줌
      window.scrollTo({
         top : 0,
         behavior : "smooth"
      });
   });
   
   /* 하트, 장바구니 버튼*/
      document.querySelectorAll('.detail-btn').forEach(btn => {
       btn.addEventListener('click', function (e) {
           e.preventDefault();

           const btnText = this.textContent.trim();

           if (btnText === '🤍') {
               this.textContent = '찜하기 ❤️';
           } else if (btnText === '찜하기 ❤️') {
               this.textContent = '찜하기 🤍';
           } else if (btnText === '장바구니 🛒') {
               this.textContent = '장바구니 🛍️';
           } else if (btnText === '장바구니 🛍️') {
               this.textContent = '장바구니 🛒';
           }

           setTimeout(() => {
               this.closest('form').submit();
           }, 200);
       });
   });
   </script>
</body>
</html>
