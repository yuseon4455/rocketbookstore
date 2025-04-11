package com.the.dao;

import java.sql.ResultSet;
import java.util.ArrayList;

import com.the.dto.OrdersDto;
import com.the.util.DBConn;
import com.the.util.UserInput;

public class OrdersDao {

   public static void insert(OrdersDto dto) {
      String sql = String.format(
            "insert into orders(order_id,ship_id,user_id,order_date,history_id)"
                  + "values('%s', %d, '%s', TO_DATE('%s', 'YYYY-MM-DD'), '%s') ",
            dto.getOrder_id(), dto.getShip_id(), dto.getUser_id(),
            UserInput.dateToString(dto.getOrder_date()), dto.getHistory_id());

      DBConn.statementUpdate(sql);
   }

   public static ArrayList<OrdersDto> selectAll(){
      ArrayList<OrdersDto> dtos = new ArrayList<OrdersDto>();
      String sql = "select * from orders order by order_id";
      ResultSet rs = DBConn.statementQuery(sql);
      try {
         while(rs.next()) {
            dtos.add(new OrdersDto(
                  rs.getString("order_id"),
                  rs.getLong("ship_id"),
                  rs.getString("user_id"),
                  rs.getDate("order_date").toLocalDate(),
                  rs.getString("history_id")));
         }
      }catch(Exception e) {
         e.printStackTrace();
      }
      return dtos;
   }
   
   public static ArrayList<OrdersDto> selectAll2(String order_id){
      ArrayList<OrdersDto> dtos = new ArrayList<OrdersDto>();
      ResultSet rs = DBConn.statementQuery("select * from orders where order_id="+order_id);
      try {
         while(rs.next()) {
            dtos.add(new OrdersDto(
                  rs.getString("order_id"),
                  rs.getLong("ship_id"),
                  rs.getString("user_id"),
                  rs.getDate("order_date").toLocalDate(),
                  rs.getString("history_id")));
         }
      }catch(Exception e) {
         e.printStackTrace();
      }
      return dtos;
   }
   
   public static void delete(String order_id) {
         String sql = String.format("delete from orders where order_id='%s'",
               order_id);
         DBConn.statementUpdate(sql);
      }
   
   public static ArrayList<OrdersDto> selectAll3(String user_id){
      ArrayList<OrdersDto> dtos = new ArrayList<OrdersDto>();
      String sql = String.format("select * from orders where user_id='%s' order by order_id desc", user_id);
      ResultSet rs = DBConn.statementQuery(sql);
      try {
         while(rs.next()) {
            dtos.add(new OrdersDto(
                  rs.getString("order_id"),
                  rs.getLong("ship_id"),
                  rs.getString("user_id"),
                  rs.getDate("order_date").toLocalDate(),
                  rs.getString("history_id")));
         }
      }catch(Exception e) {
         e.printStackTrace();
      }
      return dtos;
   }
   
}
