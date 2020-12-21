package com.project.petpal.store.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.petpal.member.model.vo.Member;
import com.project.petpal.payment.model.vo.Cart;
import com.project.petpal.store.model.service.StoreService;
import com.project.petpal.store.model.vo.Product;
import com.project.petpal.store.model.vo.ProductImg;
import com.project.petpal.store.model.vo.Qna;
import com.project.petpal.store.model.vo.Review;
import com.project.petpal.store.model.vo.Stock;

import net.sf.json.JSONArray;

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
				//장바구니 있으면 수량만 추가하기
				Map m=new HashMap();
				m.put("memberNo",loginMember.getMemberNo());
				m.put("stockNo",stockNo[i]);
				System.out.println("상품"+stockNo[i]);
				//장바구니 있는지 확인
				Cart c=service.selectCartOne(m);
				if(c!=null) {//이미 있는 장바구니라면
					System.out.println("장바구니에 있는 상품");
					m.put("cnt",c.getCount()+Integer.parseInt(cnt[i])); 
					int result=service.updateCartCnt(m);//장바구니에 수량만 업데이트
					System.out.println(result);
				}else {//장바구니가 존재하지 않는다면
					System.out.println("장바구니에 없는 상품");
					m.put("cnt",cnt[i]);
					int result=service.insertCart(m); //장바구니에 인서트
					System.out.println(result);
				}
			};
		};
		//result 확인은 안함! 오류가 나면 프론트에서 처리
		
		
		//비회원이면 쿠키에 저장(배열을 string으로 바꿔서 저장(,구분자))
		//이미 담은 장바구니가 있는지 확인
		String cnts="";
		String stocks="";
		if(cookieStock!=null) {
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
		//쿠키에 저장(공백제거)
		stocks = stocks.replaceAll(" ", "");
		cnts = cnts.replaceAll(" ", "");

		Cookie c=new Cookie("cookieStock",URLEncoder.encode(stocks, "UTF-8"));
		c.setMaxAge(60 * 60 * 24); //쿠키 하루 유지
		response.addCookie(c); //쿠키 추가
		Cookie c2=new Cookie("cookieCnt",URLEncoder.encode(cnts, "UTF-8"));
		c2.setMaxAge(60 * 60 * 24);
		response.addCookie(c2);
		
//		System.out.println("최종쿠키");
//		System.out.println(URLDecoder.decode(c.getValue(),"UTF-8"));
//		System.out.println(URLDecoder.decode(c2.getValue(),"UTF-8"));
		return path;
	}
	
	@RequestMapping("/store/movePayLogin.do")
	public String movePayLogin() {
		return "store/storeAjax/payLoginModal";
	}
	
	@RequestMapping("/store/moveReview.do")
	public String moveReview(String productNo,String detailNo,Model m) {
		Product p=service.selectProduct(productNo);
		ProductImg pi=service.selectMainImg(productNo);
		Stock s=service.selectStock(detailNo);
		m.addAttribute("product",p);
		m.addAttribute("img",pi);
		m.addAttribute("detailNo",detailNo);
		m.addAttribute("stock",s);
		return "store/storeAjax/reviewModal";
	}
	
	@RequestMapping("/store/payCheck.do")
	@ResponseBody
	public List<String> payCheck(HttpSession session,String productNo) {
		//2주안에 구매내역이 있는지(몇개인지) -> 그 중 리뷰 안쓴 건 몇개인지 찾기~~
		Member loginMember=(Member)session.getAttribute("loginMember");
		Map m=new HashMap();
		m.put("productNo", productNo);
		m.put("memberNo",loginMember.getMemberNo());
		List<String> list=service.payCheck(m); //2주안에 구매한 것 중 리뷰 쓰지 않은 구매내역의 결제상세번호들
		return list;
	}
	
	@RequestMapping("/store/moveReviewSelect.do")
	public String moveReviewSelect(HttpSession session,String productNo,String details,Model m) {
		//상품이름, 구매한 옵션, 이미지
		
		Product p=service.selectProduct(productNo);
		ProductImg pi=service.selectMainImg(productNo);
		m.addAttribute("product",p);
		m.addAttribute("img",pi);
		
		List<String> detailNoList = JSONArray.fromObject(details);//리뷰안쓴 디테일 번호들
		List<Stock> stockList=new ArrayList<Stock>();
		for(String s:detailNoList) {
			stockList.add(service.selectStock(s));
		}
		m.addAttribute("detailNoList",detailNoList);
		m.addAttribute("stockList",stockList);
	 
		return "store/storeAjax/reviewSelectModal";
	}
	
	@RequestMapping("/store/moveReviewEdit.do")
	public String moveReviewEdit(String productNo,String reviewNo,Model m) {
		//리뷰 수정 모달
		//상품 이미지 이름, 상품 이름, 재고 옵션 이름, 리뷰 객체
		Product p=service.selectProduct(productNo);
		List<ProductImg> list=service.selectImg(productNo);
		
		//재고 이름(컬러사이즈)포함된 리뷰 객체
		Review r=service.selectReviewOne(reviewNo);
		
		m.addAttribute("product",p);
		m.addAttribute("img",list.get(0));
		m.addAttribute("review",r);
		return "store/storeAjax/reviewEditModal";
	}

	@RequestMapping("/store/moveQna.do")
	public String moveQna(String productNo,Model m) {
		//문의 모달로 이동
		//필요한 것: 상품번호, 상품이름, 상품대표이미지
		Product p=service.selectProduct(productNo);
		ProductImg pi=service.selectMainImg(productNo);
		m.addAttribute("product",p);
		m.addAttribute("img",pi);
		return "store/storeAjax/qnaModal";
	}
	
	@RequestMapping("/store/moveQnaEdit.do")
	public String moveQnaEdit(String productNo,String qnaNo,Model m) {
		//문의 수정 모달로 이동
		//필요한 것:상품 번호, 상품이름, 상품대표이미지, 문의객체
		Product p=service.selectProduct(productNo);
		ProductImg pi=service.selectMainImg(productNo);
		Qna qna=service.selectQnaOne(qnaNo);
		m.addAttribute("product",p);
		m.addAttribute("img",pi);
		m.addAttribute("qna",qna);
		return "store/storeAjax/qnaEditModal";
	}
	
	
}
