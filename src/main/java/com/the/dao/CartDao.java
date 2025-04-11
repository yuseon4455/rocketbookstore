package com.the.dao;

import java.sql.ResultSet;
import java.util.ArrayList;

import com.the.dto.BooksDto;
import com.the.dto.CartDto;
import com.the.util.DBConn;

public class CartDao {
	
	
	public void insert(CartDto dto) {
	       // 이미 장바구니에 해당 책이 있는지 확인
	       String checkSql = "SELECT amount FROM cart WHERE user_id = '" + dto.getUser_id() + "' AND book_id = " + dto.getBook_id();
	       ResultSet rs = DBConn.statementQuery(checkSql);

	       try {
	           if (rs.next()) {
	               // 장바구니에 책이 있으면 amount를 증가
	               int currentAmount = rs.getInt("amount");
	               int newAmount = currentAmount + 1;
	               String updateSql = String.format(
	                   "UPDATE cart SET amount = %d WHERE user_id = '%s' AND book_id = %d", 
	                   newAmount, dto.getUser_id(), dto.getBook_id());
	               DBConn.statementUpdate(updateSql);
	           } else {
	               // 장바구니에 책이 없으면 새로 추가
	               String insertSql = String.format(
	                   "INSERT INTO cart (user_id, book_id, amount) VALUES ('%s', %d, 1)", 
	                   dto.getUser_id(), dto.getBook_id());
	               DBConn.statementUpdate(insertSql);
	           }
	       } catch (Exception e) {
	           e.printStackTrace();
	       }
	   }
	
	public ArrayList<CartDto> selectAll(String user_id){
		ArrayList<CartDto> dtos=new ArrayList<CartDto>();
		String sql ="select * from cart";
		ResultSet rs=DBConn.statementQuery(sql);
		try {
			while(rs.next()) {
				dtos.add(new CartDto(
						rs.getLong("cart_id"),
						rs.getString("user_id"),
						rs.getLong("book_id"),
						rs.getLong("amount")
						));
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return dtos;
	}
	
	public ArrayList<Long> selectBookIdsInCart(String user_id) {
	    ArrayList<Long> bookIds = new ArrayList<>();
	    String sql = "SELECT book_id FROM cart WHERE user_id = '" + user_id + "'";
	    ResultSet rs = DBConn.statementQuery(sql);

	    try {
	        while (rs.next()) {
	            bookIds.add(rs.getLong("book_id"));
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }

	    return bookIds;
	}

		
}
