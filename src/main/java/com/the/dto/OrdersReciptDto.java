package com.the.dto;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.Objects;

public class OrdersReciptDto {
	private String order_id;
	private LocalDate order_date;
	private String user_id;
	private long ship_id;
	private String history_id;
	private long book_id;
	private long amount;
	private String title;
	public OrdersReciptDto(String order_id, LocalDate order_date, String user_id, long ship_id, String history_id,
			long book_id, long amount, String title) {
		super();
		this.order_id = order_id;
		this.order_date = order_date;
		this.user_id = user_id;
		this.ship_id = ship_id;
		this.history_id = history_id;
		this.book_id = book_id;
		this.amount = amount;
		this.title = title;
	}
	public OrdersReciptDto() {
		super();
	}
	@Override
	public String toString() {
		return "OrdersReciptDto [order_id=" + order_id + ", order_date=" + order_date + ", user_id=" + user_id
				+ ", ship_id=" + ship_id + ", history_id=" + history_id + ", book_id=" + book_id + ", amount=" + amount
				+ ", title=" + title + "]";
	}
	@Override
	public int hashCode() {
		return Objects.hash(amount, book_id, title, history_id, order_date, order_id, ship_id, user_id);
	}
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		OrdersReciptDto other = (OrdersReciptDto) obj;
		return amount == other.amount && book_id == other.book_id && Objects.equals(title, other.title)
				&& Objects.equals(history_id, other.history_id) && Objects.equals(order_date, other.order_date)
				&& Objects.equals(order_id, other.order_id) && ship_id == other.ship_id
				&& Objects.equals(user_id, other.user_id);
	}
	public String getOrder_id() {
		return order_id;
	}
	public void setOrder_id(String order_id) {
		this.order_id = order_id;
	}
	public LocalDate getOrder_date() {
		return order_date;
	}
	public void setOrder_date(LocalDate order_date) {
		this.order_date = order_date;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public long getShip_id() {
		return ship_id;
	}
	public void setShip_id(long ship_id) {
		this.ship_id = ship_id;
	}
	public String getHistory_id() {
		return history_id;
	}
	public void setHistory_id(String history_id) {
		this.history_id = history_id;
	}
	public long getBook_id() {
		return book_id;
	}
	public void setBook_id(long book_id) {
		this.book_id = book_id;
	}
	public long getAmount() {
		return amount;
	}
	public void setAmount(long amount) {
		this.amount = amount;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	
}
