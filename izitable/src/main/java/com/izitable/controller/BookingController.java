package com.izitable.controller;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.izitable.model.Booking;
import com.izitable.model.Shop;
import com.izitable.model.ShopTime;
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
		
		return path + "confirm";
	}
	
	//예약 페이지 이동
	@GetMapping("/shop/{shopNo}")
	String booking(@PathVariable int shopNo, Shop shop, Model model) {
		
		shopService.item(shopNo);
		
		model.addAttribute("shop", shop);
		
		return path + "booking";
	}
	
	//날짜 - 영업시간
	@PostMapping("/date")
	@ResponseBody
	List<ShopTime> date(ShopTime shopTime) {
		List<ShopTime> list = bookingservice.bookingTimeList(shopTime);
		
//		for (int i = 0; i < list.size(); i++) {
//			if (list.get(i).get == 2) {
//				
//			}
//			
//		}
		
		return list;
	}
	
}
