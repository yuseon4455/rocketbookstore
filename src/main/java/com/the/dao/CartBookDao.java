package com.the.dao;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.the.dto.CartBookDto;
import com.the.dto.UsersDto;
import com.the.util.DBConn;

public class CartBookDao {
   public ArrayList<CartBookDto> select(){
      ArrayList<CartBookDto> dtos = new ArrayList<>();
      String sql = "select cart_id, books.book_id,title, amount, price "
            + "from cart, books"
            + " where cart.book_id = books.book_id";
      ResultSet rs = DBConn.statementQuery(sql);
      
      try {
         while(rs.next())
         {
            dtos.add(new CartBookDto(
                  rs.getLong("cart_id"),
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
   
   public void update(Long amount, Long cart_id) {
      String sql = String.format(
             "UPDATE cart SET amount = %d WHERE cart_id = %d", 
             amount, cart_id
         );

      DBConn.statementUpdate(sql);
   }
   
   public boolean delete(List<Long> deleteId) {
      try {
         
    	  
         for(Long cart_id : deleteId){
            String sql = "delete from cart where cart_id = " + cart_id;
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
   
   
   public ArrayList<CartBookDto> selectAll2(String user_id){
         ArrayList<CartBookDto> dtos = new ArrayList<>();
         String sql = String.format("select cart_id, books.book_id, "
               + "title, amount, price from cart, books"
                  + " where cart.book_id = books.book_id and "
                  + "cart.user_id='%s'", user_id);
         ResultSet rs = DBConn.statementQuery(sql);     
         try {
            while(rs.next())
            {
                dtos.add(new CartBookDto(
                    rs.getLong("cart_id"),
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
         
   
   public CartBookDto cartIdList(long cart_id) {
      CartBookDto dtos=null;
      String sql = String.format("select cart_id, books.book_id,"
            + "title, amount, price from cart, books"
                  + " where cart.book_id = books.book_id and cart_id=%d", 
                  cart_id);
      ResultSet rs = DBConn.statementQuery(sql);
      
      try {
           if (rs != null && rs.next()) {
               // 해당 아이디 dtos에 담기
               dtos = new CartBookDto(
                   rs.getLong("cart_id"),
                   rs.getLong("book_id"),
                   rs.getString("title"),
                   rs.getLong("amount"),
                   rs.getLong("price"));
           }
       } catch (Exception e) {
           e.printStackTrace();
       }
       
       // 로그인 성공 시 사용자 정보 반환, 실패 시 null 반환
       return dtos;
   }
}
