package com.the.dto;

import java.util.Objects;

public class WishListDto {
   private Long wishlist_id;
   private Long book_id;
   private String title;
   private String author;
   private String image;
   private long category_id;
   @Override
   public String toString() {
      return "WishListDto [wishlist_id=" + wishlist_id + ", book_id=" + book_id + ", title=" + title + ", author="
            + author + ", image=" + image + ", category_id=" + category_id + "]";
   }
   public WishListDto(Long wishlist_id, Long book_id, String title, String author, String image, Long category_id) {
      super();
      this.wishlist_id = wishlist_id;
      this.book_id = book_id;
      this.title = title;
      this.author = author;
      this.image = image;
      this.category_id = category_id;
   }
   public WishListDto() {
      super();
   }
   @Override
   public int hashCode() {
      return Objects.hash(author, book_id, image, title, wishlist_id, category_id);
   }
   @Override
   public boolean equals(Object obj) {
      if (this == obj)
         return true;
      if (obj == null)
         return false;
      if (getClass() != obj.getClass())
         return false;
      WishListDto other = (WishListDto) obj;
      return Objects.equals(author, other.author) && Objects.equals(book_id, other.book_id)
            && Objects.equals(image, other.image) && Objects.equals(title, other.title)
            && Objects.equals(wishlist_id, other.wishlist_id) && Objects.equals(category_id, other.category_id);
   }
   public Long getWishlist_id() {
      return wishlist_id;
   }
   public void setWishlist_id(Long wishlist_id) {
      this.wishlist_id = wishlist_id;
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
   public String getImage() {
      return image;
   }
   public void setImage(String image) {
      this.image = image;
   }
   public Long getCategory_id() {
      return category_id;
   }
   public void setCategory_id(Long category_id) {
      this.category_id = category_id;
   }

}
