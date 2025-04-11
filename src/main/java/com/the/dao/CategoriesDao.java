package com.the.dao;

import java.sql.ResultSet;
import java.util.ArrayList;

import com.the.dto.CategoriesDto;
import com.the.util.DBConn;

public class CategoriesDao {
	
	public ArrayList<CategoriesDto> selectAll(){
		ArrayList<CategoriesDto> dtos=new ArrayList<CategoriesDto>();
		String sql ="select * from categories";
		ResultSet rs=DBConn.statementQuery(sql);
		try {
			while(rs.next()) {
				dtos.add(new CategoriesDto(
						rs.getLong("category_id"),
						rs.getString("name")
						));
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return dtos;
	}
	
	public void addCategory(CategoriesDto dto) {
		String sql = String.format("Insert Into categories (name) values ('%s')", dto.getName());
		
		DBConn.statementUpdate(sql);
	}

}




