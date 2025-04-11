<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.the.dao.StockLogsDao" %>
<%@ page import="com.the.dto.StockLogsDto" %>

<%
    request.setCharacterEncoding("UTF-8");
    String bookIdStr = request.getParameter("book_id");
    String inStockStr = request.getParameter("in_stock");
    
    System.out.println("book_id: " + bookIdStr);
    System.out.println("in_stock: " + inStockStr);
    

    if (bookIdStr != null && inStockStr != null) {
        try {
            long book_id = Long.parseLong(bookIdStr);
            long in_stock = Long.parseLong(inStockStr);
            
            // 입고 수량 검증: 0 이하 또는 문자가 아닌 값 입력 방지
            if (in_stock <= 0) {
                throw new IllegalArgumentException("입고량은 0보다 커야 합니다.");
            }
            long order_id = 0L;
            long amount = 0L;
            long stock = in_stock;  
            // 출고량 0, change_stock 초기값은 입고 수량
             StockLogsDto dto = new StockLogsDto(0L, book_id, in_stock, 0L, in_stock);
            
            // DAO의 insert 메서드에서 책이 존재하지 않으면 Exception이 발생함
            StockLogsDao.insert(dto);
            
            out.println("<script>alert('입고 처리가 완료되었습니다.'); location.href='stockLogsSelect.jsp';</script>");
        } catch (NumberFormatException e) {
            out.println("<script>alert('입고량은 숫자여야 합니다.'); location.href='stockLogsInsert.jsp';</script>");
        } catch (IllegalArgumentException e) {
            out.println("<script>alert('" + e.getMessage() + "'); location.href='stockLogsInsert.jsp';</script>");
        } catch (Exception e) {
            out.println("<script>alert('오류가 발생했습니다: " + e.getMessage() + "'); location.href='stockLogsInsert.jsp';</script>");
            e.printStackTrace();
        }
    } else {
        out.println("<script>alert('모든 값을 입력하세요'); location.href='stockLogsInsert.jsp';</script>");
    }
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>입고 처리</title>
</head>
<body>

</body>
</html>
