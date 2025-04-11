package com.the.dao;

import java.sql.ResultSet;
import java.util.ArrayList;

import com.the.dto.BooksDto;
import com.the.util.DBConn;
import com.the.util.UserInput;

//Hobby테이블 CRUD작업하는 클래스
public class BooksDao {
	
//	public void insert(BooksDto dto) {
//		String sql = String.format(
//			    "insert into books (title,author,price,stock,category_id,detail)"
//			    + " values('%s', '%s', %d, %d, %d, '%s')",
//			    dto.getTitle(),dto.getAuthor(),
//			    dto.getPrice(),dto.getStock(),dto.getCategory_id(),
//			    dto.getDetail()
//			);				
//			DBConn.statementUpdate(sql);
//	}
	
	public void insert(BooksDto dto) {
	    String sql = String.format(
	        "INSERT INTO books (title, author, price, stock, category_id, detail, image) " +
	        "VALUES ('%s', '%s', %d, %d, %d, '%s', '%s')",
	        dto.getTitle(), dto.getAuthor(),
	        dto.getPrice(), dto.getStock(), dto.getCategory_id(),
	        dto.getDetail(), dto.getImage()
	    );                
	    DBConn.statementUpdate(sql);
	}
	
	
	// user입장  selectAll
	public ArrayList<BooksDto> selectAll(){
		ArrayList<BooksDto> dtos=new ArrayList<BooksDto>();
		String sql ="select * from books order by book_id";
		ResultSet rs=DBConn.statementQuery(sql);
		try {
			while(rs.next()) {
				dtos.add(new BooksDto(
						rs.getLong("book_id"),
						rs.getString("title"),
						rs.getString("author"),
						rs.getLong("price"),
						rs.getLong("stock"),
						rs.getLong("category_id"),
						rs.getString("detail"),
						rs.getString("image") // 추가된 필드
					));
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return dtos;
	}
	
	// keyword로 search
	public ArrayList<BooksDto> searchBooksByKeyword(String keyword) {
	    ArrayList<BooksDto> list = new ArrayList<>();
	    String sql = "SELECT * FROM books WHERE " +
                "LOWER(title) LIKE LOWER('%" + keyword + "%') " +
                "OR LOWER(author) LIKE LOWER('%" + keyword + "%')";

	    ResultSet rs = DBConn.statementQuery(sql);

	    try {
	        while (rs.next()) {
	            list.add(new BooksDto(
	                rs.getLong("book_id"),
	                rs.getString("title"),
	                rs.getString("author"),
	                rs.getLong("price"),
	                rs.getLong("stock"),
	                rs.getLong("category_id"),
	                rs.getString("detail"),
	                rs.getString("image")
	            ));
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }

	    return list;
	}

	
	

	
	// admin 입장 selectAll
//	public ArrayList<BooksDto> adminSelectAll(){
//		ArrayList<BooksDto> dtos=new ArrayList<BooksDto>();
//		String sql ="SELECT b.book_id, b.title, b.author, b.category_id, categories.name, "
//				+ "b.price, b.stock, b.detail "
//				+ "FROM books b "
//				+ "JOIN categories ON b.category_id = categories.category_id "
//				+ "Order by b.book_id";
//		ResultSet rs=DBConn.statementQuery(sql);
//		try {
//			while(rs.next()) {
//				dtos.add(new BooksDto(
//						rs.getLong("book_id"),
//						rs.getString("title"),
//						rs.getString("author"),
//						rs.getLong("category_id"),
//						rs.getString("name"),
//						rs.getLong("price"),
//						rs.getLong("stock"),
//						rs.getString("detail")
//						));
//			}
//			
//		}catch(Exception e) {
//			e.printStackTrace();
//		}
//		return dtos;
//	}
	
	
	public ArrayList<BooksDto> adminSelectAll() {
	    ArrayList<BooksDto> dtos = new ArrayList<>();
	    String sql = "SELECT b.book_id, b.title, b.author, b.category_id, categories.name, " +
	                 "b.price, b.stock, b.detail, b.image " +
	                 "FROM books b " +
	                 "JOIN categories ON b.category_id = categories.category_id " +
	                 "ORDER BY b.book_id";
	    ResultSet rs = DBConn.statementQuery(sql);

	    try {
	        while (rs.next()) {
	            dtos.add(new BooksDto(
	                rs.getLong("book_id"),
	                rs.getString("title"),
	                rs.getString("author"),
	                rs.getLong("category_id"),
	                rs.getString("name"),
	                rs.getLong("price"),
	                rs.getLong("stock"),
	                rs.getString("detail"),
	                rs.getString("image") // 추가된 필드
	            ));
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return dtos;
	}
	
	
	
	
//	
//	private Long book_id;
//	private String title;
//	private String author;
//	private Long price;
//	private Long stock;
//	private Long category_id;
//	private String detail;
	
	public void delete(Long book_id) {
		String sql = String.format("DELETE FROM BOOKS WHERE book_id = %d", book_id);
		DBConn.statementUpdate(sql);
	}
	
	// bookId로 조회
	public BooksDto getBookById(Long book_id) {
	    BooksDto book = null;
	    
	    String sql = "SELECT b.book_id, b.title, b.author, b.category_id, categories.name, " +
	                 "b.price, b.stock, b.detail, b.image " +
	                 "FROM books b " +
	                 "JOIN categories ON b.category_id = categories.category_id " +
	                 "WHERE b.book_id = " + book_id; 
	    ResultSet rs = DBConn.statementQuery(sql);

	    try {
	        if (rs.next()) {
	            book = new BooksDto();
	            book.setBook_id(rs.getLong("book_id"));
	            book.setTitle(rs.getString("title"));
	            book.setAuthor(rs.getString("author"));
	            book.setPrice(rs.getLong("price"));
	            book.setStock(rs.getLong("stock"));
	            book.setCategory_id(rs.getLong("category_id"));
	            book.setName(rs.getString("name"));
	            book.setDetail(rs.getString("detail"));
	            book.setImage(rs.getString("image")); // 추가된 필드
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return book;
	}
	
	// book 정보 수정
	public void update(String title, String author, Long price, Long category_id, String detail, String image, Long book_id) {
	    String sql = String.format(
	        "UPDATE books SET title = '%s', author = '%s', price = %d, category_id = %d, detail = '%s', image = '%s' " +
	        "WHERE book_id = %d",
	        title, author, price, category_id, detail, image, book_id
	    );
	    DBConn.statementUpdate(sql);
	}
	
	
	public BooksDto selectAll(long book_id) {
	    BooksDto book = null;
	    String sql = String.format("SELECT * FROM books WHERE book_id = %d", book_id);
	    ResultSet rs = DBConn.statementQuery(sql);
	    
	    try {
	        if (rs.next()) {
	            book = new BooksDto(
	                rs.getLong("book_id"),
	                rs.getString("title"),
	                rs.getString("author"),
	                rs.getLong("price"),
	                rs.getLong("stock"),
	                rs.getLong("category_id"),
	                rs.getString("detail"),
	                rs.getString("image")
	            );
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return book;
	}


}

