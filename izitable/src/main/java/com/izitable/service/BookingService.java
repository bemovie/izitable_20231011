package com.izitable.service;

import java.util.List;

import com.izitable.model.Booking;

public interface BookingService {

	void add(Booking item);

	List<Booking> userBookingList(int userNo);

	void userBookingDelete(int bookingNo);

	List<Booking> shopBookingList(int shopNo);

	void shopBookingUpdate(int shopNo);

	void shopBookingDelete(int shopNo);

}
