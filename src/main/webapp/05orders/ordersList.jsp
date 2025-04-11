<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="com.the.dao.*"%>
<%@page import="com.the.dto.*"%>
<%@page import="java.util.*"%>
<%@page import="java.time.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문목록</title>
<link rel="stylesheet" href="/00BookJSP/00css/ordersList.css">
<link rel="stylesheet" href="../00css/style.css">
<link rel="stylesheet" href="../00css/base.css">
<link rel="stylesheet" href="../00css/common.css">
<link rel="shortcut icon" href="/00BookJSP/00img/ico_favicon.ico" type="image/x-icon">

</head>
<body>
   <%
   String user_id = (String) session.getAttribute("user_id");

   if (user_id == null) {
      response.sendRedirect("/00BookJSP/07users/login.jsp");
      return;
   }

   // 페이징 처리 변수 설정
   int pageSize = 20; // 한 페이지에 보여줄 항목 수
   int currentPage = 1;
   if (request.getParameter("page") != null) {
      currentPage = Integer.parseInt(request.getParameter("page"));
   }

   ArrayList<OrdersDto> allOrders = OrdersDao.selectAll3(user_id);

   int totalOrders = allOrders.size();
   int totalPages = (int) Math.ceil((double) totalOrders / pageSize);
   int startIndex = (currentPage - 1) * pageSize;
   int endIndex = Math.min(startIndex + pageSize, totalOrders);

   List<OrdersDto> paginatedOrders = allOrders.subList(startIndex, endIndex);

   request.setAttribute("ordersList", paginatedOrders);
   request.setAttribute("totalPages", totalPages);
   request.setAttribute("currentPage", currentPage);
   %>

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
   <div class="middle_header">
      <div class="middle_top">
         <ul>
            <li><a href="/00BookJSP//main.jsp"><img
                  src="../00img/home-black.png" id="home"></a></li>
            <li><a href="/00BookJSP/mypage.jsp">마이</a></li>
            <li>쇼핑내역</li>
            <li><a href="/00BookJSP/05orders/ordersList.jsp">주문배송목록</a></li>
         </ul>
      </div>
      <div class="middle">
         <div class="left">
            <div class="face">
               <img src="/00BookJSP/00img/user.png">
            </div>
            <div class="name">
               <b> <%
 if (loggedInUser != null) {
 %> <%=loggedInUser.getUser_name()%> <%
 }
 %> 님
               </b>
            </div>
            <div class="rank">
               <img src="/00BookJSP/00img/crown.png">VIP
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
         <!-- left닫기 -->
         <div class="right">
            <div id="ordersList">
               <div class="title">주문목록</div>
               <table>
                  <thead>
                     <tr>
                        <th>목록</th>
                        <th>주문번호</th>
                        <th>주문시간</th>
                        <th>삭제</th>
                     </tr>
                  </thead>
                  <tbody>
                     <c:forEach var="order" items="${ordersList }" varStatus="status">
                        <tr>
                           <td>${status.index+1 }</td>
                           <td><a href="ordersDetail.jsp?order_id=${order.order_id}">
                                 ${order.order_id }</a></td>
                           <td>${order.order_date }</td>
                           <td>
                              <form action="ordersListDelDB.jsp" method="get">
                                 <input type="hidden" name="order_id"
                                    value="${order.order_id}" />
                                 <button class="change" type="submit">삭제</button>
                              </form>
                           </td>
                        </tr>
                     </c:forEach>
                  </tbody>
               </table>
               <div class="pagination">
                  <c:if test="${currentPage > 1}">
                     <a href="ordersList.jsp?page=${currentPage - 1}">이전</a>
                  </c:if>

                  <c:forEach begin="1" end="${totalPages}" var="page">
                     <a href="ordersList.jsp?page=${page}"
                        class="${currentPage == page ? 'active' : ''}">${page}</a>
                  </c:forEach>

                  <c:if test="${currentPage < totalPages}">
                     <a href="ordersList.jsp?page=${currentPage + 1}">다음</a>
                  </c:if>
               </div>
            </div>
         </div>
      </div>
   </div>
   <!-- <a href="../userMain.jsp">메인페이지</a>-->
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
   </script>

</body>
</html>