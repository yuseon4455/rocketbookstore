<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Stock logs</title>
<style>
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

body {
	text-align: center;
}

a {
	color: inherit;
	text-decoration: none;
}

ul {
	list-style: none;
	padding: 0;
}

li {
	font-size: 20px;
	margin: 10px 15px;
	display: inline-block;
}
</style>
</head>
<body>
	<div id="wrap">
		<h1>
			<a href="<%=request.getContextPath()%>/00administrator/ownerMain.jsp">
				<img src="../00img/adimnLogo.png" alt="로켓서점">
			</a>
		</h1>
		<div class="logout">
			<span><%@ include file="../07users/header1.jsp"%></span>
			<a href="<%=request.getContextPath()%>/07users/logout.jsp">로그아웃</a>
		</div>
		<ul class="menu">
			<li><a
				= href="<%=request.getContextPath()%>/01ship/shipSelect.jsp">배송지
					전체</a></li>
			<li><a
				= href="<%=request.getContextPath()%>/09stock_logs/00stockLogsMain.jsp">재고
					관리</a></li>
			<li><a = href="<%=request.getContextPath()%>/07users/member.jsp">회원
					관리</a></li>
			<li><a
				= href="<%=request.getContextPath()%>/02books/adminSelect.jsp">도서
					관리</a></li>
			<li><a
				= href="<%=request.getContextPath()%>/05orders/ordersSelect.jsp">주문
					관리</a></li>
		</ul>
		<h2>재고 관리 (관리자 모드)</h2>
		<ul>
			<li><a href="stockLogsSelect.jsp">전체 재고 조회(select)</a></li>
			<li><a href="stockLogsInsert.jsp">입고 현황 입력(insert)</a></li>
		</ul>
		<a href="../00administrator/ownerPage.jsp">홈으로 이동</a><br>
	</div>
</body>
</html>
