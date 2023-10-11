package com.izitable.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.izitable.model.Pager;
import com.izitable.model.Shop;
import com.izitable.model.User;
import com.izitable.service.BookingService;
import com.izitable.service.ShopService;
import com.izitable.service.UserService;

@Controller
@RequestMapping("/admin")
public class AdminController {
	
	final String path = "admin/";
	
	@Autowired
	UserService userService;
	
	@Autowired
	ShopService shopService;
	
	@Autowired
	BookingService bookingService;
	
	//회원 목록
	@GetMapping("/userlist")
	String userList(Model model, Pager pager) {
		List<User> list = userService.list(pager);
		
		model.addAttribute("list", list);
		
		return path + "userList";
	}
	
	//회원 추가
	@GetMapping("/useradd")
	String add() {
		return path + "userAdd";
	}
	
	@PostMapping("/useradd")
	String add(User item) {
		userService.add(item);
		return "redirect:userlist";
	}
		
	//회원 정보 변경
	@PostMapping("/userupdate/{userNo}")
	String update(@PathVariable int userNo, User item) {
		item.setUserNo(userNo);
		
		userService.update(item);
		
		return "redirect:../userlist";
	}
	
	//회원 삭제
	@GetMapping("/userdelete/{userNo}")
	String delete(@PathVariable int userNo) {
		userService.delete(userNo);
		
		return "redirect:../userlist";
	}
	
	//매장 목록
	@GetMapping("/shoplist")
	String shopList(Model model, Pager pager) {
		List<Shop> list = shopService.list_admin(pager);
		
		model.addAttribute("list", list);
		
		return path + "shopList";
	}

}
