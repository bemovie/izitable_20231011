package com.izitable.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.izitable.dao.BookingDao;
import com.izitable.model.Pager;
import com.izitable.model.Booking;

@Service
public class BookingServiceImpl implements BookingService {

	@Autowired
	BookingDao dao;

	@Override
	public void add(Booking item) {
        dao.add(item);		
	}

	@Override
	public List<Booking> userBookingList(int userNo) {
		return dao.userBookingList(userNo);
	}

	@Override
	public void userBookingDelete(int bookingNo) {
		dao.userBookingDelete(bookingNo);
	}

	@Override
	public List<Booking> shopBookingList(int shopNo) {
		return dao.shopBookingList(shopNo);
	}

	@Override
	public void shopBookingUpdate(int shopNo) {
		dao.shopBookingUpdate(shopNo);
	}

	@Override
	public void shopBookingDelete(int shopNo) {
		dao.shopBookingDelete(shopNo);
	}

}
