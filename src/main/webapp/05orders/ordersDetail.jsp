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
<title>주문정보</title>
<link rel="stylesheet" href="/00BookJSP/00css/ordersDetail.css">
<link rel="stylesheet" href="../00css/style.css">
<link rel="stylesheet" href="../00css/base.css">
<link rel="stylesheet" href="../00css/common.css">
<link rel="shortcut icon" href="/00BookJSP/00img/ico_favicon.ico" type="image/x-icon">

<style>
th, td {
   text-align: left;
   padding-left: 30px;
}
</style>
</head>
<body>
   <%
   String user_id = (String) session.getAttribute("user_id");
   String order_id = request.getParameter("order_id");
   request.setAttribute("order_id", order_id);

   ArrayList<OrdersReciptDto> dtos = OrdersReciptDao.selectAll2(order_id);
   request.setAttribute("ordersReciptList", dtos);
   for (OrdersReciptDto item : dtos) {
      System.out.println(item);
   }


   String history_id = dtos.get(0).getHistory_id();
   long ship_id = dtos.get(0).getShip_id();

   ShipDto shipDto = ShipDao.selectAll(user_id, ship_id);
   System.out.println(shipDto);
   request.setAttribute("shipDto", shipDto);

   BooksDao booksDao = new BooksDao();

   int totalPrice = 4000;
   for (OrdersReciptDto item : dtos) {
      BooksDto book = booksDao.selectAll(item.getBook_id());// book_id로 책 정보 가져오기
      if (book != null) {
         totalPrice += book.getPrice() * item.getAmount(); // 가격 * 수량
      }
   }

   request.setAttribute("totalPrice", totalPrice);
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
         <%@ include file="../03categories/select.jsp" %>
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
            <li>주문정보</li>
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
                   %>님
               </b>
            </div>
            <div class="rank"><img src="/00BookJSP/00img/crown.png">VIP</div>
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
                        <li><a href="/00BookJSP/07users/updateUser.jsp">회원정보 수정</a></li>
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
            <div class="title">주문정보</div>
            <table>
               <thead>
                  <tr>
                     <th colspan="2">주문번호 : <%=order_id%></th>
                  </tr>
               </thead>
               <tbody>
                  <tr>
                     <th colspan="2"><a
                        href="../06history/historyId.jsp?history_id=RK<%=order_id%>">
                           운송장번호 : RK<%=order_id%></a></th>
                  </tr>
                  <tr>
                     <th colspan="2">배송지</th>
                  </tr>
                  <tr>
                     <td colspan="2">${shipDto.address}</td>
                  </tr>
                  <tr>
                     <th colspan="2">주문상품</th>
                  </tr>
                  <c:forEach var="recipt" items="${ordersReciptList }">
                     <tr>
                        <td>${recipt.title }</td>
                        <td>${recipt.amount }</td>
                     </tr>
                  </c:forEach>
                  <tr>
                     <th colspan="2">총 가격 : ${totalPrice} 원</th>
                  </tr>
               </tbody>
            </table>

            <div id="notecenter">

               <div id="note">
                  <h4>유의사항</h4>
                  <ul>
                     <li>배송조회는 택배사로 상품전달 후 조회 가능합니다.</li>
                     <li>eBook은 구매 후 다운로드 시 이용할 수 있습니다.</li>
                     <li>주문한 상품이 품절될 경우 해당 상품은 자동 취소 신청되며, 취소금액은 승인 취소 또는 예치금으로
                        변환됩니다.</li>
                     <li>반환된 예치금은 나의 통장 > 예치금에서 환불신청시, 신청계좌로 환불해 드립니다.</li>
                  </ul>
               </div>
               <div id="cardcancel">
                  <h4>카드결제 취소 안내</h4>
                  <ul>
                     <li>전체취소 : 당일 취소/환불 처리</li>
                     <li>부분취소 : 영업일 기준 3~5일 소요(당일 취소 포함)</li>
                     <li>카드사에서 부부취소를 지원하지 않는 카드의 경우 승인취소가 아닌 예치금으로 환불됩니다.</li>
                     <li>주문취소시 오류가 발생하거나 환불이 정상 처리되지 않을 경우 1:1로 문의 주시기 바랍니다.</li>
                  </ul>
               </div>
            </div>
         </div>
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