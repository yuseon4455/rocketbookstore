<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.the.dto.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
    com.the.dao.UsersDao dao = new com.the.dao.UsersDao();
   ArrayList<UsersDto> dtos = dao.selectAll();
    request.setAttribute("memberList", dtos);
    
    for(UsersDto dto:dtos){
       System.out.println(dto);
    }
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 명단(관리자 모드)</title>
<link rel="stylesheet" href="../00css/base.css">
<link rel="stylesheet" href="../00css/owner.css">
<link rel="shortcut icon" href="../00img/ico_favicon.ico" type="image/x-icon">
</head>
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
.menu li:nth-child(3) a{
    color: black;
    text-decoration: underline;
}
</style>
</head>
<body>
		<div id="wrap">
		<h1>
			<a href="<%=request.getContextPath()%>/00administrator/ownerPage.jsp">
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
	
		<table>
			<thead>
				<tr>
					<th>이름</th>
					<th>아이디</th>
					<th>이메일</th>
					<th>전화번호</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="users" items="${memberList}">
					<tr>
						<td>${users.user_name }</td>
						<td>${users.user_id }</td>
						<td>${users.email }</td>
						<td>${users.phone }</td>
					</tr>
				</c:forEach>
			</tbody>

		</table>
	</div>
</body>
</html>