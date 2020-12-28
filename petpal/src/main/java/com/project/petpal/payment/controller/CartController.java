package com.project.petpal.payment.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.List;
import java.util.StringTokenizer;

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
import com.project.petpal.payment.model.vo.Cart;

@Controller
public class CartController {
	
	@Autowired
	private CartService service;
	
	@RequestMapping("/cart/cart.do")
	public ModelAndView cart(ModelAndView mv, HttpServletRequest request, HttpSession session, HttpServletResponse response) throws UnsupportedEncodingException{
		
		
		// 쿠키값 가져오기
	    Cookie[] cookie = request.getCookies() ;
	   
		String[] cart = new String[cookie.length];
		
		List<String> stockNo = new ArrayList<String>();
		List<String> amount = new ArrayList<String>();
		
		if(cookie.length>1) {
		    for(int i=1;i<cookie.length;i++){
		    	cart[i] = URLDecoder.decode(cookie[i].getValue(),"UTF-8");
		    }
			
		    StringTokenizer st1 = new StringTokenizer(cart[1], ",");
		    StringTokenizer st2 = new StringTokenizer(cart[2], ",");
		    
		    
		    while(st1.hasMoreTokens()) {
		    	stockNo.add(st1.nextToken());
		    }
		    while(st2.hasMoreTokens()) {
		    	amount.add(st2.nextToken());
		    }
		    
		}
	    ArrayList list = new ArrayList();
	    
		if((Member)session.getAttribute("loginMember")!=null) {
			Member loginMember=(Member)session.getAttribute("loginMember");
			
			String memberNo = loginMember.getMemberNo();
//			String memberNo = "63";
			mv.addObject("list", service.cartList(memberNo));
			
			if((service.cartList(memberNo)).isEmpty()) {
				mv.setViewName("cart/cartEmpty");
			}else {
				mv.setViewName("cart/cart");
			}
		}else {
			//먼저 쿠키에 값이 있는지 없는지 검사하고 값이 있을 때 쿼리 실행
			//값이 없으면 빈 리스트를 넘겨주어야하니 list만 넘김
			
			if(stockNo.size() > 0) {
				for(int i=0;i<stockNo.size();i++) {
					mv.addObject("list", service.cartListNonMember(stockNo));
					mv.addObject("amount", amount);
					System.out.println(service.cartListNonMember(stockNo));
				}
				mv.setViewName("cart/cartNonMember");
			}else {
				mv.setViewName("cart/cartEmpty");
			}
		}
		return mv;
	}

}
