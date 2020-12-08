package com.project.petpal.store.controller;

import java.util.Arrays;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.petpal.member.model.vo.Member;
import com.project.petpal.store.model.service.StoreService;

@Controller
public class StoreAjaxController {

	@Autowired
	private StoreService service;
	
	@RequestMapping("/store/insertCart.do")
	public String insertCart(HttpSession session,HttpServletRequest request,String[] stockNo,String[] cnt) {
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
		Cookie[] cookies = request.getCookies();
		
		String cnts="";
		String stocks="";
		for (Cookie cookie : cookies) {
			//이미 담겨진 쿠키 값 가져오기(문자열)
			if(cookie.getName().equals("stockNo")) {
				stocks=cookie.getValue();
			}
			if(cookie.getName().equals("cnt")) {
				cnts=cookie.getValue();
			}
		}
		//새로 넣는 장바구니 값 배열을 문자열로 변환
		String stocks2=Arrays.toString(stockNo);
		stocks2=stocks2.substring(stocks2.indexOf("[")+1,stocks2.indexOf("]"));
		String cnts2=Arrays.toString(cnt);
		cnts2=cnts2.substring(cnts2.indexOf("[")+1,cnts2.indexOf("]"));
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
		System.out.println(stocks);
		System.out.println(cnts);
		Cookie c=new Cookie("stockNo",stocks);
		Cookie c2=new Cookie("cnt",cnts);
		
		return path;
	}
	
	
}
