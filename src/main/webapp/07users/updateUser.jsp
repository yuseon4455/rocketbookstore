<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="com.the.dto.*"%>
<%@page import="com.the.dao.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보 수정</title>
<link rel="stylesheet" href="../00css/base.css">
<link rel="stylesheet" href="../00css/pwCheck.css">
<link rel="stylesheet" href="../00css/updateUser.css">
<link rel="stylesheet" href="../00css/common.css">
<link rel="shortcut icon" href="/00BookJSP/00img/ico_favicon.ico" type="image/x-icon">
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

   <script>
      // 업데이트 성공 여부 확인 후 팝업 띄우기
      window.onload = function() {
         var params = new URLSearchParams(window.location.search);
         var successMessage = params.get("successMessage");
         if (successMessage) {
            alert(successMessage);
            window.location.href = "updateUser.jsp"; // 현재 페이지 새로고침
         }
      };
   </script>

   <%
/*    UsersDto loggedInUser = (UsersDto) session.getAttribute("loggedInUser"); */
   /*    request.setAttribute("user", loggedInUser); */
   String user_name = loggedInUser.getUser_name();
   String user_pw = loggedInUser.getUser_pw();
   String email = loggedInUser.getEmail();
   String phone = loggedInUser.getPhone();
   %>

   <div class="middle_header">
      <div class="middle_top">
         <ul>
            <li><a href="/00BookJSP//main.jsp"><img
                  src="../00img/home-black.png" id="home"></a></li>
            <li><a href="/00BookJSP/mypage.jsp">마이</a></li>
            <li>회원정보</li>
            <li>회원정보확인</li>
            <li><a href="/00BookJSP/07users/updateConfirm.jsp">회원정보 수정</a></li>
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
               <div class="rank">
               <img src="/00BookJSP/00img/crown.png">VIP
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
            <div>
               <p class="font1">회원 정보 수정</p>
               <div id="box2">
                  <p class="font2">기본정보</p>
                  <hr class="divider">
                  <!-- 이름 수정 -->
                  <form action="updateUserDB.jsp" method="post" class="form2">

                     <label class="font3">이름</label>
                     <div class="box3">
                        <input type="text" name="user_name" class="input1"
                           value="<%=user_name %>"> <input type="submit"
                           class="submit-btn" value="수정">

                     </div>

                  </form>

                  <!-- 비밀번호 수정 -->
                  <form action="updateUserDB.jsp" method="post" class="form2">

                     <label class="font3">변경할 비밀번호</label>
                     <div class="box3">
                        <input type="password" name="user_pw" class="input1"> <input
                           type="submit" class="submit-btn" value="수정">
                        <c:if test="${not empty param.errorMessage}">
                           <p class="warning-msg">
                              <c:out value="${param.errorMessage}" />
                           </p>
                        </c:if>
                     </div>

                  </form>

                  <!-- 이메일 수정 -->
                  <form action="updateUserDB.jsp" method="post" class="form2">

                     <label class="font3">이메일</label>
                     <div class="box3">
                        <input type="email" name="email" class="input1"
                           value="<%=email%>"> <input type="submit"
                           class="submit-btn" value="수정">
                        <c:if test="${not empty param.errorMessage_email}">
                           <p class="warning-msg"">
                              <c:out value="${param.errorMessage_email}" />
                           </p>
                        </c:if>
                     </div>

                  </form>

                  <!-- 전화번호 수정 -->
                  <form action="updateUserDB.jsp" method="post" class="form2">

                     <label class="font3">전화번호</label>
                     <div class="box3">
                        <input type="tel" name="phone" class="input1" value="<%=phone%>">
                        <input type="submit" class="submit-btn" value="수정">
                        <c:if test="${not empty param.errorMessage_phone}">
                           <p class="warning-msg">
                              <c:out value="${param.errorMessage_phone}" />
                           </p>
                        </c:if>
                     </div>

                  </form>
               </div>

               <div class="delete-a">
                  <a href="deleteUser.jsp">회원탈퇴</a>
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
   </script>

</body>
</html>
