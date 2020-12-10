package com.project.petpal.store.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.petpal.member.model.vo.Member;
import com.project.petpal.store.model.service.StoreService;

@Controller
public class StoreAjaxController {

	@Autowired
	private StoreService service;
	
	@RequestMapping("/store/insertCart.do")
	public String insertCart(HttpSession session,HttpServletResponse response, String[] stockNo,String[] cnt,
			  				@CookieValue(value="cookieStock", required = false) Cookie cookieStock,
			  				@CookieValue(value="cookieCnt", required = false) Cookie cookieCnt) throws UnsupportedEncodingException {
		Member loginMember=(Member)session.getAttribute("loginMember");
		String path="store/storeAjax/cartModal";
		
		//회원이면 테이블에 저장
		if(loginMember!=null) {
			for(int i=0;i<stockNo.length;i++) {
				Map<String,String> m=new HashMap();
				m.put("memberNo",loginMember.getMemberNo());
				m.put("stockNo",stockNo[i]);
				m.put("cnt",cnt[i]);
				int result=service.insertCart(m);
			};
		};
		
		//비회원이면 쿠키에 저장(배열을 string으로 바꿔서 저장(,구분자))
		//이미 담은 장바구니가 있는지 확인
		String cnts="";
		String stocks="";
		if(cookieStock!=null) {
			System.out.println("쿠키존재?");
			stocks=URLDecoder.decode(cookieStock.getValue(),"UTF-8");
		}
		if(cookieCnt!=null) {
			cnts=URLDecoder.decode(cookieCnt.getValue(),"UTF-8");
		}
//		System.out.println("이미 있는 쿠키");
//		System.out.println(stocks);
//		System.out.println(cnts);
		
		//새로 넣는 장바구니 값 배열을 문자열로 변환
		String stocks2=Arrays.toString(stockNo);
		stocks2=stocks2.substring(stocks2.indexOf("[")+1,stocks2.indexOf("]"));
		String cnts2=Arrays.toString(cnt);
		cnts2=cnts2.substring(cnts2.indexOf("[")+1,cnts2.indexOf("]"));
//		System.out.println("새로넣는 장바구니");
//		System.out.println(stocks2);
//		System.out.println(cnts2);
		//이미 있던 장바구니 문자열에 문자열 추가
		if(stocks.equals("")) {
			stocks=stocks2;
		}else {
			stocks=stocks+","+stocks2;
		}
		if(cnts.equals("")) {
			cnts=cnts2;
		}else {
			cnts=cnts+","+cnts2;
		}
		//쿠키에 저장


		Cookie c=new Cookie("cookieStock",URLEncoder.encode(stocks, "UTF-8"));
		c.setMaxAge(60 * 60 * 24); //쿠키 하루 유지
		response.addCookie(c); //쿠키 추가
		Cookie c2=new Cookie("cookieCnt",URLEncoder.encode(cnts, "UTF-8"));
		c2.setMaxAge(60 * 60 * 24);
		response.addCookie(c2);
		
//		System.out.println("최종쿠키");
//		System.out.println(c.getValue());
//		System.out.println(c2.getValue());
		return path;
	}
	
	@RequestMapping("/store/movePayLogin.do")
	public String movePayLogin() {
		return "store/storeAjax/payLoginModal";
	}
	

	
	
}
