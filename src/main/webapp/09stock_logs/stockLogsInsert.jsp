<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.the.dao.StockLogsDao"%>
<%@ page import="com.the.dto.StockLogsDto"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>입고 현황 입력</title>
<link rel="stylesheet" href="../00css/base.css">
<link rel="stylesheet" href="../00css/owner.css">
<link rel="shortcut icon" href="../00img/ico_favicon.ico"
	type="image/x-icon">
<style>
* {
	margin: 0 auto;
	padding: 0;
}

a {
	color: inherit;
	text-decoration: none;
}

ul, ol {
	list-style: none;
}

img {
	vertical-align: top;
}

h1, h2, h3, h4, h5, h6 {
	line-height: 1em;
}

.clear::after {
	content: '';
	display: block;
	clear: both;
}

button {
	cursor: pointer;
}

h2 {
	width: 800px;
	font-size: 35px;
	text-align: center;
	padding: 60px 0 30px 0;
	font-weight: bolder;
}

h3 {
	width: 800px;
	font-size: 20px;
	text-align: center;
	margin-bottom: 10px;
}

form {
	width: 380px;
	margin: 0 auto;
}
</style>
</head>
<body>
	<div id="wrap">
		<h1>
			<a href="<%=request.getContextPath()%>/00administrator/ownerPage.jsp">
				<img src="../00img/adimnLogo.png" alt="로켓서점">
			</a>
		</h1>
		<div class="logout">
			<span><%@ include file="../07users/header1.jsp"%></span>
			<a href="<%=request.getContextPath()%>/07users/logout.jsp">로그아웃</a>
		</div>
		<h2>
			<a href="00stockLogsMain.jsp">재고 관리</a>
		</h2>
		<h3>입고 현황 입력</h3>
		<form action="stockLogsInsertDB.jsp" method="post">
			<label for="book_id">도서 ID: <input type="number"
				name="book_id" required></label><br> <label for="in_stock">입고
				수량: <input type="number" name="in_stock" required>
			</label><br>
			<button type="submit">입고 처리</button>
		</form>
	</div>
</div>


</body>
</html>