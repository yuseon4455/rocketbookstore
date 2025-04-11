package com.the.dto;

import java.util.Objects;

public class UsersDto {
	private String user_id; // pk
	private String user_name;
	private String user_pw;
	private String email;
	private String phone;
	
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getUser_pw() {
		return user_pw;
	}
	public void setUser_pw(String user_pw) {
		this.user_pw = user_pw;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}

	
	@Override
	public String toString() {
		return "UsersDto [user_id=" + user_id + ", user_name=" + user_name + ", user_pw=" + user_pw + ", email=" + email
				+ ", phone=" + phone + "]";
	}
	@Override
	public int hashCode() {
		return Objects.hash(email, phone, user_id, user_name, user_pw);
	}
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		UsersDto other = (UsersDto) obj;
		return Objects.equals(email, other.email) && Objects.equals(phone, other.phone)
				&& Objects.equals(user_id, other.user_id) && Objects.equals(user_name, other.user_name)
				&& Objects.equals(user_pw, other.user_pw);
	}
	// 기본 생성자
	public UsersDto () {
		
	}
	
	// 생성자
	public UsersDto(String user_id, String user_name, String user_pw, String email, String phone) {
		super();
		this.user_id = user_id;
		this.user_name = user_name;
		this.user_pw = user_pw;
		this.email = email;
		this.phone = phone;
	}
	
	
	
}
