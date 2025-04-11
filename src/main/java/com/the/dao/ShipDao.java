package com.the.dao;

import java.sql.ResultSet;
import java.util.ArrayList;

import com.the.dto.ShipDto;
import com.the.util.DBConn;

public class ShipDao {

   public static ArrayList<ShipDto> selectAll(){
      ArrayList<ShipDto> dtos = new ArrayList<ShipDto>();
      String sql = "select * from ship order by ship_id";
      ResultSet rs=DBConn.statementQuery(sql);
      try {
         while(rs.next()) {
            dtos.add(new ShipDto(
                  rs.getLong("ship_id"),
                  rs.getString("user_id"),
                  rs.getString("address")
                  ));
         }
      }catch(Exception e) {
         e.printStackTrace();
      }
      return dtos;
   }
   
   public static void insert(ShipDto dto) {
      String sql = String.format("INSERT INTO ship (user_id, address) "
            + "VALUES ('%s', '%s')", dto.getUser_id(), dto.getAddress());
      DBConn.statementUpdate(sql);
   }
   
   public static void delete(long ship_id) {
      String sql = String.format("delete from ship where ship_id=%d",
            ship_id);
      DBConn.statementUpdate(sql);
   }
   
   public static void update(long ship_id, String address) {
      String sql = String.format("update ship set address='%s' where ship_id=%d", 
            address,ship_id);
      DBConn.statementUpdate(sql);
   }
   
   public static ArrayList<ShipDto> selectAll2(String user_id){
      ArrayList<ShipDto> dtos = new ArrayList<ShipDto>();
      String sql = String.format("select * from ship where user_id='%s'"
            + " order by ship_id", user_id);
      ResultSet rs = DBConn.statementQuery(sql);
      try {
         while(rs.next()) {
            dtos.add(new ShipDto(
                  rs.getLong("ship_id"),
                  rs.getString("user_id"),
                  rs.getString("address")));
         }
      }catch(Exception e) {
         e.printStackTrace();
      }
      return dtos;
   }
   public static ShipDto selectAll(String user_id, long ship_id){
      ShipDto dtos = null;
      String sql = String.format("select * from ship where user_id='%s' and ship_id=%d"
            + " order by ship_id", user_id, ship_id);
      ResultSet rs = DBConn.statementQuery(sql);
      try {
         if(rs.next()) {
            dtos=new ShipDto(
                  rs.getLong("ship_id"),
                  rs.getString("user_id"),
                  rs.getString("address"));
         }
      }catch(Exception e) {
         e.printStackTrace();
      }
      return dtos;
   }
} 
