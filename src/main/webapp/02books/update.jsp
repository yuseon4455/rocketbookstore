<%@page import="com.the.dao.CategoriesDao"%>
<%@page import="com.the.dto.CategoriesDto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.the.dto.BooksDto"%>
<%@page import="com.the.dao.BooksDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	request.setCharacterEncoding("UTF-8");
	String bookIdParam = request.getParameter("book_id");
	Long book_id = Long.parseLong(bookIdParam);
	
	//book_id가 null인 경우 처리
	if (bookIdParam == null || bookIdParam.isEmpty()) {
		out.println("book_id가 없습니다.");
	} else {

		// 데이터베이스에서 책 정보를 가져오기
		BooksDao dao = new BooksDao(); // BookDao 객체생성
		CategoriesDao categoriesDao = new CategoriesDao(); // 카테고리 객체 생성
		
		// book_id를 매개변수로 책 정보 가져오기.
		BooksDto dto = dao.getBookById(book_id);

		// dto가 null일 경우 예외 처리
		if (dto == null) {
			out.println("해당 책 정보를 찾을 수 없습니다.");
		} else {
			String title = dto.getTitle();
			String author = dto.getAuthor();
			Long price = dto.getPrice();
			String detail = dto.getDetail();
			Long stock = dto.getStock();
			Long currentCategoryId = dto.getCategory_id(); 
			
 			// 카테고리 정보 가져오기
            ArrayList<CategoriesDto> categories = categoriesDao.selectAll();
            request.setAttribute("categories", categories); 
	%>
	<a href="/00BookJSP/02books/adminSelect.jsp">메인 페이지</a>
	<form action="updateDB.jsp" method="post">
		<!-- book updateDB로 -->
		책 ID: <%=book_id%><br> 
		<input type="hidden" name = "book_id" value="<%= book_id %>">
		제목: <input type="text" name="title" value="<%= title != null ? title : "" %>"><br> 
        저자: <input type="text" name="author" value="<%= author != null ? author : "" %>"><br> 
        가격: <input type="text" name="price" value="<%= price != null ? price : "" %>"><br> 
			재고: <%=stock %><br>
			카테고리 : 
			<select name="category_id">
            <%
            // 카테고리 목록을 출력하면서 현재 책의 카테고리 ID가 선택된 상태로 표시.
            for (CategoriesDto category : categories) {
                // 현재 책의 카테고리 ID와 일치하는 카테고리명을 기본으로 선택하도록 함
                String selected = (category.getCategory_id().equals(currentCategoryId)) ? "selected" : "";
            %>
                <option value="<%=category.getCategory_id()%>" <%=selected%>>
                    <%=category.getName()%>
                </option>
            <%
            }
            %>
        </select> <br>
        
			설명: <input type="text" name="detail" value="<%= detail != null ? detail : "" %>"><br> 
			<input type="submit" value="전송"> 
	</form>


	<%
		} // dto != null
	}
	%>

</body>
</body>
</html>