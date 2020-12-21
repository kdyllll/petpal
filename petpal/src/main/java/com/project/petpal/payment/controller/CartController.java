package com.project.petpal.payment.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.project.petpal.member.model.vo.Member;
import com.project.petpal.payment.model.service.CartService;

@Controller
public class CartController {
	
	@Autowired
	private CartService service;
	
	@RequestMapping("/cart/cart.do")
	public ModelAndView cart(ModelAndView mv, HttpServletRequest request, HttpSession session, HttpServletResponse response) throws UnsupportedEncodingException{
		
		Cookie[] cookies = request.getCookies();
		 
		 
	     for(Cookie cookie : cookies){ 
	           String cookieName = cookie.getName();
	           String cookieValue = URLDecoder.decode(cookie.getValue(), "UTF-8");
	           
	           System.out.println(cookieName);
	           System.out.println(cookieValue);
	     }
		
		
		Member loginMember=(Member)session.getAttribute("loginMember");
		
		String memberNo = loginMember.getMemberNo();
		
		mv.addObject("list", service.cartList(memberNo));
		
		List<Map> list = service.cartList(memberNo);
		if(list.isEmpty()) {
			mv.setViewName("cart/cartEmpty");
		}else {
		
		mv.setViewName("cart/cart");
		}
		return mv;
	}

}
