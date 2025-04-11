<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.the.dto.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
    // 카테고리 목록 가져오기
    com.the.dao.CategoriesDao categorydao = new com.the.dao.CategoriesDao();
    ArrayList<CategoriesDto> categoryDtos = categorydao.selectAll();
    request.setAttribute("categoriesList", categoryDtos);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>카테고리 선택</title>
<style>
    .category-menu {
        display: flex;
        gap: 20px;
        justify-content: center;
        margin: 20px 0;
    }
    .category-menu a {
        text-decoration: none;
        font-weight: bold;
    }
    .category-menu a:hover {
    }
</style>
</head>
<body>
<div class="category-menu">
    <a href="<%= request.getContextPath() %>/03categories/categorylist.jsp">전체</a>
    <c:forEach var="categories" items="${categoriesList}">
        <a href="<%= request.getContextPath() %>/03categories/categorylist.jsp?category_id=${categories.category_id}">
            ${categories.name}
        </a>
    </c:forEach>
</div>

</body>
</html>
