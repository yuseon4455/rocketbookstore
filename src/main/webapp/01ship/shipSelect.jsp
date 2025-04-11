<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="com.the.dao.*"%>
<%@page import="com.the.dto.*"%>
<%@page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../00css/base.css">
<link rel="stylesheet" href="../00css/owner.css">
<link rel="shortcut icon" href="../00img/ico_favicon.ico"
	type="image/x-icon">
<style>
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

th {
	background-color: #f2f2f2;
}
.menu li:nth-child(1) a{
    color: black;
    text-decoration: underline;
}
</style>
</head>
<body>
	<%
   //주소록
   ArrayList<ShipDto> shipDto = ShipDao.selectAll();         //해당 아이디의 테이블
   request.setAttribute("shiplist", shipDto);            //테이블 전송

   for (ShipDto item : shipDto) {                     //이거는 해당 id select문 출력임
      System.out.println(item);
   }
%>
	<div id="wrap">
		<h1>
			<a href="<%=request.getContextPath()%>/00administrator/ownerPage.jsp"> <img
				src="/00BookJSP/00img/adimnLogo.png" alt="로켓서점">
			</a>
		</h1>
		<div class="logout">
			<span><%@ include file="../07users/header1.jsp"%></span>
			<a href="<%=request.getContextPath()%>/07users/logout.jsp">로그아웃</a>
		</div>
		<ul class="menu">
			<li><a
				href="<%=request.getContextPath()%>/01ship/shipSelect.jsp">배송지
					전체</a></li>
			<li><a
				href="<%=request.getContextPath()%>/09stock_logs/stockLogsSelect.jsp">재고
					관리</a></li>
			<li><a href="<%=request.getContextPath()%>/07users/member.jsp">회원
					관리</a></li>
			<li><a
				href="<%=request.getContextPath()%>/02books/adminSelect.jsp">도서
					관리</a></li>
			<li><a
				href="<%=request.getContextPath()%>/05orders/ordersSelect.jsp">주문
					관리</a></li>
		</ul>
		<div class="line"></div>
		<table>
			<thead>
				<tr>
					<th>목록</th>
					<th>사용자ID</th>
					<th>주소</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="ship" items="${shiplist }">
					<tr>
						<td>${ship.ship_id }</td>
						<td>${ship.user_id }</td>
						<td>${ship.address }</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>

</body>
</html>