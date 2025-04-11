<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.util.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="com.the.dao.*" %>
<%@page import="com.the.dto.*" %>
<%@page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	String user_id = (String) session.getAttribute("user_id");
	
	ArrayList<ShipDto> shipDto = ShipDao.selectAll2(user_id);	//해당 아이디의 테이블
	session.setAttribute("shiplist", shipDto);				//테이블 전송
	//아이디가 있는지 없는지 확인은 로그인페이지에서 함 여기는 로그인을 해야 접속할 수 있음
	for (ShipDto item : shipDto) {							//이거는 해당 id select문 출력임
		System.out.println(item);
	}
%>
<h1>배송지선택</h1>
<form action="option_itemInsert.jsp" method="get">
 	<select name="ship_id">
 	<c:forEach var="ship" items="${shiplist }"> 
 		<option value=${ship.ship_id }>${ship.address }</option>
 	</c:forEach>
 	</select>
 	<input type="submit" value="선택">
</form>
<a href="../main.jsp">홈으로</a>
</body>
</html>