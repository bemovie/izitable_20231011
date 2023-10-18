package com.izitable.model;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class ShopTime {
	
	//tbl_shop_time
	private int timeNo;
	private String timeDay;
	private String timeHour;
	
	private int shopNo;
	
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date bookingDate;
	

	public int getShopNo() {
		return shopNo;
	}

	public void setShopNo(int shopNo) {
		this.shopNo = shopNo;
	}

	public Date getBookingDate() {
		return bookingDate;
	}

	public void setBookingDate(Date bookingDate) {
		this.bookingDate = bookingDate;
	}

	public int getTimeNo() {
		return timeNo;
	}

	public void setTimeNo(int timeNo) {
		this.timeNo = timeNo;
	}

	public String getTimeDay() {
		return timeDay;
	}

	public void setTimeDay(String timeDay) {
		this.timeDay = timeDay;
	}

	public String getTimeHour() {
		return timeHour;
	}

	public void setTimeHour(String timeHour) {
		this.timeHour = timeHour;
	}

}
