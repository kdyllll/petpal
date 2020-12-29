package com.project.petpal.payment.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.project.petpal.member.model.vo.Member;
import com.project.petpal.payment.model.service.CartService;

@Controller
public class CartController {
	
	@Autowired
	private CartService service;
	
	@RequestMapping("/cart/cart.do")
	public ModelAndView cart(ModelAndView mv, HttpServletRequest request, HttpSession session, HttpServletResponse response) throws UnsupportedEncodingException{
		
		
		// 쿠키값 가져오기
	    Cookie[] cookie = request.getCookies() ;
	    
	    for(int i=0;i<cookie.length;i++){
	    	System.out.println(URLDecoder.decode("이름 : " + cookie[i].getName(),"UTF-8"));
	    	System.out.println(URLDecoder.decode("값 : " + cookie[i].getValue(),"UTF-8"));
	    }
	   
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
				}
				mv.setViewName("cart/cartNonMember");
			}else {
				mv.setViewName("cart/cartEmpty");
			}
		}
		return mv;
	}
	
	@RequestMapping("cart/deleteCart.do")
	@ResponseBody
	public int deleteCart(ModelAndView mv, HttpServletRequest request, HttpSession session, HttpServletResponse response, String[] deleteCart) throws UnsupportedEncodingException {
		
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
		    
		    System.out.println(stockNo);
		    System.out.println(amount);
		}
		
		for(int i=0;i<deleteCart.length;i++) {
			System.out.println(deleteCart[i]);
		}
		
		for(int i=0;i<cookie.length;i++) {
			cookie[i].setMaxAge(0);
		}

		
		//배열값1이랑 리스트 전체 비교하고 배열값2랑 리스트 전체 비교하고 배열값 3이랑 리스트 전체 비교하고 .....
		
		
		for(int i=0;i<stockNo.size();i++) {
			for(int j=0;j<deleteCart.length;j++) {
				if(stockNo.get(i).equals(deleteCart[j])) {
					stockNo.remove(i);
					amount.remove(i);
				}
			}
			System.out.println("현재 남은 쿠키 stockNo : " + stockNo);
			System.out.println("현재 남은 쿠키 amount : " + amount);
		}
		
		String stocks = "";
		String amounts = "";
		
		for(int i=0;i<stockNo.size();i++) {
			if(stocks.equals("")) {
				stocks=stockNo.get(i);
			}else {
				stocks=stocks+","+stockNo.get(i);
			}
			if(amounts.equals("")) {
				amounts=amount.get(i);
			}else {
				amounts=amounts+","+amount.get(i);
			}
		}
		
		Cookie c=new Cookie("cookieStock",URLEncoder.encode(stocks, "UTF-8"));
		c.setMaxAge(60 * 60 * 24); //쿠키 하루 유지
		c.setPath("/");
		response.addCookie(c); //쿠키 추가
		Cookie c2=new Cookie("cookieCnt",URLEncoder.encode(amounts, "UTF-8"));
		c2.setMaxAge(60 * 60 * 24);
		c2.setPath("/");
		response.addCookie(c2);
		
		System.out.println("최종쿠키");
		System.out.println(URLDecoder.decode(c.getValue(),"UTF-8"));
		System.out.println(URLDecoder.decode(c2.getValue(),"UTF-8"));
		
		int result = 0;
		
		
		if((Member)session.getAttribute("loginMember")!=null) {
		}else {
			result = 1;
		}
		
		
		return result;
	}

}
