package com.izitable.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.izitable.model.User;
import com.izitable.model.Pager;
import com.izitable.model.Booking;
import com.izitable.service.UserService;
import com.izitable.service.BookingService;

@Controller
@RequestMapping("/user")
public class UserController {
	final String path = "user/";
	
	@Autowired
	UserService userService;
	
	@Autowired
	BookingService bookingService;
	
	//회원 정보 변경
	@GetMapping("/update/{userNo}")
	String update(@PathVariable int userNo, Model model) {
		
		User item = userService.item(userNo);
		
		model.addAttribute("item", item);
		
		return path + "userUpdate";
	}
	
	//회원 정보 변경
	@PostMapping("/update/{userNo}")
	String update(User item) {
		
		userService.update(item);
		
		return "redirect:./{userNo}";
	}
	
	//회원 페이지 예약 목록
	@GetMapping("/booking/{userNo}")
	String userBookingList(@PathVariable int userNo, Model model) {
		
		List<Booking> list = bookingService.userBookingList(userNo);
		
		model.addAttribute("list", list);
		
		model.addAttribute("userNo", userNo);
		
		return path + "userBookingList";
	}
	
	//회원 페이지 예약 삭제
	@GetMapping("/booking/{userNo}/delete/{bookingNo}")
	String userBookingDelete(@PathVariable int userNo, @PathVariable int bookingNo, Model model) {
		
		bookingService.userBookingDelete(bookingNo);
		
		//return path + "bookingList";
		return "redirect:../";
	}

}
