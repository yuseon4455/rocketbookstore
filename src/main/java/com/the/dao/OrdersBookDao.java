package com.the.dao;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.the.dto.OrdersBookDto;
import com.the.dto.UsersDto;
import com.the.util.DBConn;

public class OrdersBookDao {
   public ArrayList<OrdersBookDto> select(){
      ArrayList<OrdersBookDto> dtos = new ArrayList<>();
      String sql = "select id, books.book_id,title, amount, price from orders, books"
            + " where orders.book_id = books.book_id";
      ResultSet rs = DBConn.statementQuery(sql);
      
      try {
         while(rs.next())
         {
            dtos.add(new OrdersBookDto(
                  rs.getLong("id"),
                  rs.getLong("book_id"),
                  rs.getString("title"),
                  rs.getLong("amount"),
                  rs.getLong("price")));
         }
      } catch(Exception e) {
         e.printStackTrace();
      }
      
      return dtos;
   }
   
   public void update(Long amount, Long id) {
      String sql = String.format(
             "UPDATE orders SET amount = %d WHERE id = %d", amount, id
         );

      DBConn.statementUpdate(sql);
   }
   
   public boolean delete(List<Long> deleteId) {
      try {
         
         for(Long id : deleteId){
            String sql = "delete from orders where id = " + id;
            int result = DBConn.statementUpdate(sql);
            
            if(result <= 0) 
               // result가 1 이상이면 삭제 성공
            {
               return false;
            }
         }
         
         return true;
      } catch (Exception e) {
         e.printStackTrace();
         return false;
      }
   }
   
   public void insert(long book_id) {
       // 해당 book_id가 orders 테이블에 존재하는지 확인
       String checkSql = "SELECT id, amount FROM orders WHERE book_id = " + book_id;
       ResultSet rs = DBConn.statementQuery(checkSql);

       try {
           if (rs.next()) {
               // 이미 존재하는 경우: amount 증가
               long id = rs.getLong("id");
               long currentAmount = rs.getLong("amount");
               long newAmount = currentAmount + 1;

               String updateSql = String.format("UPDATE orders SET amount = %d WHERE id = %d", newAmount, id);
               DBConn.statementUpdate(updateSql);
           } else {
               // 존재하지 않는 경우: 새로운 레코드 추가
               String selectSql = "SELECT title, price FROM books WHERE book_id = " + book_id;
               ResultSet rs2 = DBConn.statementQuery(selectSql);

               if (rs2.next()) {
                   String title = rs2.getString("title");
                   long price = rs2.getLong("price");

                   String insertSql = String.format(
                       "INSERT INTO orders (book_id, title, amount, price) VALUES (%d, '%s', 1, %d)",
                       book_id, title, price
                   );
                   DBConn.statementUpdate(insertSql);
               }

               if (rs2 != null) rs2.close();
           }
       } catch (Exception e) {
           e.printStackTrace();
       } finally {
           try {
               if (rs != null) rs.close();
           } catch (Exception e) {
               e.printStackTrace();
           }
       }
   }
   
   public ArrayList<OrdersBookDto> selectAll2(String user_id){
	      ArrayList<OrdersBookDto> dtos = new ArrayList<>();
	      String sql = String.format("select id, books.book_id,title, amount, price from orders, books"
		            + " where orders.book_id = books.book_id and orders.user_id='%s'", user_id);
	      ResultSet rs = DBConn.statementQuery(sql);     
	      try {
	         while(rs.next())
	         {
	            dtos.add(new OrdersBookDto(
	                  rs.getLong("id"),
	                  rs.getLong("book_id"),
	                  rs.getString("title"),
	                  rs.getLong("amount"),
	                  rs.getLong("price")));
	         }
	      } catch(Exception e) {
	         e.printStackTrace();
	      }
	      
	      return dtos;
	   }
   		
   
   public OrdersBookDto orderIdList(long id) {
	   OrdersBookDto dtos=null;
	   String sql = String.format("select id, books.book_id,title, amount, price from orders, books"
		            + " where orders.book_id = books.book_id and id=%d", id);
	   ResultSet rs = DBConn.statementQuery(sql);
	   
	   try {
	        if (rs != null && rs.next()) {
	            // 해당 아이디 dtos에 담기
	            dtos = new OrdersBookDto(
	                rs.getLong("id"),
	                rs.getLong("book_id"),
	                rs.getString("title"),
	                rs.getLong("amount"),
	                rs.getLong("price")
	            );
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    
	    // 로그인 성공 시 사용자 정보 반환, 실패 시 null 반환
	    return dtos;
   }
}
