package com.izitable.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.izitable.model.Booking;
import com.izitable.model.Shop;
import com.izitable.service.BookingService;
import com.izitable.service.ShopService;

@Controller
@RequestMapping("/booking")
public class BookingController {

	final String path = "booking/";
	
	@Autowired
	BookingService bookingservice;
	
	@Autowired
	ShopService shopService;
	
	//매장 상세정보
	@GetMapping("/{shopNo}")
	String item(@PathVariable int shopNo, Model model) {
		Shop item = shopService.item(shopNo);
		
		model.addAttribute("info", item);
		
		return "shop/shopList";
	}
	
	//예약 추가
	@PostMapping("/add")
     String add(Booking item) {
		bookingservice.add(item);
		
		return "booking/confirm";
	}
	
}
