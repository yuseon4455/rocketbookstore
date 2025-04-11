<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.the.dao.*" %>
<%@ page import="com.the.dto.*" %>
<%@ page import="java.util.*" %>
<%@ page import="com.the.util.DBConn"%>
<%@ page import="java.sql.ResultSet" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
    Long totalPrice = 4000L; // 기본배송비 설정
    String[] Ids = request.getParameterValues("cart_id[]");
    request.setAttribute("totalPrice", totalPrice);
    if (Ids != null) { // 체크박스가 선택되었을 때만 실행
        for (String cart_id : Ids) {
            try {
                int cartIdInt = Integer.parseInt(cart_id); // 숫자로 변환 (안전성 확보)
                String sql = "select amount, price FROM cart, books" +
                " where cart.book_id = books.book_id and cart_id = " + cartIdInt;
                ResultSet rs = DBConn.statementQuery(sql);

                if (rs.next()) {
                	// 결과가 있을 경우에만 처리
                	Long amount = rs.getLong("amount");
                	Long price = rs.getLong("price");
                    totalPrice = totalPrice+(amount * price);
                }

                if (rs != null) {
                    rs.close();
                }
            } catch (NumberFormatException e) {
                e.printStackTrace();
            }
        }
    }

    // 총 가격을 세션에 저장
    session.setAttribute("totalPrice", totalPrice);

    // 가격 계산 후 cartList.jsp로 이동
    response.sendRedirect("/00BookJSP/04cart/cartList.jsp");
%>
</body>
</html>