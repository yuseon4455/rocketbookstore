package com.the.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.the.dto.CBDto;
import com.the.util.DBConn;

public class CBDao {

	public ArrayList<CBDto> selectBooksByCategoryId(Long categoryId) {
	       ArrayList<CBDto> dtos = new ArrayList<>();
	       String sql = "SELECT c.category_id, b.book_id, b.title, b.author, b.detail, b.image " // 📌 image 추가
	                  + "FROM categories c "
	                  + "INNER JOIN books b ON c.category_id = b.category_id "
	                  + "WHERE c.category_id = " + categoryId;
	       ResultSet rs = DBConn.statementQuery(sql);
	       try {
	           while (rs.next()) {
	               dtos.add(new CBDto(
	                       rs.getLong("category_id"),
	                       rs.getLong("book_id"),
	                       rs.getString("title"),
	                       rs.getString("author"),
	                       rs.getString("detail"),
	                       rs.getString("image")
	               ));
	           }
	       } catch (SQLException e) {
	           e.printStackTrace();
	       }
	       return dtos;
	   }
	
	
	public ArrayList<CBDto> selectAllBooks() {
	    ArrayList<CBDto> dtos = new ArrayList<>();
	    String sql = "SELECT c.category_id, b.book_id, b.title, b.author, b.detail, b.image "
	               + "FROM categories c "
	               + "INNER JOIN books b ON c.category_id = b.category_id";
	    ResultSet rs = DBConn.statementQuery(sql);
	    try {
	        while (rs.next()) {
	            dtos.add(new CBDto(
	                    rs.getLong("category_id"),
	                    rs.getLong("book_id"),
	                    rs.getString("title"),
	                    rs.getString("author"),
	                    rs.getString("detail"),
	                    rs.getString("image")
	            ));
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	    return dtos;
	}
}


