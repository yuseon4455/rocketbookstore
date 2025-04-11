<%@page import="com.the.dto.BooksDto"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 도서 페이지</title>
<link rel="stylesheet" href="../00css/base.css">
<link rel="stylesheet" href="../00css/owner.css">
<link rel="shortcut icon" href="../00img/ico_favicon.ico"
	type="image/x-icon">
<style>

.plus{
	margin-left: 77%;
	margin-top: 20px;
	
}

table {
	width: 60%;
	border-collapse: collapse;
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

.pagination {
	margin-top: 20px;
	text-align: center;
	margin: 60px;
}

.pagination a {
	display: inline-block;
	padding: 8px 12px;
	margin: 0 5px;
	border: 1px solid #ccc;
	text-decoration: none;
	color: #333;
	border-radius: 5px;
}

.pagination a.active {
	background-color: #137CF3;
	color: white;
	font-weight: bold;
}
.menu li:nth-child(4) a{
    color: black;
    text-decoration: underline;
}
</style>
<script> 
function confirmDelete(bookId) {
    var result = confirm("book_id " + bookId + " 번 책을 삭제하시겠습니까?");
    if (result) {
        window.location.href = "deleteDB.jsp?book_id=" + bookId;
    } else {
        return false;
    }
}
</script>
</head>
<body>
	<%
    response.setCharacterEncoding("UTF-8");
    request.setCharacterEncoding("UTF-8");

    com.the.dao.BooksDao dao = new com.the.dao.BooksDao();
    ArrayList<BooksDto> dtos = dao.adminSelectAll();

    // 페이지네이션 처리
    String pageParam = request.getParameter("page");
    int currentPage = (pageParam != null) ? Integer.parseInt(pageParam) : 1;
    int itemsPerPage = 10;

    int totalBooks = dtos.size();
    int totalPages = (int) Math.ceil((double) totalBooks / itemsPerPage);

    int startIndex = (currentPage - 1) * itemsPerPage;
    int endIndex = Math.min(startIndex + itemsPerPage, totalBooks);

    ArrayList<BooksDto> pagedBooks = new ArrayList<>(dtos.subList(startIndex, endIndex));

    request.setAttribute("booksList", pagedBooks);
    request.setAttribute("currentPage", currentPage);
    request.setAttribute("totalPages", totalPages);
%>
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
	
		<form action="insert.jsp" method="post" class="plus">
			<input type="submit" value="도서 추가">
		</form>

		<table>
			<thead>
				<tr>
					<th>도서 ID</th>
					<th>제목</th>
					<th>저자</th>
					<th>카테고리 Id</th>
					<th>카테고리 이름</th>
					<th>가격</th>
					<th>재고</th>
					<th>설명</th>
					<th>이미지</th>
					<th>관리</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="books" items="${booksList}">
					<tr>
						<td>${books.book_id}</td>
						<td>${books.title}</td>
						<td>${books.author}</td>
						<td>${books.category_id}</td>
						<td>${books.name}</td>
						<td>${books.price}</td>
						<td>${books.stock}</td>
						<td>${books.detail}</td>
						<td><img
							src="${pageContext.request.contextPath}${books.image}"
							alt="${books.title}" width="100"></td>
						<td class="button-container">
							<form action="update.jsp" method="get" style="display: inline;">
								<input type="hidden" name="book_id" value="${books.book_id}">
								<button type="submit" class="button">수정</button>
							</form>
							<button type="button" class="button"
								onclick="confirmDelete(${books.book_id})">삭제</button>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<div class="pagination">
			<c:if test="${currentPage > 1}">
				<a href="adminBooks.jsp?page=${currentPage - 1}">이전</a>
			</c:if>

			<c:forEach begin="1" end="${totalPages}" var="pageNum">
				<a href="adminBooks.jsp?page=${pageNum}"
					class="${currentPage == pageNum ? 'active' : ''}">${pageNum}</a>
			</c:forEach>

			<c:if test="${currentPage < totalPages}">
				<a href="adminBooks.jsp?page=${currentPage + 1}">다음</a>
			</c:if>
		</div>
	</div>
</body>
</html>
