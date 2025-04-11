<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.the.dao.*" %>
<%@page import="com.the.dto.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
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
        a{
           color:inherit; text-decoration:none;
        }
    </style>
</head>
<body>
<%
    String history_id = request.getParameter("history_id");

    // history_id로 state 가져오기
    HistoryDto hdto = HistoryDao.select(history_id);
    int ship_state = hdto.getShip_state();

    String imagePath = "";
    String statusMessage = "상품 접수 완료";

    switch (ship_state) {
       case 1:
             imagePath = "1.png";
           statusMessage = "상품준비중";
           break;
        case 2:
           imagePath = "2.png";
            statusMessage = "배송준비중";
            break;
        case 3:
           imagePath = "3.png";
            statusMessage = "배송중";
            break;
        case 4:
           imagePath = "4.png";
            statusMessage = "배송완료";
            break;
        default:
            imagePath = "delivery.png";
            statusMessage = "잘못된입력";
            break;
    }
    
    String errorMessage = request.getParameter("errorMessage");
%>

<h1>배송정보</h1>
<img src="<%= imagePath %>" alt="배송 상태 이미지" style="width:460px; height:140px;">
<table>
   <tr>
      <th>배송상태</th>
   </tr>
   <tr>
      <td>
      <form action="historyUpdate.jsp" method="get">
         <input type="hidden" name="history_id" value="<%=history_id %>">
         <input type="text" name="ship_state" value="<%= statusMessage %>">
            <button type="submit">수정</button>
         </form>
      </td>
   </tr>      
</table>
<p style="color:rgb(95, 95, 95); font-size:12px;">※1=상품준비중 2=배송준비중 3=배송중 4=배송완료</p>
</body>
</html>