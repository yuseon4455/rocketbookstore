<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ page import="com.the.dto.*"%>
<%
   response.setCharacterEncoding("UTF-8");  // 응답의 인코딩을 UTF-8로 설정
   request.setCharacterEncoding("UTF-8");   // 요청의 인코딩을 UTF-8로 설정

   BooksDto dto = new BooksDto();
   //폼에서 받은 데이터 처리
   String updateTitle = request.getParameter("title");
   String updateAuthor = request.getParameter("author");
   String priceParam = request.getParameter("price");
   String categoryIdParam = request.getParameter("category_id");
   String detailParam = request.getParameter("detail");
   String updateImage = request.getParameter("image");
   String bookIdParam = request.getParameter("book_id");
   
   Long updatePrice = null;
   Long updateCateId = null;
   Long updateBookid = null;
   
    // 책 ID는 필수이므로 바로 처리
    if (bookIdParam != null && !bookIdParam.isEmpty()) {
        updateBookid = Long.parseLong(bookIdParam);
    }

    // 수정된 가격 값이 있을 경우만 업데이트
    if (priceParam != null && !priceParam.isEmpty()) {
        updatePrice = Long.parseLong(priceParam);
    }

    // 수정된 카테고리 값이 있을 경우만 업데이트
    if (categoryIdParam != null && !categoryIdParam.isEmpty()) {
        updateCateId = Long.parseLong(categoryIdParam);
    }

    // 수정된 제목 값이 있을 경우만 업데이트
    if (updateTitle == null || updateTitle.isEmpty()) {
        updateTitle = dto.getTitle(); // 수정하지 않으면 기존 값 사용
    }

    // 수정된 저자 값이 있을 경우만 업데이트
    if (updateAuthor == null || updateAuthor.isEmpty()) {
        updateAuthor = dto.getAuthor(); // 수정하지 않으면 기존 값 사용
    }

    // 수정된 상세 설명 값이 있을 경우만 업데이트
    String updateDetail = detailParam != null && !detailParam.isEmpty() ? detailParam : dto.getDetail(); // 수정하지 않으면 기존 값 사용

    // BooksDao 객체 생성 후, update 메서드 호출
    com.the.dao.BooksDao dao = new com.the.dao.BooksDao();
    dao.update(updateTitle, updateAuthor, updatePrice, updateCateId, updateDetail, updateImage,updateBookid);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
    데이터 수정완료<br>
   <a href="/00BookJSP/00administrator/ownerPage.jsp">ownerPage.jsp</a><br>
   <a href="adminSelect.jsp">관리자 도서 페이지</a>
</body>
</html>