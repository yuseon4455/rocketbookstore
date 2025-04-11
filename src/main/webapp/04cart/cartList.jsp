<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="com.the.dao.*"%>
<%@ page import="com.the.dto.*"%>
<%@ page import="java.util.*"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니</title>
<link rel="stylesheet" href="/00BookJSP/00css/base.css">
<link rel="stylesheet" href="/00BookJSP/00css/common.css">
<link rel="stylesheet" href="/00BookJSP/00css/style.css">
<link rel="stylesheet" href="/00BookJSP/00css/cart.css">
<link rel="shortcut icon" href="/00BookJSP/00img/ico_favicon.ico" type="image/x-icon">
</head>
<body>
   <%
   String user_id = (String) session.getAttribute("user_id");//id 받아오고
   if (user_id == null) {
      response.sendRedirect("../07users/login.jsp");
   }

   CartBookDao cbdao = new CartBookDao();
   ArrayList<CartBookDto> cartDto = cbdao.selectAll2(user_id); //해당 아이디의 테이블
   request.setAttribute("cartBookList", cartDto); //테이블 전송

   for (CartBookDto item : cartDto) { //이거는 해당 id select문 출력임
      System.out.println(item);
   }

   ArrayList<ShipDto> shipDto = ShipDao.selectAll2(user_id); //해당 아이디의 테이블
   session.setAttribute("shiplist", shipDto); //테이블 전송
   //아이디가 있는지 없는지 확인은 로그인페이지에서 함 여기는 로그인을 해야 접속할 수 있음
   for (ShipDto item : shipDto) { //이거는 해당 id select문 출력임
      System.out.println(item);
   }

   // 총가격
   Long totalPrice = (session.getAttribute("totalPrice") != null ? (Long) session.getAttribute("totalPrice") : 0L);
   %>
   <div class="eventHeader">
      <p>회원 가입 시<span> 첫구매 100원</span> 이벤트</p>
   </div>
   <header id="header">
      <div class="headerTop">
         <h1 class="logo">
            <a href="/00BookJSP/main.jsp"><img src="../00img/logo.png" alt="로켓서점"></a>
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
            <li><a href="/00BookJSP/mypage.jsp"> <img src="../00img/ico_user.png">
            </a></li>
         </ul>
      </div>
      <!-- "headerBottom" -->
      <div class="headerLine"></div>
   </header>
   <div id="cartListcontent">
      <form action="/00BookJSP/04cart/cartListDB.jsp" method="get">
         <div id="cartcenter">
            <div id="cart">
               <div id="cartprice">
                  <h2>장바구니</h2>
                  <table>
                     <thead>
                        <tr>
                           <th></th>
                           <th>번호</th>
                           <!-- <th>책ID</th>-->
                           <th>제목</th>
                           <th>수량</th>
                           <th>가격</th>
                           <!-- <th>선택</th>-->
                        </tr>
                     </thead>
                     <tbody>
                        <c:forEach var="cartBooks" items="${cartBookList }" varStatus="status">
                           <tr>
                              <th><input type="checkbox" name="cart_id[]" value="${cartBooks.cart_id }"></th>
                              <td>${status.index + 1}</td>
                              <!-- <td>${cartBooks.book_id }</td>-->
                              <td>${cartBooks.title }</td>
                              <!-- 각 항목별 개별 폼  -->
                              <form action="/00BookJSP/04cart/update.jsp" method="get">
                                 <td>
                                    <input type="hidden" name="cart_id" value="${cartBooks.cart_id }">
                                    <input id="qamount" type="number" name="amount" value="${cartBooks.amount }" min="1">
                                    <button id="change" type="submit" formaction="/00BookJSP/04cart/update.jsp" formmethod="get">수정</button>
                                 </td>
                                 <td>
                                 	<fmt:formatNumber value="${cartBooks.price}" type="number" groupingUsed="true" />원</td>
                              </form>
                           </tr>
                        </c:forEach>
                     </tbody>
                  </table>
                  <div id="totalpricebtn">
                     <button type="submit" formaction="/00BookJSP/04cart/priceCal.jsp">총가격</button>
                     <fmt:formatNumber value="${totalPrice}" type="number" groupingUsed="true" />원
                  </div>
               </div>
               <div id="ship">
                  <h2>배송지선택</h2>
                  <select id="shipselect" name="ship_id">
                     <c:forEach var="ship" items="${shiplist }">
                        <option value=${ship.ship_id }>${ship.address }</option>
                     </c:forEach>
                  </select>
                  <div style="margin-top: 10px;">
                     <button id="orderbtn" type="submit" formaction="/00BookJSP/04cart/cartListDB.jsp">주문하기</button>
                     <button id="delbtn" type="submit" formaction="/00BookJSP/04cart/delete.jsp">선택 항목 삭제</button>
                  </div>
                  <div id="plusbook">
                     <a href="/00BookJSP/main.jsp"> 상품 추가하기 </a>
                  </div>
               </div>
            </div>
         </div>
         <div id="notecenter">
            <div id="note">
               <h2>장바구니 유의사항</h2>
               <ul>
                  <li>로켓서점은 자체 택배 시스템을 운영하며, 주문이 접수되면 즉시 배송이 시작됩니다. </li>
                  <li>배송 준비가 빠르게 진행되기 때문에 주문 후 배송지 변경은 불가능합니다.</li>
                  <li>주문서에서 배송일정을 꼭 확인하시기 바랍니다.</li>
                  <li>주문 완료 후 상품 품절로 인해 자동 취소될 수 있습니다.</li>
                  <li>배송조회는 마이페이지>주문/배송목록에서 확인하실 수 있습니다.</li>
                  <li>배송비는 4,000원이며 총가격에 자동으로 포함됩니다.</li>
               </ul>
            </div>
         </div>
      </form>
   </div>
   <!-- <a href="../main.jsp">홈으로</a>-->
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