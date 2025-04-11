<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.the.dto.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%

   com.the.dao.BooksDao dao= new com.the.dao.BooksDao();
   ArrayList<BooksDto> dtos=dao.selectAll();
   request.setAttribute("booksList", dtos);
   
   for(BooksDto dto:dtos){
      System.out.println(dto);
   }
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
        table {
            width: 100%;
            border-collapse: collapse;
        }
        th, td {
            border: 1px solid black;
            padding: 8px;
            text-align: left;
        }
        th {
            background-color: #f2f2f2;
        }
        img {
            width: 100px; /* 이미지 크기 조정 */
            height: auto;
        }
</style>
</head>
<body>
<a href="/00BookJSP/userMain.jsp">main</a>
<table>
   <thead>
      <tr>
         <th>book_id</th><th>title</th><th>author</th><th>price</th>
         <th>stock</th><th>detail</th><th>image</th><th></th>
      </tr>
   </thead>
   <tbody>
    <c:forEach var="books" items="${booksList}">
        <tr>
            <td>${books.book_id}</td>
            <td>${books.title}</td>
            <td>${books.author}</td>
            <td>${books.price}</td>
            <td>${books.stock}</td>
            <td>${books.detail}</td>
            <td>
                <img src="${not empty books.image ? books.image : '/images/default.png'}" alt="Book Image">
            </td>
            <td>
               <!-- 찜 버튼: wishlist.jsp로 넘어가는 폼 -->
                <form action="/00BookJSP/08wishlist/wishlistDB.jsp" method="get">
                    <input type="hidden" name="book_id" value="${books.book_id}">
                    <input type="hidden" name="title" value="${books.title}">
                    <button type="submit">찜</button>
                </form>
                <!-- 장바구니 추가 버튼: orderList.jsp로 넘어가는 폼 -->
                <form action="/00BookJSP/04cart/insertDB.jsp" method="get">
                    <input type="hidden" name="book_id" value="${books.book_id}">
                    <button type="submit">장바구니 추가</button>
                </form>
            </td>
        </tr>
    </c:forEach>
</tbody>

</table>
</body>
</html>
