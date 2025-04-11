package com.the.dao;

import java.sql.ResultSet;
import java.util.ArrayList;

import com.the.dto.OrdersDetailDto;
import com.the.util.DBConn;

public class OrdersDetailDao {

		public static ArrayList<OrdersDetailDto> selectAll(){
			ArrayList<OrdersDetailDto> dtos = 
					new ArrayList<OrdersDetailDto>();
			String sql = "select * from orders_detail order by detail_id";
			ResultSet rs = DBConn.statementQuery(sql);
			try {
				while(rs.next()) {
					dtos.add(new OrdersDetailDto(
							rs.getLong("detail_id"),
							rs.getString("order_id"),
							rs.getLong("amount"),
							rs.getLong("book_id")));
				}
				
			}catch(Exception e) {
				e.printStackTrace();
			}
			return dtos;
		}
		public static void insert(OrdersDetailDto dto) {
			String sql = String.format("insert into orders_detail (order_id, amount, book_id) "
					+ "values ('%s', %d, %d)", dto.getOrder_id(), dto.getAmount(), dto.getBook_id());
			DBConn.statementUpdate(sql);
		}
}
