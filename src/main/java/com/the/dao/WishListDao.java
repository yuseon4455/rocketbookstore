package com.the.dao;

import java.sql.ResultSet;
import java.util.ArrayList;

import com.the.dto.WishListDto;
import com.the.util.DBConn;

public class WishListDao {

	// 특정 사용자의 위시리스트에 해당 책이 있는지 확인하는 메서드
	public boolean isBookInWishlist(String user_id, Long book_id) {
		String sql = String.format("SELECT COUNT(*) FROM wishlist WHERE user_id='%s' AND book_id=%d", user_id, book_id);
		ResultSet rs = DBConn.statementQuery(sql);
		try {
			if (rs.next()) {
				return rs.getInt(1) > 0; // 존재하면 true
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false; // 오류 발생 시 기본값 false
	}

	// insert wishlist (위시 추가)
	public void addWishList(String user_id, Long book_id) {
		String sql = "INSERT INTO wishlist (user_id, book_id) " + "VALUES ('" + user_id + "', " + book_id + ")";
		DBConn.statementUpdate(sql);
	}

	// select wishlist (위시 목록)
	public ArrayList<WishListDto> selectWishList(String user_id) {
		ArrayList<WishListDto> wishlistDto = new ArrayList<>();
		String sql = "SELECT wishlist.wishlist_id, wishlist.book_id, books.title, books.image, "
				+ "books.author, books.category_id FROM wishlist JOIN books ON wishlist.book_id = books.book_id "
				+ "WHERE wishlist.user_id = '" + user_id + "'";

		ResultSet rs = DBConn.statementQuery(sql);

		try {
			while (rs.next()) {
				wishlistDto.add(new WishListDto(rs.getLong("wishlist_id"), rs.getLong("book_id"), rs.getString("title"),
						rs.getString("author"), rs.getString("image"), rs.getLong("category_id")));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return wishlistDto;
	}

// delete wishlist (위시 삭제)
	public void deleteWishList(String user_id, Long book_id) {
		String sql = "DELETE FROM wishlist WHERE user_id = '" + user_id + "' AND book_id = " + book_id;
		DBConn.statementUpdate(sql);
	}

	public ArrayList<WishListDto> selectWishList(String user_id, long category_id) {
		ArrayList<WishListDto> wishlistDto = new ArrayList<>();
		String sql = "SELECT wishlist.wishlist_id, wishlist.book_id, books.title, books.image, "
				+ "books.author, books.category_id FROM wishlist JOIN books ON wishlist.book_id = books.book_id "
				+ "WHERE wishlist.user_id = '" + user_id + "' and category_id = " + category_id;

		ResultSet rs = DBConn.statementQuery(sql);

		try {
			while (rs.next()) {
				wishlistDto.add(new WishListDto(rs.getLong("wishlist_id"), rs.getLong("book_id"), rs.getString("title"),
						rs.getString("author"), rs.getString("image"), rs.getLong("category_id")));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return wishlistDto;
	}
}
