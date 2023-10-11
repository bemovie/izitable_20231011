package com.izitable.dao;

import java.util.List;

import com.izitable.model.Pager;
import com.izitable.model.Booking;

public interface BookingDao {

	void add(Booking item);

	List<Booking> userBookingList(int userNo);

	void userBookingDelete(int bookingNo);

	List<Booking> shopBookingList(int shopNo);

	void shopBookingUpdate(int shopNo);

	void shopBookingDelete(int shopNo);

}
