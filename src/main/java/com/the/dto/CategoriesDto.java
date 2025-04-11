package com.the.dto;

import java.util.Objects;

public class CategoriesDto {
	private Long category_id;
    private String name;
	public Long getCategory_id() {
		return category_id;
	}
	public void setCategory_id(Long category_id) {
		this.category_id = category_id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	@Override
	public int hashCode() {
		return Objects.hash(category_id, name);
	}
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		CategoriesDto other = (CategoriesDto) obj;
		return Objects.equals(category_id, other.category_id) && Objects.equals(name, other.name);
	}
	@Override
	public String toString() {
		return "categoriesDto [category_id=" + category_id + ", name=" + name + "]";
	}
	public CategoriesDto() {}
	public CategoriesDto(Long category_id, String name) {
		super();
		this.category_id = category_id;
		this.name = name;
	}
    
    
}
