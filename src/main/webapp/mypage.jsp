<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="com.the.dto.*"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.the.dao.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://unpkg.com/swiper/swiper-bundle.js"></script>
<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
<link rel="stylesheet" href="/00BookJSP/00css/base.css">
<link rel="stylesheet" href="/00BookJSP/00css/common.css">
<link rel="shortcut icon" href="/00BookJSP/00img/ico_favicon.ico" type="image/x-icon">
<link rel="stylesheet" href="/00BookJSP/00css/mypage.css">
<link rel="stylesheet" href="/00BookJSP/00css/style.css">
<%
String user_id = (String) session.getAttribute("user_id");
WishListDao wishlistDao = new WishListDao(); // WishlistDao 객체 생성
ArrayList<WishListDto> wishlistDtos = wishlistDao.selectWishList(user_id);

if (user_id == null) {
    response.sendRedirect("/00BookJSP/07users/login.jsp");
    return;
}

ArrayList<WishListDto> filteredList = new ArrayList<>();
String lastWishBook = "";
for (WishListDto item : wishlistDtos) {
   if (!item.getTitle().equals(lastWishBook)) {
      filteredList.add(item);
      lastWishBook = item.getTitle();
   }
}

request.setAttribute("wishlistDtos", wishlistDtos);

//
request.setAttribute("wishlistCount", filteredList.size());

ArrayList<ShipDto> shipDto = ShipDao.selectAll2(user_id);
request.setAttribute("shipCount", shipDto.size());

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
            <a href="/00BookJSP/main.jsp"><img src="/00BookJSP/00img/logo.png" alt="로켓서점"></a>
         </h1>
         <form class="searchForm">
            <input type="text" placeholder="검색어를 입력하세요">
            <button class="submit"></button>
         </form>
         <%@ include file="07users/header.jsp"%>
      </div><!-- headerTop -->
      <div class="headerBottom">
         <a href="#" class="open_btn"> <span></span> <span></span> <span></span>
            <span></span>
         </a>
         <ul class="menu">
         <%@ include file="../03categories/select.jsp" %>
         </ul>
         <ul class="hbUtil">
            <li><a href="/00BookJSP/04cart/cartList.jsp">
               <img src="/00BookJSP/00img/ico_cart.png">
            </a></li>
            <li><a href="/00BookJSP/mypage.jsp">
               <img src="/00BookJSP/00img/ico_user.png">
            </a></li>
         </ul>
      </div><!-- "headerBottom" -->
      <div class="headerLine"></div>
   </header>
   <div class="back">
   <main style="height:1200px;">
      <div class="middle_header">
         <div class="middle_top">
            <ul>
               <li><a href="/00BookJSP/main.jsp"><img src="/00BookJSP/00img/home.png" id="home"></a></li>
               <li><a href="/00BookJSP/mypage.jsp">마이</a></li>
            </ul>
         </div>
         <div class="middle">
            <div class="left">
               <div>
                  <img src="/00BookJSP/00img/user.png">
               </div>
               <div class="name">
                  <%
                  if (loggedInUser != null) {
                  %>
                  <%=loggedInUser.getUser_name()%>
                  <%
                  }
                  %> 님
                  </div>
               <div class="rank"><img src="/00BookJSP/00img/crown.png">VIP</div>
               <div id="box">
                  <ul>
                     <li class="middle-left-box">
                        <p><a href="/00BookJSP/08wishlist/mywishlist.jsp">위시리스트</a></p>
                        <b><a href="/00BookJSP/08wishlist/mywishlist.jsp">${wishlistCount }</a></b>
                     </li>
                     <li>
                        <p><a href="/00BookJSP/01ship/shiplist.jsp">배송지</a></p>
                        <b><a href="/00BookJSP/01ship/shiplist.jsp">${shipCount}</a></b>
                     </li>
                  </ul>
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
                           <li><a href="/00BookJSP/07users/updateConfirm.jsp">회원정보 수정</a></li>
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
               <div id="recommend">추천 도서 리스트</div>
               <div id="recommendList">
                  <ul>
                     <li id="back1">
                        <div class="img_inner_box">
                           <img src="/00BookJSP/00img/novel/novel4.jpg">
                        </div>
                        <div id="title">
                           <div>
                              <b>소년이 온다</b>
                           </div>
                           <div id="title1">10% 13,500원</div>
                        </div>
                     </li>
                     <li id="back2">
                        <div class="img_inner_box">
                           <img src="/00BookJSP/00img/novel/novel7.jpg">
                        </div>
                        <div id="title">
                           <div>
                              <b>작별하지 않는다</b>
                           </div>
                           <div id="title1">10% 15,120원</div>
                        </div>
                     </li>
                     <li id="back3">
                        <div class="img_inner_box">
                           <img src="/00BookJSP/00img/novel/novel22.jpg">
                        </div>
                        <div id="title">
                           <div>
                              <b>채식주의자</b>
                           </div>
                           <div id="title1">10% 13,500원</div>
                        </div>
                     </li>
                  </ul>
               </div>
               <div id="point">
                  <ul>
                     <li>
                        <div>
                           <img src="/00BookJSP/00img/profit.png">
                        </div>
                        <div class="money">
                           <div>
                              <b>적립금</b>
                           </div>
                           <div id="pp">300p</div>
                        </div>
                     </li>
                     <li>
                        <div>
                           <img src="/00BookJSP/00img/gift-card.png">
                        </div>
                        <div class="money">
                           <div>
                              <b>문화상품권</b>
                           </div>
                           <div id="pp">1000원</div>
                        </div>
                     </li>
                     <li>
                        <div>
                           <img src="/00BookJSP/00img/favourite.png">
                        </div>
                        <div class="money">
                           <div>
                              <b>리뷰포인트</b>
                           </div>
                           <div id="pp">300p</div>
                        </div>
                     </li>
                     <li>
                        <div>
                           <img src="/00BookJSP/00img/dollar.png">
                        </div>
                        <div class="money">
                           <div>
                              <b>누적구매금액</b>
                           </div>
                           <div id="pp">100000원</div>
                        </div>
                     </li>
                  </ul>
               </div>
               <div id="coupon">
                  <div>
                     <div>
                        <b>쿠폰</b>
                     </div>
                     <div id="mon">0장</div>
                  </div>
                  <div class="middle-box">
                     <div>
                        <b>캐시</b>
                     </div>
                     <div id="mon">0원</div>
                  </div>
                  <div>
                     <div>
                        <b>예치금</b>
                     </div>
                     <div id="mon">0원</div>
                  </div>
               </div>
               <div class="wish">
                  <div class="title">
                     위시리스트
                  </div>
                  <div id="more"><a href="08wishlist/mywishlist.jsp">더보기 ></a></div>
                  <div class="table">
                     <c:forEach var="wish" begin="0" end="3" items="${wishlistDtos }">
                        <div>
                           <img src="${pageContext.request.contextPath}${wish.image }"
                              alt="${wish.title}">
                           <p>${wish.author }<br>${wish.title }</p>
                        </div>
                     </c:forEach>
                  </div>
               </div>
            </div>
         </div>
      </div>
   </main>
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
   
   
   </script>
</body>
</html>