<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 메인페이지</title>
<link rel="stylesheet" href="../00css/base.css">
<link rel="stylesheet" href="../00css/owner.css">
<link rel="shortcut icon" href="../00img/ico_favicon.ico" type="image/x-icon">
</head>
<body>
	<div id="wrap">
		<h1>
			<a href="ownerPage.jsp">
				<img src="/00BookJSP/00img/adimnLogo.png" alt="로켓서점">
			</a>
		</h1>
		<div class="logout">
			<span><%@ include file="../07users/header1.jsp"%></span>
			<a href="<%=request.getContextPath()%>/07users/logout.jsp">로그아웃</a>
		</div>
		<ul class="menu">
   			<li><a href="<%=request.getContextPath()%>/01ship/shipSelect.jsp">배송지 전체</a></li>
 		   	<li><a href="<%=request.getContextPath()%>/09stock_logs/stockLogsSelect.jsp">재고 관리</a></li>
    		<li><a href="<%=request.getContextPath()%>/07users/member.jsp">회원 관리</a></li>
    		<li><a href="<%=request.getContextPath()%>/02books/adminSelect.jsp">도서 관리</a></li>
    		<li><a href="<%=request.getContextPath()%>/05orders/ordersSelect.jsp">주문 관리</a></li>
		</ul>
		<div class="line"></div>
	</div>



</body>
</html>