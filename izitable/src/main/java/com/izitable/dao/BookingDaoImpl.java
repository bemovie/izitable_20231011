package com.izitable.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.izitable.model.Pager;
import com.izitable.model.Booking;

@Repository
public class BookingDaoImpl implements BookingDao {

	@Autowired
	SqlSession sql;
	
	@Override
	public void add(Booking item) {
        sql.insert("booking.add", item);
	}

	@Override
	public List<Booking> userBookingList(int userNo) {
		return sql.selectList("booking.userBookingList", userNo);
	}

	@Override
	public void userBookingDelete(int bookingNo) {
		sql.delete("booking.userBookingDelete", bookingNo);
	}

	@Override
	public List<Booking> shopBookingList(int shopNo) {
		return sql.selectList("booking.shopBookingList", shopNo);
	}

	@Override
	public void shopBookingUpdate(int shopNo) {
		sql.update("booking.shopBookingUpdate", shopNo);
	}

	@Override
	public void shopBookingDelete(int shopNo) {
		sql.delete("booking.userBookingDelete", shopNo);
	}

}
