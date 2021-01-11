package com.project.petpal.payment.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
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
	    
	  //StringTokenizer할 배열 생성
		String[] cart = new String[cookie.length];
		
		//jsp로 넘길 재고번호, 수량 저장시켜 놓을 리스트
		List<String> stockNo = new ArrayList<String>();
		List<String> amount = new ArrayList<String>();
		
		//쿠키가 있을 때 실행
		if(cookie.length>1) {
			//쿠키에서 값을 가져와 cart배열에 넣어줌
			//index 0의 값은 session id이므로 index 1에서 부터 시작
		    for(int i=1;i<cookie.length;i++){
		    	cart[i] = URLDecoder.decode(cookie[i].getValue(),"UTF-8");
		    }
			
		    //cart배열에서 ","을 기준으로 값을 잘라줌
		    StringTokenizer st1 = new StringTokenizer(cart[1], ",");
		    StringTokenizer st2 = new StringTokenizer(cart[2], ",");
		    
		    //자른 값을 각각 stockNo와 amount 리스트에 넣어줌
		    while(st1.hasMoreTokens()) {
		    	stockNo.add(st1.nextToken());
		    }
		    while(st2.hasMoreTokens()) {
		    	amount.add(st2.nextToken());
		    }
			
			//기존에 있던 쿠키에 이미 재고번호가 다시 쿠키로 들어오면 동일한 값을 찾아서 그 값에 해당하는 수량을 원래 상품 수량에 합치고 나중에 들어온 재고번호 쿠키를 삭제함
			for(int i=0;i<stockNo.size();i++) {
				for(int j=0;j<amount.size();j++) {
					if(i!=j) {
						if(stockNo.get(i).equals(stockNo.get(j))) {
							int c = Integer.parseInt(amount.get(i)) + Integer.parseInt(amount.get(j));
							amount.set(i, Integer.toString(c));
							stockNo.remove(j);
							amount.remove(j);
						}
					}
				}
			}
			
			for(int i=0;i<cookie.length;i++) {
				cookie[i].setMaxAge(0);
			}
			
			//쿠키에 담을 String 변수
			String stocks = "";
			String amounts = "";
			
			//쿠키용 String 변수에 값을 넣어줌
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
		
			//쿠키 생성
			Cookie c=new Cookie("cookieStock",URLEncoder.encode(stocks, "UTF-8"));
			c.setMaxAge(60 * 60 * 24); //쿠키 하루 유지
			c.setPath("/");//모든 곳에서 사용할 수 있게
			response.addCookie(c); //쿠키 추가
			Cookie c2=new Cookie("cookieCnt",URLEncoder.encode(amounts, "UTF-8"));
			c2.setMaxAge(60 * 60 * 24);
			c2.setPath("/");
			response.addCookie(c2);
		}
		
		
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
			
				List<Map> list = service.cartListNonMember(stockNo);
				mv.addObject("list", service.cartListNonMember(stockNo));
				
				HashMap<String, String> map = new HashMap<String, String>();
				for(int i=0;i<stockNo.size();i++) {
					map.put(stockNo.get(i), amount.get(i));
				}
				
				mv.addObject("amount", map);
				
				if(list.isEmpty()) {
					mv.setViewName("cart/cartEmpty");
				}else {
					mv.setViewName("cart/cartNonMember");
				}
		}
		return mv;
	}
	
	@RequestMapping("/cart/deleteCart.do")
	@ResponseBody
	public int deleteCart(ModelAndView mv, HttpServletRequest request, HttpSession session, HttpServletResponse response, String[] deleteCart) throws UnsupportedEncodingException {
		
		int result = 0;
		
		if((Member)session.getAttribute("loginMember")!=null) {
			//회원 용 로직
			
			Member loginMember=(Member)session.getAttribute("loginMember");
			String memberNo = loginMember.getMemberNo();
			
			HashMap<String, String> map = new HashMap<String, String>();
			for(int i=0;i<deleteCart.length;i++) {
				map.put("stockNo", deleteCart[i]);
				map.put("memberNo", memberNo);
				result = service.deleteCart(deleteCart[i], memberNo);
			}
			
			
		}else {
			//비회원 용 로직
			
			
			// 쿠키값 가져오기
		    Cookie[] cookie = request.getCookies() ;
		   
		    //StringTokenizer할 배열 생성
			String[] cart = new String[cookie.length];
			
			//jsp로 넘길 재고번호, 수량 저장시켜 놓을 리스트
			List<String> stockNo = new ArrayList<String>();
			List<String> amount = new ArrayList<String>();
			
			//쿠키가 있을 때 실행
			if(cookie.length>1) {
				//쿠키에서 값을 가져와 cart배열에 넣어줌
				//index 0의 값은 session id이므로 index 1에서 부터 시작
			    for(int i=1;i<cookie.length;i++){
			    	cart[i] = URLDecoder.decode(cookie[i].getValue(),"UTF-8");
			    }
				
			    //cart배열에서 ","을 기준으로 값을 잘라줌
			    StringTokenizer st1 = new StringTokenizer(cart[1], ",");
			    StringTokenizer st2 = new StringTokenizer(cart[2], ",");
			    
			    //자른 값을 각각 stockNo와 amount 리스트에 넣어줌
			    while(st1.hasMoreTokens()) {
			    	stockNo.add(st1.nextToken());
			    }
			    while(st2.hasMoreTokens()) {
			    	amount.add(st2.nextToken());
			    }
			}
			
			//removeAll 메소드를 이용하기 위해 배열로 넘어온 deleteCart에 담겨 있는 값을 리스트에 넣어줌
			List<String> deleteList = new ArrayList<String>();
			
			for(int i=0;i<deleteCart.length;i++) {
				deleteList.add(deleteCart[i]);
			}
			
			//새로운 쿠키를 담기 위해 기존 쿠키를 비워줌
			for(int i=0;i<cookie.length;i++) {
				cookie[i].setMaxAge(0);
			}
			
			//stockNo에서 deleteList와 동일한 값을 찾아서 없애줌 
			stockNo.removeAll(deleteList);
			
			//쿠키에 담을 String 변수
			String stocks = "";
			String amounts = "";
			
			//쿠키용 String 변수에 값을 넣어줌
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
			
			//쿠키 생성
			Cookie c=new Cookie("cookieStock",URLEncoder.encode(stocks, "UTF-8"));
			c.setMaxAge(60 * 60 * 24); //쿠키 하루 유지
			c.setPath("/");//모든 곳에서 사용할 수 있게
			response.addCookie(c); //쿠키 추가
			Cookie c2=new Cookie("cookieCnt",URLEncoder.encode(amounts, "UTF-8"));
			c2.setMaxAge(60 * 60 * 24);
			c2.setPath("/");
			response.addCookie(c2);
			
			result = 1;
		}
		
		return result;
	}

}
