package com.the.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.Format;
import java.util.ArrayList;

import com.the.dto.UsersDto;
import com.the.util.DBConn;

public class UsersDao {

	// user_id 중복 체크 메서드
	public boolean checkUserId(String user_id) {
	    boolean exists = false;
	    String sql = String.format("SELECT count(*) FROM users WHERE user_id = '%s'", user_id);

	    // DBConn.statementQuery(sql) 호출 시 결과를 받아오고, 이를 처리합니다.
	    ResultSet rs = DBConn.statementQuery(sql);
	    
	    try {
	        if (rs.next()) {
	            // 결과셋에서 count(*) 값 확인 (0이면 존재하지 않음, 1 이상이면 존재)
	            int count = rs.getInt(1);
	            if (count > 0) {
	                exists = true; // 아이디가 이미 존재함
	            }
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    } finally {
	        // 리소스 정리
	        try {
	            if (rs != null) rs.close();
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	    }
	    
	    return exists;
	}
	
	// email 중복 체크 메서드
	public boolean checkUserEmail(String email) {
		String sql = "SELECT COUNT(*) FROM users WHERE email = '" + email + "'"; // SQL 쿼리

        boolean exists = false; // 이메일 중복 여부 저장

     // DBConn.statementQuery(sql) 호출 시 결과를 받아오고, 이를 처리합니다.
	    ResultSet rs = DBConn.statementQuery(sql);
	    
	    try {
	        if (rs.next()) {
	            // 결과셋에서 count(*) 값 확인 (0이면 존재하지 않음, 1 이상이면 존재)
	            int count = rs.getInt(1);
	            if (count > 0) {
	                exists = true; // 아이디가 이미 존재함
	            }
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    } finally {
	        // 리소스 정리
	        try {
	            if (rs != null) rs.close();
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	    }
        return exists; // true이면 중복, false이면 사용 가능
		
	}
	
	// phone 중복 체크 메서드
	public boolean checkUserPhone(String phone) {
		String sql = "SELECT COUNT(*) FROM users WHERE phone = '" + phone + "'"; // SQL 쿼리

        boolean exists = false; // 이메일 중복 여부 저장

     // DBConn.statementQuery(sql) 호출 시 결과를 받아오고, 이를 처리합니다.
	    ResultSet rs = DBConn.statementQuery(sql);
	    
	    try {
	        if (rs.next()) {
	            // 결과셋에서 count(*) 값 확인 (0이면 존재하지 않음, 1 이상이면 존재)
	            int count = rs.getInt(1);
	            if (count > 0) {
	                exists = true; // 아이디가 이미 존재함
	            }
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    } finally {
	        // 리소스 정리
	        try {
	            if (rs != null) rs.close();
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	    }
        return exists; // true이면 중복, false이면 사용 가능
		
	}

	
	// insert user (회원가입)
	public void insertUsers(UsersDto userDto) {
		String sql = String.format(
				"insert into users (user_id, user_pw, user_name, email, phone) " + "values ('%s','%s','%s','%s','%s') ",
				userDto.getUser_id(), userDto.getUser_pw(), userDto.getUser_name(), userDto.getEmail(),
				userDto.getPhone());
		DBConn.statementUpdate(sql);
	}

	// select user (로그인)
	public UsersDto checkLogin(String user_id, String user_pw) {
		UsersDto userDto = null; // 반환할 사용자 정보

		// 쿼리 작성
		String sql = String.format("SELECT * FROM users WHERE user_id = '%s' AND user_pw = '%s'", user_id, user_pw);
		ResultSet rs = DBConn.statementQuery(sql);

		try {
			// 쿼리 실행 및 결과 확인
			if (rs != null && rs.next()) {
				// 로그인 성공 시 사용자 정보를 UsersDto에 세팅
				userDto = new UsersDto( rs.getString("user_id"), rs.getString("user_name"),
						rs.getString("user_pw"), rs.getString("email"), rs.getString("phone"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		// 로그인 성공 시 사용자 정보 반환, 실패 시 null 반환
		return userDto;
	}

	// update User (회원 수정)
	public boolean updateUser( String user_name,  String user_id,String user_pw, String email, String phone)
			throws SQLException {

		String sql = String.format(
				"update users set user_name = '%s', user_pw='%s', " + "email = '%s', phone = '%s' WHERE user_id = '%s'",
				user_name, user_pw, email, phone, user_id);
		DBConn.statementUpdate(sql);
		return true;

	}

	// delete User (회원 탈퇴)
	public void deleteUser(String user_id) {
		String sql = String.format("delete from users where user_id = '%s'", user_id);
		DBConn.statementUpdate(sql);
	}

	// select all (관리자 전체회원 목록)
	public ArrayList<UsersDto> selectAll() {
		ArrayList<UsersDto> dtos = new ArrayList<UsersDto>();
		String sql = "select * from users";
		ResultSet rs = DBConn.statementQuery(sql);
		try {
			while (rs.next()) {
				dtos.add(new UsersDto(rs.getString("user_name"), rs.getString("user_id"),
						rs.getString("user_pw"), rs.getString("email"), rs.getString("phone")));
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return dtos;
	}
	
	public static UsersDto select(String user_id) {
	      UsersDto dtos = null;
	      String sql = String.format("select * from users where user_id='%s'", user_id);
	      ResultSet rs = DBConn.statementQuery(sql);
	      try {
	         if(rs.next()) {
	            dtos = new UsersDto(
	                  rs.getString("user_id"), rs.getString("user_name"),
	                  rs.getString("user_pw"), rs.getString("email"), rs.getString("phone")
	                  );
	         }
	      }catch(Exception e) {
	         e.printStackTrace();
	      }
	      return dtos;
	   }

}
