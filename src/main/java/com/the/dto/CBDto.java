package com.the.dto;

import java.util.Objects;

public class CBDto {
   private Long category_id;
   private Long book_id;
   private String title;
   private String author;
   private String detail;
   private String image;
   private boolean wishAdded; // 찜 여부 저장
	
   public boolean isWishAdded() {
		return wishAdded;
   }
	
   public void setWishAdded(boolean wishAdded) {
		this.wishAdded = wishAdded;
   }
   
   public Long getCategory_id() {
      return category_id;
   }
   public void setCategory_id(Long category_id) {
      this.category_id = category_id;
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
   public String getDetail() {
      return detail;
   }
   public void setDetail(String detail) {
      this.detail = detail;
   }
   
   public String getImage() { return image; }
   public void setImage(String image) { this.image = image; }
   
   @Override
   public int hashCode() {
      return Objects.hash(author, book_id, category_id, detail, title);
   }
   @Override
   public boolean equals(Object obj) {
      if (this == obj)
         return true;
      if (obj == null)
         return false;
      if (getClass() != obj.getClass())
         return false;
      CBDto other = (CBDto) obj;
      return Objects.equals(author, other.author) && Objects.equals(book_id, other.book_id)
            && Objects.equals(category_id, other.category_id) && Objects.equals(detail, other.detail)
            && Objects.equals(title, other.title);
   }
   @Override
   public String toString() {
       return "CBDto [book_id=" + book_id + ", title=" + title + ", author=" + author + 
              ", detail=" + detail + ", image=" + image + "]";
   }
   
   public CBDto() {}
   public CBDto(Long category_id, Long book_id, String title, String author, String detail) {
      super();
      this.category_id = category_id;
      this.book_id = book_id;
      this.title = title;
      this.author = author;
      this.detail = detail;
   }
   
   public CBDto(long book_id, String title, String author, String detail, String image) {
       this.book_id = book_id;
       this.title = title;
       this.author = author;
       this.detail = detail;
       this.image = image;
   }
   public CBDto(Long category_id, Long book_id, String title, String author, String detail, String image) {
	    this.category_id = category_id;
	    this.book_id = book_id;
	    this.title = title;
	    this.author = author;
	    this.detail = detail;
	    this.image = image;
	}
   
   
}
