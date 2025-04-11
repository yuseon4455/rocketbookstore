package com.the.dto;

import java.util.Objects;

public class CartDto {
	private Long cart_id;
	private String user_id;
	private Long book_id;
	private Long amount;
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
	public Long getAmount() {
		return amount;
	}
	public void setAmount(Long amount) {
		this.amount = amount;
	}
	@Override
	public int hashCode() {
		return Objects.hash(amount, book_id, cart_id, user_id);
	}
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		CartDto other = (CartDto) obj;
		return Objects.equals(amount, other.amount) && Objects.equals(book_id, other.book_id)
				&& Objects.equals(cart_id, other.cart_id) && Objects.equals(user_id, other.user_id);
	}
	@Override
	public String toString() {
		return "CartDto [cart_id=" + cart_id + ", user_id=" + user_id + ", book_id=" + book_id + ", amount=" + amount
				+ "]";
	}
	
	public CartDto() {}
	public CartDto(Long cart_id, String user_id, Long book_id, Long amount) {
		super();
		this.cart_id = cart_id;
		this.user_id = user_id;
		this.book_id = book_id;
		this.amount = amount;
	}
	
	public CartDto(String user_id, Long book_id) {
		super();
		this.user_id = user_id;
		this.book_id = book_id;
	}
	
	
}
