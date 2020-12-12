package com.project.petpal.payment.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.project.petpal.payment.model.service.CartService;

@Controller
public class CartController {
	
	@Autowired
	private CartService service;
	
	@RequestMapping("/cart/cart.do")
	public ModelAndView cart(ModelAndView mv) {
		String memberNo = "63";
		mv.addObject("list", service.cartList(memberNo));
		mv.setViewName("cart/cart");
		
		return mv;
	}

}
