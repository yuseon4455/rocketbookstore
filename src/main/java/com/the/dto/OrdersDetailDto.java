package com.the.dto;

import java.util.Objects;

public class OrdersDetailDto {
	private long detail_id;
	private String order_id;
	private long amount;
	private long book_id;
	@Override
	public String toString() {
		return "OrdersDetailDto [detail_id=" + detail_id + ", order_id=" + order_id + ", amount=" + amount
				+ ", book_id=" + book_id + "]";
	}
	public OrdersDetailDto(long detail_id, String order_id, long amount, long book_id) {
		super();
		this.detail_id = detail_id;
		this.order_id = order_id;
		this.amount = amount;
		this.book_id = book_id;
	}
	public OrdersDetailDto(String order_id, long amount, long book_id) {
		super();
		this.order_id = order_id;
		this.amount = amount;
		this.book_id = book_id;
	}
	public OrdersDetailDto() {
		super();
	}
	@Override
	public int hashCode() {
		return Objects.hash(amount, book_id, detail_id, order_id);
	}
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		OrdersDetailDto other = (OrdersDetailDto) obj;
		return amount == other.amount && book_id == other.book_id && detail_id == other.detail_id
				&& Objects.equals(order_id, other.order_id);
	}
	public long getDetail_id() {
		return detail_id;
	}
	public void setDetail_id(long detail_id) {
		this.detail_id = detail_id;
	}
	public String getOrder_id() {
		return order_id;
	}
	public void setOrder_id(String order_id) {
		this.order_id = order_id;
	}
	public long getAmount() {
		return amount;
	}
	public void setAmount(long amount) {
		this.amount = amount;
	}
	public long getBook_id() {
		return book_id;
	}
	public void setBook_id(long book_id) {
		this.book_id = book_id;
	}
	
}
