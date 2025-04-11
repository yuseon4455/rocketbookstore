<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/style.css">
</head>
<body>
	<div id="fristheader">
        <p>책 어쩌고저쩌고 이벤트 우애웅앵! 첫구매 100원!</p>
    </div>
    <header id="header">
        <div class="header_box">
            <a href="/00BookJSP/07users/login.jsp"><img src="/00BookJSP/img/logo.png" alt="Logo"></a>
            <div class="search_box">           
                <input type="text" class="search" placeholder="검색어 입력">
                <img src="/00BookJSP/img/ico_search.png" alt="Search Icon" class="search_logo">
            </div>
            <div class="header_log">
                <ul>
                    <li><a href="/00BookJSP/07users/login.jsp">로그인</a></li>
                    <li>|</li>
                    <li><a href="/00BookJSP/07users/register.jsp">회원가입</a></li>
                    <li>|</li>
                    <li><a href="/00BookJSP/07users/login.jsp">주문배송</a></li>
                    <li>|</li>
                    <li><a href="/00BookJSP/07users/login.jsp">고객센터</a></li>
                </ul>
            </div>
        </div> 
        <div id="header_box2">
            <div class="head_sub1">
                <img src="/00BookJSP/img/ico_header.png" alt="" class="head_sub_logo">
                <ul>
                    <li><a href="#">베스트셀러</a></li>
                    <li><a href="#">신상품</a></li>
                    <li><a href="#">화제작</a></li>
                    <li><a href="#">추천작</a></li>
                    <li><a href="#">이벤트</a></li>
                </ul>
            </div>
            <div class="head_sub2">
                <img src="./cart.png" alt="">
                <img src="./login.png" alt="">
            </div>
        </div>       
    </header>
	<a href="/00BookJSP/02books/select.jsp">도서 리스트</a><br>
	<a href="/00BookJSP/03categories/select.jsp">도서 카테고리</a><br>
	<a href="main.jsp"> 마이페이지 </a>

<div id="footercontent">
        <a href="/00BookJSP/07users/login.jsp"><img src="/00BookJSP/img/logo.png" alt="Logo"></a>
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
        <h3 style="text-align: left;">Rocket bookstore</h3> &nbsp; &nbsp;충청북도 진천군 광혜원면 용소2길 33-19 (축현리 488-5) | 대표이사: 손준호 | 사업자등록번호: 301-85-08241 | 
        사업자정보확인 &nbsp;&nbsp; <p>ⓒ2025 로켓 서점</p>
    </div>
</body>
</html>