package com.the.dto;

import java.time.LocalDate;
import java.util.Objects;

public class OrdersDto {
	private String order_id;
	private Long ship_id;
	private String user_id;
	private LocalDate order_date;
	private String history_id;
	@Override
	public String toString() {
		return "OrdersDto [order_id=" + order_id + ", ship_id=" + ship_id + ", user_id=" + user_id + ", order_date="
				+ order_date + ", history_id=" + history_id + "]";
	}
	public OrdersDto(String order_id, Long ship_id, String user_id, LocalDate order_date, String history_id) {
		super();
		this.order_id = order_id;
		this.ship_id = ship_id;
		this.user_id = user_id;
		this.order_date = order_date;
		this.history_id = history_id;
	}
	public OrdersDto() {
		super();
	}
	@Override
	public int hashCode() {
		return Objects.hash(history_id, order_date, order_id, ship_id, user_id);
	}
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		OrdersDto other = (OrdersDto) obj;
		return Objects.equals(history_id, other.history_id) && Objects.equals(order_date, other.order_date)
				&& Objects.equals(order_id, other.order_id) && Objects.equals(ship_id, other.ship_id)
				&& Objects.equals(user_id, other.user_id);
	}
	public String getOrder_id() {
		return order_id;
	}
	public void setOrder_id(String order_id) {
		this.order_id = order_id;
	}
	public Long getShip_id() {
		return ship_id;
	}
	public void setShip_id(Long ship_id) {
		this.ship_id = ship_id;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public LocalDate getOrder_date() {
		return order_date;
	}
	public void setOrder_date(LocalDate order_date) {
		this.order_date = order_date;
	}
	public String getHistory_id() {
		return history_id;
	}
	public void setHistory_id(String history_id) {
		this.history_id = history_id;
	}
	
}
