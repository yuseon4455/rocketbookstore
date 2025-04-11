<%@page import="java.util.ArrayList"%>
<%@page import="com.the.dto.CategoriesDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		// 카테고리 목록을 가져오는 코드
		com.the.dao.CategoriesDao categoriesDao = new com.the.dao.CategoriesDao();
		ArrayList<CategoriesDto> categories = categoriesDao.selectAll();
		
		request.setAttribute("categories", categories);
	%>
	<a href="/00BookJSP/02books/adminSelect.jsp">도서 관리 페이지</a><br>
	<form action="/00BookJSP/02books/insertDB.jsp">
		제목: <input type="text" name="title" required><br>
		저자: <input type="text" name="author" required><br> 
		가격: <input type="text" name="price" required><br> 
		재고: <input type="text" name="stock" required><br> 
		카테고리 : 
		<select id="category_id" name="category_id" onchange="showCategoryDetails()">
			<%-- 카테고리 목록을 출력 --%>
			<option value="" disabled selected>--카테고리 선택--</option> 
			<c:forEach var="category" items="${categories}">
				<option value="${category.category_id}">${category.name}</option>
			</c:forEach>
		</select>
		<br> 
		설명: <input type="text" name="detail"><br> 
		<input type="submit" value="전송">
	</form>
	<form action="/00BookJSP/03categories/addCategory.jsp">
           새 카테고리: <input type="text" name="newCategory"><br>
        <input type="submit" value="새 카테고리 추가">
    </form>
</body>
</html>