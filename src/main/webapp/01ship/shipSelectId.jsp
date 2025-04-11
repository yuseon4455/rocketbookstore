<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="com.the.dao.*" %>
<%@page import="com.the.dto.*" %>
<%@page import="java.util.*" %>
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
    </style>
</head>
<body>
<%
	UsersDto loggedInUser = (UsersDto) session.getAttribute("loggedInUser");
	String user_id = loggedInUser.getUser_id();
	
	
	if(user_id==null || user_id.isEmpty()){
		response.sendRedirect("login.jsp");
	}else{
		ArrayList<ShipDto> shipDto = ShipDao.selectAll2(user_id);	//해당 아이디의 테이블
		session.setAttribute("shiplist", shipDto);				//테이블 전송
		//아이디가 있는지 없는지 확인은 로그인페이지에서 함 여기는 로그인을 해야 접속할 수 있음
		for (ShipDto item : shipDto) {							//이거는 해당 id select문 출력임
			System.out.println(item);
		}
	}
	
	//주소록

	
%>
<table>
	<thead>
		<tr>
			<th>목록</th><th>주소</th>
		</tr>
	</thead>
	<tbody>
	<c:forEach var="ship" items="${sessionScope.shiplist }" varStatus="status">
		<tr>
			<td>${status.index + 1}</td><td>${ship.address }</td>
		</tr>
	</c:forEach>
	</tbody>
</table>
<a href = "../main.jsp">홈으로 이동</a><br>
<a href = "shiplist.jsp">새주소 등록</a>
</body>
</html>