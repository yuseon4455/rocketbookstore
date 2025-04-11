package com.the.dto;

import java.util.Objects;

public class OrdersBookDto {
	private Long id;
	private Long book_id;
	private String title;
	private Long amount;
	private Long price;
	
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
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
	@Override
	public int hashCode() {
		return Objects.hash(amount, book_id, id, price, title);
	}
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		OrdersBookDto other = (OrdersBookDto) obj;
		return Objects.equals(amount, other.amount) && Objects.equals(book_id, other.book_id)
				&& Objects.equals(id, other.id) && Objects.equals(price, other.price)
				&& Objects.equals(title, other.title);
	}
	@Override
	public String toString() {
		return "OrdersBookDto [id=" + id + ", book_id=" + book_id + ", title=" + title + ", amount=" + amount
				+ ", price=" + price + "]";
	}
	
	public OrdersBookDto() {}
	public OrdersBookDto(Long id, Long book_id, String title, Long amount, Long price) {
		super();
		this.id = id;
		this.book_id = book_id;
		this.title = title;
		this.amount = amount;
		this.price = price;
	}
	
	
	
}
