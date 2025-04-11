package com.the.dto;

import java.util.Objects;

public class ShipDto {
	private long ship_id;
	private String user_id;
	private String address;
	@Override
	public int hashCode() {
		return Objects.hash(address, ship_id, user_id);
	}
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		ShipDto other = (ShipDto) obj;
		return Objects.equals(address, other.address) && ship_id == other.ship_id
				&& Objects.equals(user_id, other.user_id);
	}
	@Override
	public String toString() {
		return "ShipDto [ship_id=" + ship_id + ", user_id=" + user_id + ", address=" + address + "]";
	}
	public ShipDto(long ship_id, String user_id, String address) {
		super();
		this.ship_id = ship_id;
		this.user_id = user_id;
		this.address = address;
	}
	
	public ShipDto(String user_id, String address) {
		super();
		this.user_id = user_id;
		this.address = address;
	}
	public ShipDto() {
		super();
	}
	public long getShip_id() {
		return ship_id;
	}
	public void setShip_id(long ship_id) {
		this.ship_id = ship_id;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}

}
