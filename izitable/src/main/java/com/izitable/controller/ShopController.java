package com.izitable.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.izitable.model.Booking;
import com.izitable.model.Pager;
import com.izitable.model.Shop;
import com.izitable.model.ShopTable;
import com.izitable.model.ShopTime;
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
	String shopBookingList(@PathVariable int shopNo, Pager pager, Model model) {
		
		int total = (int) bookingService.totalShop(shopNo);
		pager.setTotal(total);
		model.addAttribute("pager", pager);
		
		List<Booking> list = bookingService.shopBookingList(shopNo);		
		
		model.addAttribute("list", list);
		
		model.addAttribute("shopNo", shopNo);
		
		return path + "shopBookingList";
	}
	
	//매장 페이지 예약 수정
	@PostMapping("/booking/{shopNo}/update/{bookingNo}")
	String shopBookingUpdate(@PathVariable int shopNo, @PathVariable int bookingNo, Booking booking, Model model) {
		booking.setShopNo(shopNo);
		booking.setBookingNo(bookingNo);
		bookingService.shopBookingUpdate(booking);
		
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
	String shopSetting(@PathVariable int shopNo, ShopTime shopTm, ShopTable shopTb, Model model, String timeDay, Pager pager) {
		if (timeDay != null) shopTm.setTimeDay(timeDay);
		else shopTm.setTimeDay("2");
		
		shopTm.setShopNo(shopNo);
		shopTb.setShopNo(shopNo);
		
		List<Shop> timelist = shopService.shopSettingTimeList(shopTm);
		List<Shop> tablelist = shopService.shopSettingTableList(shopTb);
		
		model.addAttribute("timelist", timelist);
		model.addAttribute("tablelist", tablelist);
		
		return path + "shopSetting";
	}
	
	//매장 시간대 등록
	@PostMapping("/setting/{shopNo}/addtime")
	String shopSettingTimeAdd(@PathVariable int shopNo, ShopTime shopTm) {
		shopTm.setShopNo(shopNo);
		shopService.shopSettingTimeAdd(shopTm);
		
		return "redirect:.";
	}
	
	//매장 시간대 삭제
	@GetMapping("/setting/{shopNo}/deleteTime/{timeNo}")
	String shopSettingTimeDel(@PathVariable int shopNo, @PathVariable int timeNo) {
		
		shopService.shopSettingTimeDel(timeNo);
		
		return "redirect:../";
	}
	
	//매장 테이블 등록
	@PostMapping("/setting/{shopNo}/addtable")
	String shopSettingTableAdd(@PathVariable int shopNo, ShopTable shopTb) {
		shopTb.setShopNo(shopNo);
		shopService.shopSettingTableAdd(shopTb);
		
		return "redirect:.";
	}
	
	//매장 테이블 삭제
	@GetMapping("/setting/{shopNo}/deleteTable/{tableNo}")
	String shopSettingTableDel(@PathVariable int shopNo, @PathVariable int tableNo) {
		
		shopService.shopSettingTableDel(tableNo);
		
		return "redirect:../";
	}

}
