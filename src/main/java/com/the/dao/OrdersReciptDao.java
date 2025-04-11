package com.the.dao;

import java.sql.ResultSet;
import java.util.ArrayList;

import com.the.dto.OrdersReciptDto;
import com.the.util.DBConn;

public class OrdersReciptDao {
	
	public static ArrayList<OrdersReciptDto> selectAll(){
		ArrayList<OrdersReciptDto> dtos = 
				new ArrayList<OrdersReciptDto>();
		String sql = "select o.order_id, o.order_date, o.user_id, o.ship_id, o.history_id, "
				+ "od.book_id, od.amount, b.title from orders o, orders_detail od, books b "
				+ "where o.order_id = od.order_id and od.book_id = b.book_id "
				+ "order by o.order_id";
		ResultSet rs = DBConn.statementQuery(sql);
		try {
			while(rs.next()) {
				dtos.add(new OrdersReciptDto(
						rs.getString("order_id"),
						rs.getDate("order_date").toLocalDate(),
						rs.getString("user_id"),
						rs.getLong("ship_id"),
						rs.getString("history_id"),
						rs.getLong("book_id"),
						rs.getLong("amount"),
						rs.getString("title")
						));
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return dtos;
	}
	
	public static ArrayList<OrdersReciptDto> selectAll2(String order_id){
		ArrayList<OrdersReciptDto> dtos = 
				new ArrayList<OrdersReciptDto>();
		String sql = String.format("select o.order_id, o.order_date, o.user_id, o.ship_id, o.history_id, "
				+ "od.book_id, od.amount, b.title from orders o, orders_detail od, books b "
				+ "where o.order_id = od.order_id and od.book_id = b.book_id "
				+ "and o.order_id='%s'",order_id);
		ResultSet rs = DBConn.statementQuery(sql);
		try {
			while(rs.next()) {
				dtos.add(new OrdersReciptDto(
						rs.getString("order_id"),
						rs.getDate("order_date").toLocalDate(),
						rs.getString("user_id"),
						rs.getLong("ship_id"),
						rs.getString("history_id"),
						rs.getLong("book_id"),
						rs.getLong("amount"),
						rs.getString("title")
						));
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return dtos;
	}
}
