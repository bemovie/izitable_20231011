package com.izitable.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.izitable.model.Booking;
import com.izitable.model.Shop;
import com.izitable.model.User;
import com.izitable.service.BookingService;
import com.izitable.service.ShopService;

@Controller
@RequestMapping("/shop")
public class ShopController {
	final String path = "shop/";
	
	@Autowired
	ShopService shopService;
	
	@Autowired
	BookingService bookingService;
	
	//매장 목록 (메인 페이지)
	@GetMapping("/list")
	String list() {
		
		return path + "shopList";
	}
	
	//매장 목록 (필터) 
	@PostMapping("/list")
	String list(Model model, @ModelAttribute("Shop") Shop shop) {
		
		//System.out.println(shop.getCity());
		
		List<Shop> list = shopService.list(shop);
		
		model.addAttribute("list", list);
		
		return path + "shopList";
	}
	
	//매장 상세정보
	@GetMapping("/item/{shopNo}")
	String item(@PathVariable int shopNo, Model model) {
		Shop item = shopService.item(shopNo);
		
		model.addAttribute("info", item);
		
		return path + "shopList";
	}
	
	//매장 정보 변경
	@GetMapping("/update/{shopNo}")
	String update(@PathVariable int shopNo, Model model) {
		
		Shop item = shopService.item(shopNo);
		
		model.addAttribute("item", item);
		
		return path + "shopUpdate";
	}
	
	//매장 정보 변경
	@PostMapping("/update/{shopNo}")
	String update(Shop item) {
		
		shopService.update(item);
		
		return "redirect:./{shopNo}";
	}
	
	//매장 페이지 예약 목록
	@GetMapping("/booking/{shopNo}")
	String shopBookingList(@PathVariable int shopNo, Model model) {
		
		List<Booking> list = bookingService.shopBookingList(shopNo);
		
		model.addAttribute("list", list);
		
		model.addAttribute("shopNo", shopNo);
		
		return path + "shopBookingList";
	}
	
	//매장 페이지 예약 수정
	@GetMapping("/booking/{shopNo}/update/{bookingNo}")
	String shopBookingUpdate(@PathVariable int shopNo, @PathVariable int bookingNo, Model model) {
		
		bookingService.shopBookingUpdate(shopNo);
		
		//return path + "bookingList";
		return "redirect:../";
	}
	
	//매장 페이지 예약 삭제
	@GetMapping("/booking/{shopNo}/delete/{bookingNo}")
	String shopBookingDelete(@PathVariable int shopNo, @PathVariable int bookingNo, Model model) {
		
		bookingService.shopBookingDelete(shopNo);
		
		//return path + "bookingList";
		return "redirect:../";
	}
	
	//매장 설정
	@GetMapping("/setting/{shopNo}")
	String shopSetting(@PathVariable int shopNo, Shop shop, Model model) {
		shop.setShopNo(shopNo);
		List<Shop> timelist = shopService.shopSettingTimeList(shop);
		List<Shop> tablelist = shopService.shopSettingTableList(shop);
		
		model.addAttribute("timelist", timelist);
		model.addAttribute("tablelist", tablelist);
		
		return path + "shopSetting";
	}
	
	//매장 시간대 등록
	@PostMapping("/setting/{shopNo}/addtime")
	String shopSettingTimeAdd(@PathVariable int shopNo, Shop shop) {
		shop.setShopNo(shopNo);
		shopService.shopSettingTimeAdd(shop);
		
		return "redirect:.";
	}
	
	//매장 시간대 등록
	@PostMapping("/setting/{shopNo}/addtable")
	String shopSettingTableAdd(@PathVariable int shopNo, Shop shop) {
		shop.setShopNo(shopNo);
		shopService.shopSettingTableAdd(shop);
		
		return "redirect:.";
	}
	

}
