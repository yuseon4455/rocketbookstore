package com.the.dto;

import java.util.Objects;

public class CartBookDto {
   private Long cart_id;
   private String user_id;
   private Long book_id;   
   private String title;
   private Long amount;
   private Long price;
   @Override
   public String toString() {
      return "CartBookDto [cart_id=" + cart_id + ", user_id=" + user_id + ", book_id=" + book_id + ", title=" + title
            + ", amount=" + amount + ", price=" + price + "]";
   }
   public CartBookDto(Long cart_id, String user_id, Long book_id, String title, Long amount, Long price) {
      super();
      this.cart_id = cart_id;
      this.user_id = user_id;
      this.book_id = book_id;
      this.title = title;
      this.amount = amount;
      this.price = price;
   }
   public CartBookDto(Long cart_id, Long book_id, String title, Long amount, Long price) {
      super();
      this.cart_id = cart_id;
      this.book_id = book_id;
      this.title = title;
      this.amount = amount;
      this.price = price;
   }
   
   public CartBookDto() {
      super();
   }
   @Override
   public int hashCode() {
      return Objects.hash(amount, book_id, cart_id, price, title, user_id);
   }
   @Override
   public boolean equals(Object obj) {
      if (this == obj)
         return true;
      if (obj == null)
         return false;
      if (getClass() != obj.getClass())
         return false;
      CartBookDto other = (CartBookDto) obj;
      return Objects.equals(amount, other.amount) && Objects.equals(book_id, other.book_id)
            && Objects.equals(cart_id, other.cart_id) && Objects.equals(price, other.price)
            && Objects.equals(title, other.title) && Objects.equals(user_id, other.user_id);
   }
   public Long getCart_id() {
      return cart_id;
   }
   public void setCart_id(Long cart_id) {
      this.cart_id = cart_id;
   }
   public String getUser_id() {
      return user_id;
   }
   public void setUser_id(String user_id) {
      this.user_id = user_id;
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
   public Long getAmount() {
      return amount;
   }
   public void setAmount(Long amount) {
      this.amount = amount;
   }
   public Long getPrice() {
      return price;
   }
   public void setPrice(Long price) {
      this.price = price;
   }
   
}
