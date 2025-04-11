package com.the.dao;

//import java.sql.*;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import com.the.dto.StockLogsDto;
import com.the.util.DBConn;
// import com.the.util.UserInput;

public class StockLogsDao {

	// 첫 번째
	public static ArrayList<StockLogsDto> selectAllLogs() throws Exception {
	    ArrayList<StockLogsDto> dtos = new ArrayList<>();
	    Statement stmt = null;
	    ResultSet rs = null;

	    try {
	        stmt = DBConn.getInstance().createStatement();
	        
	        String sql = 
	            "WITH union_logs AS (SELECT sl.log_id, sl.book_id, b.title, sl.in_stock, CAST(NULL AS VARCHAR2(50)) AS order_id, 0 AS amount"
	            +" FROM stock_logs sl JOIN books b ON sl.book_id = b.book_id"
	            +" UNION ALL SELECT ROW_NUMBER() OVER (ORDER BY od.detail_id) + (SELECT NVL(MAX(log_id), 0) FROM stock_logs) AS log_id,"
	            +" od.book_id, b.title, 0 AS in_stock, od.order_id, -od.amount AS amount FROM orders_detail od"
	            +" JOIN books b ON od.book_id = b.book_id)"
	            +" SELECT log_id, book_id, title, in_stock, order_id, amount,"
	            +" SUM(in_stock + amount) OVER (PARTITION BY book_id ORDER BY log_id"
	            +" ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS stock"
	            +" FROM union_logs ORDER BY log_id DESC";  // 내림차순 정렬

	        rs = stmt.executeQuery(sql);

	        while (rs.next()) {
	            long logId = rs.getLong("log_id");
	            long bookId = rs.getLong("book_id");
	            String title = rs.getString("title");
	            long inStock = rs.getLong("in_stock");
	            String orderId = rs.getString("order_id");
	            long amount = rs.getLong("amount");
	            long stock = rs.getLong("stock");

	            dtos.add(new StockLogsDto(logId, bookId, title, inStock, orderId, amount, stock));
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	        throw new Exception("재고 로그 조회 중 오류가 발생했습니다.");
	    } finally {
	        try {
	            if (rs != null) rs.close();
	            if (stmt != null) stmt.close();
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	    }

	    return dtos;
	}
	
   
   // 주문번호를 가져오는 메소드
	public static String getOrderIdByBookId(long bookId) {
	    // orders_detail 테이블에서 최신 주문(order_id)을 가져옴
	    String sql = String.format(
	          "SELECT order_id FROM orders_detail WHERE book_id = %d ORDER BY detail_id DESC FETCH FIRST 1 ROWS ONLY",
	          bookId);
	    
	    Statement stmt = null;
	    ResultSet rs = null;
	    try {
	        stmt = DBConn.getInstance().createStatement();
	        rs = stmt.executeQuery(sql);
	        
	        if (rs.next()) {
	            return rs.getString("order_id");
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    } finally {
	        try {
	            if (rs != null)
	                rs.close();
	            if (stmt != null)
	                stmt.close();
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	    }
	    return null;
	}

    //입고 처리: 관리자가 입고량 입력하면 stock_logs에 데이터 추가, books 테이블의 stock 업데이트
    //입고 시 stock은 기존 책 재고 + 입고 수량으로 업데이트 됨
	public static void insert(StockLogsDto dto) throws Exception {
	    // 책 존재 여부 확인
		System.out.println(dto);
		String checkSql = String.format("SELECT book_id FROM books WHERE book_id = %d", dto.getBook_id());
		
	    ResultSet rs = DBConn.statementQuery(checkSql);
	    if (!rs.next()) {
	        throw new Exception("입력한 book_id가 존재하지 않습니다.");
	    }
		
		// 입고 처리
	    String insertSql = String.format(
	          "INSERT INTO stock_logs(book_id, in_stock) VALUES (%d, %d)", 
	          dto.getBook_id(), dto.getIn_stock());

	    // books 테이블의 stock 업데이트 (입고 수량만 반영)
	    String updateSql = String.format(
	          "UPDATE books SET stock = stock + %d WHERE book_id = %d", 
	          dto.getIn_stock(), dto.getBook_id());

	    DBConn.statementUpdate(insertSql);
	    DBConn.statementUpdate(updateSql);
		
		
	}
	


   // 출고 처리(주문에 의한 출고/ update 메서드는 주문이 들어올 때 자동 호출)

   
   // 최신 재고 로그 조회 (특정 북ID)
   public static StockLogsDto getStockByBookId(long bookId) {
      String query = "SELECT * FROM stock_logs WHERE book_id = " + bookId
    		  
            + " ORDER BY log_id DESC FETCH FIRST 1 ROWS ONLY";
      ResultSet rs = DBConn.statementQuery(query);
      try {
         if (rs.next()) {
            return new StockLogsDto(rs.getLong("log_id"), rs.getLong("book_id"), rs.getLong("in_stock"),
                  rs.getLong("amount"));
         }
      } catch (Exception e) {
         e.printStackTrace();
      }
      return null;
   }

   // 주문 가능 여부 (현재 재고가 주문량 이상이면 가능)
   public static boolean canBuy(long book_id, long amount) {
      String sql = String.format("SELECT change_stock FROM stock_logs " + "WHERE book_id = %d "
            + "ORDER BY log_id DESC FETCH FIRST 1 ROWS ONLY", book_id);
      ResultSet rs = DBConn.statementQuery(sql);
      try {
         if (rs.next()) {
            long stock = rs.getLong("change_stock");
            return stock >= amount;
         }
      } catch (Exception e) {
         e.printStackTrace();
      }
      return false;
   }

  
   
//    public static void orderBuy(long book_id, long amount) {
//       if(canBuy(book_id, amount)) {
//          update(book_id, amount);
//          
//          String updateBookStockSql = String.format(
//                "update books set stock = stock - %d where book_id = %d",
//                amount, book_id
//         );
//         DBConn.statementUpdate(updateBookStockSql);
//         
//         System.out.println("주문이 완료되었습니다.");
//       }else {
//          System.out.println("주문 가능 수량을 초과했습니다.");
//       }
//    }

}
