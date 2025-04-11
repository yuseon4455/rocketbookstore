<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@page import="com.the.dao.*"%>
<%@page import="com.the.dto.*"%>
<%@page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../00css/base.css">
<link rel="stylesheet" href="../00css/owner.css">
<link rel="shortcut icon" href="../00img/ico_favicon.ico" type="image/x-icon">
  <style>
        table {width: 60%;
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
        a{
           color:inherit; text-decoration:none;
        }
        .menu li:nth-child(5) a{
    color: black;
    text-decoration: underline;
}
    </style>
</head>
<body>
<%   
	// 전체 주문 리스트 가져오기
	ArrayList<OrdersReciptDto> reciptList = OrdersReciptDao.selectAll();

	// 중복 제거된 리스트
	ArrayList<OrdersReciptDto> filteredList = new ArrayList<>();
	String lastOrderId = ""; // 이전 주문번호

	for (OrdersReciptDto item : reciptList) {
       if (!item.getOrder_id().equals(lastOrderId)) { // 이전 주문번호와 다르면 추가
           filteredList.add(item);
           lastOrderId = item.getOrder_id(); // 현재 주문번호를 저장
       }
	}
	// 1. reciptList에서 첫번째 주문을 가져옴(ex order_id = "1")
	// 2. lastOrderId는 ""(빈문자열)이니까 order_id와 다름
	// 3. filterList에 첫번째 주문을 추가하고 lastOrderId를 "1"로 업데이트
	// 4. 두번째 주문, 세번째 주문 들어올 때 이전주문과 다르면 리스트에 추가, 같으면 패스
	
	request.setAttribute("reciptList", filteredList);
//	if (reciptList != null) {
//	   for(OrdersReciptDto item:reciptList){
//	      System.out.println(item);
//	   }
//	 } else {
//	       response.sendRedirect("cartList.jsp");
//	 }
	
//	request.setAttribute("reciptList", reciptList);
%>
<div id="wrap">
		<h1>
			<a href="<%=request.getContextPath()%>/00administrator/ownerPage.jsp">
				<img src="../00img/adimnLogo.png" alt="로켓서점">
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
         <th>목록</th><th>주문번호</th><th>사용자ID</th><th>주문날짜</th><th>책</th><th>수량</th>
         <th>운송장번호</th>
      </tr>
   </thead>
   <tbody>
      <c:forEach var="recipt" items="${reciptList }" varStatus="status">
      <tr>
         <td>${status.index+1 }</td>
         <td><a href="ownerOrdersDetail.jsp?order_id=${recipt.order_id}">${recipt.order_id }</a></td>
         <td>${recipt.user_id }</td>
         <td>${recipt.order_date }</td>
         <td>${recipt.title }</td>
         <td>${recipt.amount }</td>
         <td><a href="../06history/historyIdOwner.jsp?history_id=${recipt.history_id}">${recipt.history_id }</a></td>
      </tr>
      </c:forEach>
   </tbody>
</table>
</div>
</body>
</html>