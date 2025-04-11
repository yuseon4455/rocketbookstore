<%@page import="com.the.dto.CategoriesDto"%>
<%@page import="com.the.dao.CategoriesDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 카테고리 추가 DB처리 jsp -->
 <%
 	String newCategory = request.getParameter("newCategory");

 	if(newCategory!=null && !newCategory.isEmpty()){
 		CategoriesDao dao = new CategoriesDao();
 		CategoriesDto dto = new CategoriesDto();
 		dto.setName(newCategory);
 		
 		try {
 			dao.addCategory(dto);
 		
 			// categories 테이블에 추가 된 후 insert.jsp로 리다이렉트
 			response.sendRedirect("/00BookJSP/02books/insert.jsp"); 
 		
 			
 		} catch(Exception e) {
 			out.println("카테고리 추가 실패");
 			e.printStackTrace();
 		}
 	}
 
 %>
</body>
</html>