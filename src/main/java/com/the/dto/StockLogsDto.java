package com.the.dto;

import java.util.Objects;

public class StockLogsDto {
    private Long log_id;         
    private Long book_id;        
    private Long in_stock;// 입고 수량 (관리자 입력)
    private Long amount;
    private String title;
    private Long stock;
    private String order_id;

    // 기본 생성자
    public StockLogsDto() {}

	

	public StockLogsDto(Long log_id, Long book_id, Long in_stock, Long amount) {
		super();
		this.log_id = log_id;
		this.book_id = book_id;
		this.in_stock = in_stock;
		this.amount = amount;
	}
	
	// 입고
	 public StockLogsDto(long log_id, long book_id, String title, long in_stock, long stock) {
         this.log_id = log_id;
         this.book_id = book_id;
         this.title = title;
         this.in_stock = in_stock;
         this.stock = stock;
     }
	 
	 public StockLogsDto(long log_id, long book_id, long in_stock, long amount, long stock) {
		    this.log_id = log_id;
		    this.book_id = book_id;
		    this.in_stock = in_stock;
		    this.amount = amount;
		    this.stock = stock;
		}
	 
	 public StockLogsDto(long log_id, long book_id, String title, long in_stock, String order_id, long amount, long stock) {
	        this.log_id = log_id;
	        this.book_id = book_id;
	        this.title = title;
	        this.in_stock = in_stock;
	        this.order_id = order_id;
	        this.amount = amount;
	        this.stock = stock;
	    }
	
	
	
	public String toString() {
        return "StockLogsDto [logId=" + log_id + ", bookId=" + book_id + ", title=" + title + ", in_stock=" + in_stock
                + ", stock=" + stock + "]";
    }
	
	

	@Override
	public int hashCode() {
		return Objects.hash(book_id, in_stock, log_id,amount);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		StockLogsDto other = (StockLogsDto) obj;
		return Objects.equals(book_id, other.book_id) && Objects.equals(in_stock, other.in_stock)
				&& Objects.equals(log_id, other.log_id);
	}

	public Long getLog_id() {
		return log_id;
	}

	public void setLog_id(Long log_id) {
		this.log_id = log_id;
	}

	public Long getBook_id() {
		return book_id;
	}

	public void setBook_id(Long book_id) {
		this.book_id = book_id;
	}

	public Long getIn_stock() {
		return in_stock;
	}

	public void setIn_stock(Long in_stock) {
		this.in_stock = in_stock;
	}
    
	public Long getAmount() {
		return amount;
	}

	public void setAmount(Long amount) {
		this.amount = amount;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public Long getStock() {
		return stock;
	}

	public void setStock(Long stock) {
		this.stock = stock;
	}



	public String getOrder_id() {
		return order_id;
	}



	public void setOrder_id(String order_id) {
		this.order_id = order_id;
	}
	
	
	
	
}
