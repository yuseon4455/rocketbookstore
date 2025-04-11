package com.the.dto;

import java.util.Objects;

public class HistoryDto {
	private String history_id;
	private int ship_state;
	@Override
	public String toString() {
		return "HistoryDto [history_id=" + history_id + ", ship_state=" + ship_state + "]";
	}
	public HistoryDto(String history_id, int ship_state) {
		super();
		this.history_id = history_id;
		this.ship_state = ship_state;
	}
	public HistoryDto() {
		super();
	}
	@Override
	public int hashCode() {
		return Objects.hash(history_id, ship_state);
	}
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		HistoryDto other = (HistoryDto) obj;
		return Objects.equals(history_id, other.history_id) && ship_state == other.ship_state;
	}
	public String getHistory_id() {
		return history_id;
	}
	public void setHistory_id(String history_id) {
		this.history_id = history_id;
	}
	public int getShip_state() {
		return ship_state;
	}
	public void setShip_state(int ship_state) {
		this.ship_state = ship_state;
	}
	

}