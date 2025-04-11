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
<title>Insert title here</title>
<link rel="stylesheet" href="/00BookJSP/00css/base.css">
<link rel="stylesheet" href="/00BookJSP/00css/common.css">
<link rel="stylesheet" href="/00BookJSP/00css/ordersSelectId.css">
<link rel="shortcut icon" href="./00img/ico_favicon.ico" type="image/x-icon">
</head>
<body>
   <%
   String order_id = (String) session.getAttribute("order_id");
   String order_time = (String) session.getAttribute("order_time");

   ArrayList<OrdersReciptDto> reciptList = OrdersReciptDao.selectAll2(order_id);
   if (reciptList != null) {
      for (OrdersReciptDto item : reciptList) {
         System.out.println(item);
      }
   } else {
      response.sendRedirect("cartList.jsp");
   }

   request.setAttribute("reciptList", reciptList);

   BooksDao booksDao = new BooksDao();

   int totalPrice1 = 4000;
   for (OrdersReciptDto item : reciptList) {
      BooksDto book = booksDao.selectAll(item.getBook_id()); // book_id로 책 정보 가져오기
      if (book != null) {
         totalPrice1 += book.getPrice() * item.getAmount(); // 가격 * 수량
      }
   }

   request.setAttribute("totalPrice1", totalPrice1);
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

   <div id="thankyou">
      <h1>"주문이 정상적으로 완료되었습니다."</h1>
      <table>
         <tr>
            <th>주문 번호</th>
            <td><%=order_id%></td>
         </tr>
         <tr>
            <th>주문 시간</th>
            <td><%=order_time%></td>
         </tr>
         <tr>
            <th colspan="2">주문 목록</th>
         </tr>
         <c:forEach var="recipt" items="${reciptList }" varStatus="status">
            <tr>
               <td>${recipt.title }</td>
               <td>${recipt.amount }</td>
            </tr>
         </c:forEach>
         <tr>
            <th colspan="2">총 가격 : ${totalPrice1} 원</th>
         </tr>

         </tbody>
      </table>
      <p>
         ※ 주문 내역 및 배송에 관한 안내는 <a href="/00BookJSP/05orders/ordersList.jsp"><span>주문/배송목록</span></a>
         을 통하여 확인 가능합니다.
      </p>
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