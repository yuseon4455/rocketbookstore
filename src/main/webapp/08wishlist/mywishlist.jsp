<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="com.the.dto.*"%>
<%@page import="java.util.*"%>
<%@page import="com.the.dao.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>위시리스트</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://unpkg.com/swiper/swiper-bundle.js"></script>
<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
<link rel="stylesheet" href="/00BookJSP/00css/base.css">
<link rel="stylesheet" href="/00BookJSP/00css/common.css">
<link rel="shortcut icon" href="/00BookJSP/00img/ico_favicon.ico"
   type="image/x-icon">
<link rel="stylesheet" href="/00BookJSP/00css/wishlist.css">
<link rel="stylesheet" href="/00BookJSP/00css/style.css">

<c:set var="wishAdded" value="${sessionScope.wishAdded}" />
<c:set var="cartAdded" value="${sessionScope.cartAdded}" />

<%
String user_id = (String) session.getAttribute("user_id");
WishListDao wishlistDao = new WishListDao(); // WishlistDao 객체 생성

if (user_id == null) {
    response.sendRedirect("/00BookJSP/07users/login.jsp");
    return;
}

//카테고리 ID 가져오기
String catParam = request.getParameter("category_id");
long catId = 0; // 0이면 전체 책 목록을 의미
if (catParam != null && !catParam.trim().isEmpty()) {
   try {
      catId = Long.parseLong(catParam);
   } catch (Exception e) {
      catId = 0;
   }
}
ArrayList<WishListDto> dtos = (catId > 0) ? wishlistDao.selectWishList(user_id, catId) : wishlistDao.selectWishList(user_id);



ArrayList<WishListDto> filteredList = new ArrayList<>();
String lastWishBook = "";
for(WishListDto item : dtos){
   if(!item.getTitle().equals(lastWishBook)){
      filteredList.add(item);
      lastWishBook = item.getTitle();
   }
}

request.setAttribute("wishlistDtos", dtos);
;


//DAO를 통해 카테고리 목록 가져오기
CategoriesDao cateDao = new CategoriesDao();
List<CategoriesDto> categories = cateDao.selectAll();
request.setAttribute("categoriesList", categories);

CartDao cartDao = new CartDao(); 
ArrayList<Long> cartBookIds = cartDao.selectBookIdsInCart(user_id);
request.setAttribute("cartBookIds", cartBookIds);


%>

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
            <%@ include file="../03categories/select.jsp" %>
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
   <main>
      <div class="middle_header">
         <div class="middle_top">
            <ul>
               <li><a href="/00BookJSP//main.jsp"><img
                     src="../00img/home-black.png" id="home"></a></li>
               <li><a href="/00BookJSP/mypage.jsp">마이</a></li>
               <li>라이브러리</li>
               <li><a href="/00BookJSP/08wishlist/mywishlist.jsp">위시리스트</a></li>
            </ul>
         </div>
         <div class="middle">
            <div class="left">
               <div>
                  <div class="face">
                     <img src="/00BookJSP/00img/user.png">
                     <div class="name"><b>
               <%
               if (loggedInUser != null) {
               %>
               <%=loggedInUser.getUser_name()%>
               <%
               }
               %>
               님
            </b></div>
            <div class="rank"><img src="/00BookJSP/00img/crown.png">VIP</div>
            
                  </div>
               </div>
               <div id="menu">
                  <ul>
                     <li id="sub_menu">쇼핑내역
                        <ul>
                           <li><a href="/00BookJSP/05orders/ordersList.jsp">주문/배송목록</a></li>
                           <li>선물함</li>
                           <li>매장 구매 내역</li>
                           <li>영수증 조회/후 적립</li>
                        </ul>
                     </li>
                     <li id="sub_menu">회원정보
                        <ul>
                           <li><a href="/00BookJSP/07users/updateConfirm.jsp">회원정보
                                 수정</a></li>
                           <li>로그인 설정</li>
                           <li>마케팅 수신 설정</li>
                           <li><a href="/00BookJSP/01ship/shiplist.jsp">배송 주소록</a></li>
                        </ul>
                     </li>
                     <li id="sub_menu">라이브러리
                        <ul>
                           <li>메인</li>
                           <li>리스트</li>
                           <li>코멘트</li>
                           <li>문장수집</li>
                           <li><a href="/00BookJSP/08wishlist/mywishlist.jsp">위시리스트</a></li>
                           <li>구독</li>
                           <li>e-라이브러리</li>
                        </ul>
                     </li>
                     <li id="sub_menu">문의내역
                        <ul>
                           <li>1:1 문의</li>
                        </ul>
                     </li>
                  </ul>
               </div>
            </div>
            <div class="right">
               <div class="wish">
                  <div class="title">위시리스트</div>
                  <div class="tab">
                     <hr style="margin-top: 10px;">
                     <ul>
                        <li><a href="mywishlist.jsp" class="custom-btn">전체</a></li>
                        <c:forEach var="categories" items="${categoriesList}">
                           <li><a
                              href="mywishlist.jsp?category_id=${categories.category_id}"
                              class="custom-btn"> ${categories.name} </a></li>
                        </c:forEach>
                     </ul>
                  </div>
                     <ul class="table">
                        <c:forEach var="wish" items="${wishlistDtos }">
                           <li>
                              <div class="content">
                                 <img src="${pageContext.request.contextPath}${wish.image}"
                                    alt="${wish.title}">
                                 <p>${wish.author}<br>${wish.title}</p>
                              </div>
                              <div class="buttons">
                                 <form action="/00BookJSP/08wishlist/wishlistDB.jsp" method="get">
                            <input type="hidden" name="book_id" value="${wish.book_id}">
                            <button type="submit" class="detail-btn">❤️</button>
                        </form>


            
                        <form action="/00BookJSP/04cart/insertDB.jsp" method="get">
						  <input type="hidden" name="book_id" value="${wish.book_id}">
						  <c:choose>
						    <c:when test="${cartBookIds.contains(wish.book_id)}">
						      <button type="submit" class="detail-btn">🛍️</button>
						    </c:when>
						    <c:otherwise>
						      <button type="submit" class="detail-btn">🛒</button>
						    </c:otherwise>
						  </c:choose>
						</form>


                              </div>
                           </li>
                        </c:forEach>
                     </ul>
               </div>
            </div>
         </div>
      </div>
   </main>
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
            <img src="/00BookJSP/00img/ft_logo.png" alt="로켓서점">
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