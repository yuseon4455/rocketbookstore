<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.the.dao.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> 주소수정하기 </title>
<link rel="stylesheet" href="/00BookJSP/00css/shipUpdate.css">
<link rel="stylesheet" href="../00css/style.css">
<link rel="stylesheet" href="../00css/base.css">
<link rel="stylesheet" href="../00css/common.css">
<link rel="shortcut icon" href="/00BookJSP/00img/ico_favicon.ico" type="image/x-icon">
  
</head>
<body>

<%
    long ship_id = Long.parseLong(request.getParameter("ship_id"));
   session.setAttribute("ship_id", ship_id);
   
   String address = request.getParameter("address");
    ShipDao dao = new ShipDao();
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
      </div><!-- headerTop -->
      <div class="headerBottom">
         <a href="#" class="open_btn"> <span></span> <span></span> <span></span>
            <span></span>
         </a>
         <ul class="menu">

         </ul>
         <ul class="hbUtil">
            <li><a href="../04cart/cartList.jsp">
               <img src="../00img/ico_cart.png">
            </a></li>
            <li><a href="../mypage.jsp">
               <img src="../00img/ico_user.png">
            </a></li>
         </ul>
      </div><!-- "headerBottom" -->
      <div class="headerLine"></div>
   </header>
   <div class="middle_header">
         <div class="middle_top">
         <ul>
            <li><a href="/00BookJSP//main.jsp"><img
                  src="../00img/home-black.png" id="home"></a></li>
            <li><a href="/00BookJSP/mypage.jsp">마이</a></li>
            <li>회원정보</li>
            <li><a href="/00BookJSP/01ship/shiplist.jsp">배송주소록</a></li>
            <li>주소수정하기</li>
         </ul>
      </div>
    </div>
<div class="middle">
        <div class="left">
               <div class="face">
                  <img src="/00BookJSP/00img/user.png">
               </div>
            <div class="name"><b>
                     <%
                     if (loggedInUser != null) {
                     %>
                     <%=loggedInUser.getUser_name()%>
                     <%
                     }
                     %> 님
               </b></div>
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
            </div><!-- left닫기 -->
   <div class="right">
      <div id="shipupdate">
         <div class="title">주소 수정하기</div>
         <table>
      
            <thead>
               <tr>
                  <th>목록</th><th>주소</th>
               </tr>
            </thead>
            <tbody>
               <tr>
                  <td>주소</td><td><%=address %></td>
               </tr>
               <tr>
                  <td>변경주소</td>
                  <td>
                  <form action="shipUpdateDB.jsp" method="get">
                     <input type="text" name="address" size=60px>
                     <input id="change" type="submit" value="변경">
                  </form>
                  </td>
               </tr>
            </tbody>
         </table>
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