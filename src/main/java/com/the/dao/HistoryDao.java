package com.the.dao;

import java.sql.ResultSet;
import java.util.ArrayList;

import com.the.dto.BooksDto;
import com.the.dto.HistoryDto;
import com.the.util.DBConn;

public class HistoryDao {

   public static HistoryDto selectAll(){
      HistoryDto history = null;
      String sql = "select * from shipping_history order by history_id";
      ResultSet rs=DBConn.statementQuery(sql);
      try {
         if(rs.next()) {
            history = new HistoryDto(
                  rs.getString("history_id"),
                  rs.getInt("ship_state")
                  );
         }
      }catch(Exception e) {
         e.printStackTrace();
      }
      return history;
   }
   
   public static void insert(String history_id) {
      String sql = String.format("INSERT INTO shipping_history (history_id) "
            + "VALUES ('%s')", history_id);
      DBConn.statementUpdate(sql);
   }
   
   public static void delete(String history_Id) {
      DBConn.statementUpdate("delete from shipping_history where history_id="+history_Id);
   }
   
   public static void update(String history_Id, int ship_State) {
      String sql = String.format("update shipping_history set ship_state=%d "
            + "where history_id='%s'", ship_State, history_Id);
      DBConn.statementUpdate(sql);
   }
   
   public static HistoryDto select(String history_id){
      HistoryDto history = null;
      String sql = String.format("select * from shipping_history where history_id='%s'", history_id);
      ResultSet rs=DBConn.statementQuery(sql);
      try {
         if(rs.next()) {
            history = new HistoryDto(
                  rs.getString("history_id"),
                  rs.getInt("ship_state")
                  );
         }
      }catch(Exception e) {
         e.printStackTrace();
      }
      return history;
   }
   
}
