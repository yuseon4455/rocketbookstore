<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.the.dto.*"%>
<%@ page import="com.the.dao.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%
String bookIdParam = request.getParameter("book_id");
long bookId = bookIdParam != null ? Long.parseLong(bookIdParam) : 0;

BooksDao dao = new BooksDao();
BooksDto book = dao.selectAll(bookId);

request.setAttribute("book", book);
%>

<c:set var="wishAdded" value="${sessionScope.wishAdded}" />
<c:set var="cartAdded" value="${sessionScope.cartAdded}" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/00BookJSP/00css/books.css">
<link rel="stylesheet" href="../00css/base.css">
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
            <a href="/00BookJSP/main.jsp"><img
               src="/00BookJSP/00img/logo.png" alt="로켓서점"></a>
         </h1>
         <form class="searchForm">
            <input type="text" placeholder="검색어를 입력하세요">
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
            <%@ include file="../03categories/select.jsp"%>
         </ul>
         <ul class="hbUtil">
            <li><a href="/00BookJSP/04cart/cartList.jsp"> <img
                  src="/00BookJSP/00img/ico_cart.png">
            </a></li>
            <li><a href="/00BookJSP/mypage.jsp"> <img
                  src="/00BookJSP/00img/ico_user.png">
            </a></li>
         </ul>
      </div>
      <!-- "headerBottom" -->
      <div class="headerLine"></div>
   </header>

   <div class="bookdetail-con">
      <div class="bookdetail_container">
         <div class="book-image">
            <img src="${pageContext.request.contextPath}${book.image}"
               alt="${book.title}" />
         </div>



         <table class="book-info">
            <tr>
               <th>제목</th>
               <td>${book.title}</td>
            </tr>
            <tr>
               <th>저자</th>
               <td>${book.author}</td>
            </tr>
            <tr>
               <th>가격</th>
               <td><fmt:formatNumber value="${book.price}" type="number"
                     groupingUsed="true" />원</td>
            </tr>
            <tr>
               <th>재고</th>
               <td>${book.stock}</td>
            </tr>
            <tr>
               <th>상세설명</th>
               <td class="txt">${book.detail}</td>
            </tr>
         </table>
      </div>


      <div id="bd_container">
         <h3>작가 정보</h3>
         <div class="detail-con">
            <div class="bd-box1">
               <span>저자(글) &nbsp;<b>${book.author}</b></span>
               <button>ⓘ 인물 정보</button>
            </div>
            <div class="bd-box2">
               <span> 1900년 프랑스 리옹에서 태어났다. 4세에 아버지가 사망했고, 청소년기에 제1차 세계대전을
                  겪었다. 스트라스부르의<br> 전투기 연대에서 군복무를 하게 된 생텍쥐페리는 21세에 조종사 자격증을
                  취득했으며, 제대 후에는 라테고에르 항공사<br> 에 취직하여 정기우편비행을 담당한다. 비행은 그에게 직업일
                  뿐 아니라 모험과 사색의 연장이었으며, 비행중의 경험 그<br> 리고 동료들과의 우정은 많은 작품의 모태가
                  된다. 민간항공사의 비행사로 일하는 중에도 꾸준히 작품을 발표한 생텍쥐<br> 페리는 신문사의
                  특파원으로서스페인의 시민전쟁을 취재하는 등 ‘행동주의 작가’의 면모를 보여준다. 제2차 세계대전이 <br>
                  일어나자 다시 전투비행사로 복무했고, 이후 뉴욕에서 작품 쓰는 일에 전념하다가 알제리의 정찰비행단에 들어간다.
                  1944년 7월, 생텍쥐페리는 그르노블-안시 지역으로 출격했으나 돌아오지 못한다. 1913년 『야간 비행』으로 페미나
                  상을, 1939년에는 『인간의 대지』로 아카데미 프랑세즈 소설 대상을 받았다. 『남방우편기』 『어린 왕자』 『성채』
                  『전시 조종사』 등의 작품이 있다.<br>
               </span>
            </div>
         </div>
      </div>
   </div>



   <div id="detail-con">
      <div class="detail-box">
         <div class="detail-box-left">
            <p>총 상품 금액</p>
            <p class="detail-left-p">
               <fmt:formatNumber value="${book.price}" type="number"
                  groupingUsed="true" /> 원
            </p>
         </div>
         <div class="detail-box-right">
            <div class="amount">
               <p>1</p>
            </div>
            <form action="/00BookJSP/08wishlist/wishlistDB.jsp" method="get">
               <input type="hidden" name="book_id" value="${book.book_id}">
               <c:choose>
                  <c:when test="${sessionScope.wishAdded}">
                     <button type="submit" class="detail-btn">❤️</button>
                  </c:when>
                  <c:otherwise>
                     <button type="submit" class="detail-btn">🤍</button>
                  </c:otherwise>
               </c:choose>
            </form>
            <form action="/00BookJSP/04cart/insertDB.jsp" method="get">
               <input type="hidden" name="book_id" value="${book.book_id}">
               <c:choose>
                  <c:when test="${cartBookIds.contains(wish.book_id)}">
                     <button type="submit" class="detail-btn">🛍️</button>
                  </c:when>
                  <c:otherwise>
                     <button type="submit" class="detail-btn">🛒</button>
                  </c:otherwise>
               </c:choose>
            </form>
            <a href="/00BookJSP/04cart/cartList.jsp" method="get">
            <button type="submit" class="detail-btn2">🎁</button>
            </a>
         </div>
         
      </div>
   </div>


   <div>
      <a href="#" id="topBtn">TOP</a>
   </div>

   <script>
  // 헤더 상단 고정
        document.addEventListener("DOMContentLoaded", function () {
          let header = document.getElementById("header");
          let eventBanner = document.querySelector(".eventHeader");
      
          window.addEventListener("scroll", function () {
            if (window.scrollY > 35) {
              header.classList.add("scrolled");
              if (eventBanner) eventBanner.style.display = "none";
            } else {
              header.classList.remove("scrolled");
              if (eventBanner) eventBanner.style.display = "block";
            }
          });
        });
      
        // top 버튼
        let topBtn = document.getElementById('topBtn');
        topBtn.addEventListener('click', function (e) {
          e.preventDefault();
          window.scrollTo({ top: 0, behavior: "smooth" });
        });
      
        document.querySelectorAll('.detail-btn').forEach(btn => {
             btn.addEventListener('click', function (e) {
                 e.preventDefault();

                 const btnText = this.textContent.trim();

                 if (btnText === '🤍') {
                     this.textContent = '❤️';
                 } else if (btnText === '❤️') {
                     this.textContent = '🤍';
                 } else if (btnText === '🛒') {
                     this.textContent = '🛍️';
                 } else if (btnText === '🛍️') {
                     this.textContent = '🛒';
                 }

                 setTimeout(() => {
                     this.closest('form').submit();
                 }, 200);
             });
         });

</script>




</body>
</html>