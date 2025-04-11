package com.the.dto;

import java.util.Objects;

public class BooksDto {
	private Long book_id;
	private String title;
	private String author;
	private Long price;
	private Long stock;
	private Long category_id;
	private String name; // category name
	private String detail;
	private String image; // 추가된 필드
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	public Long getBook_id() {
		return book_id;
	}
	public void setBook_id(Long book_id) {
		this.book_id = book_id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public Long getPrice() {
		return price;
	}
	public void setPrice(Long price) {
		this.price = price;
	}
	public Long getStock() {
		return stock;
	}
	public void setStock(Long stock) {
		this.stock = stock;
	}
	public Long getCategory_id() {
		return category_id;
	}
	public void setCategory_id(Long category_id) {
		this.category_id = category_id;
	}
	public String getDetail() {
		return detail;
	}
	public void setDetail(String detail) {
		this.detail = detail;
	}
	
	//*********** 이미지 추가
	public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }
    
    
	@Override
	public int hashCode() {
		return Objects.hash(author, book_id, category_id, detail, price, stock, title);
	}
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		BooksDto other = (BooksDto) obj;
		return Objects.equals(author, other.author) && Objects.equals(book_id, other.book_id)
				&& Objects.equals(category_id, other.category_id) && Objects.equals(detail, other.detail)
				&& Objects.equals(price, other.price) && Objects.equals(stock, other.stock)
				&& Objects.equals(title, other.title);
	}
	@Override
	public String toString() {
		return "booksDto [book_id=" + book_id + ", title=" + title + ", author=" + author + ", price=" + price
				+ ", stock=" + stock + ", category_id=" + category_id + ", detail=" + detail + "]";
	}
	
	public BooksDto() {}
	// user select
	public BooksDto(Long book_id, String title, String author, Long price, Long stock, Long category_id,
			String detail) {
		super();
		this.book_id = book_id;
		this.title = title;
		this.author = author;
		this.price = price;
		this.stock = stock;
		this.category_id = category_id;
		this.detail = detail;
	}
	
	public BooksDto(Long book_id, String title, String author, Long price, Long stock, Long category_id, String detail, String image) {
        this.book_id = book_id;
        this.title = title;
        this.author = author;
        this.price = price;
        this.stock = stock;
        this.category_id = category_id;
        this.detail = detail;
        this.image = image;
    }
	
	
	
	// admin select
	public BooksDto(Long book_id, String title, String author, Long category_id, String name, Long price, Long stock,
			String detail) {
		super();
		this.book_id = book_id;
		this.title = title;
		this.author = author;
		this.category_id = category_id;
		this.name = name;
		this.price = price;
		this.stock = stock;
		this.detail = detail;
	}
	
	public BooksDto(Long book_id, String title, String author, Long category_id, String name, Long price, Long stock, String detail, String image) {
        this.book_id = book_id;
        this.title = title;
        this.author = author;
        this.category_id = category_id;
        this.name = name;
        this.price = price;
        this.stock = stock;
        this.detail = detail;
        this.image = image;
    }
}
