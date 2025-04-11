<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@page import="com.the.dao.*"%>
<%@page import="com.the.dto.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.delivery_process {
   display: flex;
   justify-content: center;
   gap: 25px;
   margin: 40px 20px 20px 20px;
}

.delivery_process div p {
   text-align: center;
   margin-top: 5px;
}

.delivery_process div img {
   width: 150px;
   height: auto;
}

.delivery_process div img:not(:last-child)::after {
   content: "";
   display: inline-block;
   width: 20px; /* 구분 이미지 크기 */
   height: 20px; /* 구분 이미지 크기 */
   background-image: url('/00BookJSP/00img/delivery/new_moon.png');
   /* 구분선 이미지 */
   background-size: contain;
   background-repeat: no-repeat;
   margin: 0 10px; /* 이미지 간격 조정 */
}
.state {
   width: 50%;
   border-collapse: collapse;
   margin: 20px auto 40px;
}

.state th, .state td {
   border: 1px solid #ccc;
   padding: 8px;
   text-align: center;
}

.state th {
   background-color: #f2f2f2;
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
         imagePath = "/00BookJSP/00img/package-box_on.png";
         statusMessage = "상품 접수 완료";
         break;
        case 2:
         imagePath = "/00BookJSP/00img/package_on.png";
         statusMessage = "배송 준비 중";
         break;
        case 3:
         imagePath = "/00BookJSP/00img/fast-delivery_on.png";
            statusMessage = "배송 중";
            break;
        case 4:
         imagePath = "/00BookJSP/00img/delivered_on.png";
            statusMessage = "배송 완료";
            break;
        default:
           imagePath = "/00BookJSP/00img/package-box_on.png";
            statusMessage = "상품 접수 완료";
            break;
 }
    
    String errorMessage = request.getParameter("errorMessage");
%>

   <h1 style="text-align:center;">배송정보</h1>
   <div class="delivery_process">
      <div>
         <img
            src="/00BookJSP/00img/delivery/package-box<%= ship_state == 1 ? "_on" : "" %>.png">
         <p>상품준비중
         <p>
      </div>
      <div>
         <img
            src="/00BookJSP/00img/delivery/package<%= ship_state == 2 ? "_on" : "" %>.png">
         <p>배송준비중
         <p>
      </div>
      <div>
         <img
            src="/00BookJSP/00img/delivery/fast-delivery<%= ship_state == 3 ? "_on" : "" %>.png">
         <p>배송중</p>
      </div>
      <div>
         <img
            src="/00BookJSP/00img/delivery/delivered<%= ship_state == 4 ? "_on" : "" %>.png">
         <p>배송완료</p>
      </div>
   </div>
   <table class="state">
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
   <p style="color: rgb(95, 95, 95); font-size: 12px; text-align:center;">※1=상품준비중
      2=배송준비중 3=배송중 4=배송완료</p>
</body>
</html>