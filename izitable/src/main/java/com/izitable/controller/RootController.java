package com.izitable.controller;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.izitable.model.Shop;
import com.izitable.model.User;
import com.izitable.service.ShopService;
import com.izitable.service.UserService;

import net.sf.json.JSONObject;

@Controller
public class RootController {
	
	@Autowired
	UserService userService;
	
	@Autowired
	ShopService shopService;
	
	//메인 페이지
	@GetMapping("/")
	String index(HttpSession session, Model model) {
		String msg = (String) session.getAttribute("msg");
		
		if(msg != null) {
			model.addAttribute("msg", msg);
			session.removeAttribute("msg");
		}
		
		return "shop/shopList";
	}
	
	//로그인
	@GetMapping("/login")
	String login() {
		return "login";
	}
	
	@PostMapping("/login")
	String login(User user, Shop shop, HttpSession session) {
		//매장 로그인
		if (shop.getShopEmail() != null) {
			
			Boolean result = shopService.login(shop); //return값을 true, false로 받기 위해 Boolean으로 result 받음
			
			if(result) { //result가 true면 로그인 되었다 => session에 사용자 정보를 저장			
				session.setAttribute("msg", "환영합니다");
				session.setAttribute("shop", shop); //result가 Boolean 타입이므로, item을 받아야 Customer 정보가 담아짐,
			}
			
		}
		//일반 로그인
		else {
		
			Boolean result = userService.login(user); //return값을 true, false로 받기 위해 Boolean으로 result 받음
			
			if(result) { //result가 true면 로그인 되었다 => session에 사용자 정보를 저장			
				session.setAttribute("msg", "환영합니다");
				session.setAttribute("user", user); //result가 Boolean 타입이므로, item을 받아야 Customer 정보가 담아짐,
			}
			
			else {
				session.setAttribute("msg", "로그인에 실패하였습니다");
			}
		}
		
		return "redirect:/";
	}
	
	//로그아웃
	@GetMapping("/logout")
	String logout(HttpSession session) {
		session.invalidate(); //session에 있는 정보 무효화 => 모든 정보가 없어짐
		
		return "redirect:/";
	}
	
	//약관 동의
	@GetMapping("/siteUseAgree")
	String siteUseAgree() {
		return "join/SiteUseAgree";
	}
	
	//회원가입 유형
	@PostMapping("/joinType")
	String joinType() {
		return "join/joinType";
	}
	
	//회원가입 (일반회원)
	@GetMapping("/join/user")
	String joinUser() {
		return "join/joinUser";
	}
	
	//회원가입 (매장)
	@GetMapping("/join/shop")
	String joinShop() {
		return "join/joinShop";
	}
	
	@PostMapping("/join")
	String join(User user, Shop shop) {
		if (user.getUserEmail() != null) userService.add(user);
		else {
			shop.setCompAddr1( shop.getCompAddr1() + " " + shop.getDetailAddr() ); 
			shop.setCompAddr2( shop.getCompAddr2() + " " + shop.getDetailAddr() ); 
			shopService.add(shop);
		}
		
		return "join/joinComplete";
	}

	//아이디 중복체크
	@PostMapping("/join/duplicateCheck")
	public void duplicateCheck(User user, Shop shop, HttpServletRequest request, HttpServletResponse response, Model model) throws Exception {
		String successYn = "Y";
		String message = "성공";
		
		JSONObject jo = new JSONObject();
		response.setContentType("application/json; charset=utf-8"); 
		
		int duplicateCnt = 0;
		if (user.getUserEmail() !=null) duplicateCnt = userService.duplicateCheck(user);
		else duplicateCnt = shopService.duplicateCheck(shop);
		
		if(duplicateCnt > 0) {
			successYn = "N";
			message = "이미 사용중인 이메일입니다.";
		}	
		
		jo.put("successYn", successYn);
		jo.put("message", message);
		
		PrintWriter printwriter = response.getWriter();
		printwriter.println(jo.toString());
		printwriter.flush();
		printwriter.close();
	}
	
	/*
	@ResponseBody //viewResolver한테 줘서 jsp 파일을 찾지 말고, 그대로 client에 보여줘라,
	@GetMapping("/checkId/{custid}")
	String checkId(@PathVariable String custid) {
		if(customerService.item(custid) == null) //true면 ID 사용 가능, false면 사용 불가능
			return "OK";		
		else
			return "FAIL";
	}
	*/
	
	final String path = "shop/";
	
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
	
}
