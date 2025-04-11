
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@ page import="com.the.dao.StockLogsDao"%>
<%@ page import="com.the.dto.StockLogsDto"%>
<%@ page import="java.util.*"%>
<%
// DAO에서 전체 로그 리스트를 받아옴
ArrayList<StockLogsDto> dtos = StockLogsDao.selectAllLogs();

// 각 book_id별 최신 log_id를 저장할 Map 생성
Map<Long, Long> latestLogIdMap = new HashMap<>();
for (StockLogsDto dto : dtos) {
	Long bookId = dto.getBook_id();
	Long logId = dto.getLog_id();
	if (!latestLogIdMap.containsKey(bookId) || logId > latestLogIdMap.get(bookId)) {
		latestLogIdMap.put(bookId, logId);
	}
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>재고 현황 조회</title>
<link rel="stylesheet" href="../00css/base.css">
<link rel="stylesheet" href="../00css/owner.css">
<link rel="shortcut icon" href="../00img/ico_favicon.ico"
	type="image/x-icon">
<style>
h2 {
	width: 800px;
	font-size: 35px;
	text-align: center;
	padding: 60px 0 30px 0;
	font-weight: bolder;
}

h3 {
	text-align:center;
	font-size: 20px;
	text-align: center;
	margin-bottom: 10px;
	margin-top:50px
}

ul {
	display: flex;
	width: 800px;
}

li {
	margin-bottom: 5px;
	font-size: 20px;
	margin-bottom: 10px;
}

table {
	width: 60%;
	border-collapse: collapse;
	margin-top: 50px;
	margin: 50px auto;
}

th, td {
	border: 1px solid black;
	padding: 8px;
	text-align: left;
}

thead>tr>th {
	background-color: #eee;
}

button {
	cursor: pointer;
}

form {
	width: 380px;
	margin: 0 auto;
}
.menu li:nth-child(2) a{
    color: black;
    text-decoration: underline;
}
</style>
</head>
<body>
	<div id="wrap">
		<h1>
			<a href="<%=request.getContextPath()%>/00administrator/ownerPage.jsp"> <img
				src="../00img/adimnLogo.png" alt="로켓서점">
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
		<h3>입고 현황 입력</h3>
		<form action="stockLogsInsertDB.jsp" method="post">
			<label for="book_id">도서 ID: <input type="number"
				name="book_id" required></label><br> <label for="in_stock">입고
				수량: <input type="number" name="in_stock" required>
			</label><br>
			<button type="submit">입고 처리</button>
		</form>
		<table>
			<thead>
				<tr>
					<th>log_id</th>
					<th>Book_id</th>
					<th>책 제목</th>
					<th>입고 수량</th>
					<th>주문 번호</th>
					<th>출고 수량</th>
					<th>현재 재고</th>
				</tr>
			</thead>
			<tbody>
				<%
				for (StockLogsDto dto : dtos) {
					// 최신 값인지 확인
					boolean isLatest = dto.getLog_id().equals(latestLogIdMap.get(dto.getBook_id()));
				%>
				<!-- isLatest가 true이면 배경 색 노란색으로 표시 -->
				<tr style="<%=isLatest ? "background-color: #ffff99;" : ""%>">
					<td><%=dto.getLog_id()%></td>
					<td><%=dto.getBook_id()%></td>
					<td><%=dto.getTitle()%></td>
					<td><%=dto.getIn_stock()%></td>
					<td><a href="../05orders/ordersSelect.jsp"><%=dto.getOrder_id() == null ? "" : dto.getOrder_id()%></a></td>
					<!--  -->
					<td><%=dto.getAmount()%></td>
					<td><%= dto.getStock() %></td>
				</tr>
				<%
                }
            %>


			</tbody>
		</table>
	</div>
</body>
</html>