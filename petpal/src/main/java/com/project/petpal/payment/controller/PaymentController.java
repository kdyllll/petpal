package com.project.petpal.payment.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.project.petpal.member.model.vo.Member;
import com.project.petpal.payment.model.service.PaymentService;
import com.project.petpal.payment.model.vo.Cart;
import com.project.petpal.payment.model.vo.Payment;

@Controller
public class PaymentController {
	
	@Autowired
	private PaymentService service;
	
	@RequestMapping("/payment/payment.do")
	public ModelAndView payment(ModelAndView mv, HttpServletRequest request, HttpServletResponse response, HttpSession session,
								String memberNo,
								@RequestParam(value="productName") String[] productName,
								@RequestParam(value="size") String[] size,
								@RequestParam(value="color") String[] color,
								@RequestParam(value="count") int[] count,
								@RequestParam(value="price") int[] price,
								@RequestParam(value="stockNo") String[] stockNo,
								@RequestParam(value="click") String[] click) {
		
		int totalPrice = 0;
		int fee = 0;
		
		for(int i=0;i<price.length;i++) {
			if(click[i].equals("1")) {
				totalPrice = totalPrice + (count[i] * price[i]);
			}
		}
		
		if(totalPrice < 50000) {
			fee = 2500;
			totalPrice += 2500;
		}
		
		List list = new ArrayList();
		
		Cart c = Cart.builder().build();
		
		for(int i=0; i<count.length;i++) {
			if(click[i].equals("1")) {
				c = Cart.builder().productName(productName[i]).productSize(size[i]).color(color[i]).count(count[i]).price(count[i] * price[i]).fee(fee).totalPrice(totalPrice).stockNo(stockNo[i]).build();
				list.add(c);
			}
		}
	
		mv.addObject("list", list);
		
		if((Member)session.getAttribute("loginMember")!=null) {
			mv.setViewName("payment/payment");
		}else {
			mv.setViewName("payment/paymentNonMember");
		}
		return mv;
	}

	@RequestMapping("/payment/paymentComplete.do")
	public ModelAndView paymentComplete(ModelAndView mv, HttpServletRequest request, HttpServletResponse response, HttpSession session,
										@RequestParam(value="stockNo") String[] stockNo,
										@RequestParam(value="totalPrice") int totalPrice,
										@RequestParam(value="cnt") int[] cnt,
										@RequestParam(value="receiverName") String receiverName,
										@RequestParam(value="loc") String loc,
										@RequestParam(value="locDetail") String locDetail,
										@RequestParam(value="receiverTel") String receiverTel,
										@RequestParam(value="name") String name,
										@RequestParam(value="email") String email,
										@RequestParam(value="tel") String tel,
										@RequestParam(value="payKind") String payKind) {
		
		//8자리 난수 생성
		Random rand = new Random();

		String orderNo = Integer.toString(rand.nextInt(8) + 1);

		for(int i=0; i < 7; i++){
			orderNo += Integer.toString(rand.nextInt(9));
		}

		if((Member)session.getAttribute("loginMember")!=null) {
			Member loginMember=(Member)session.getAttribute("loginMember");
			
			String memberNo = loginMember.getMemberNo();
			
			loc = loc + " " + locDetail;
			
			Payment p = Payment.builder().memberNo(memberNo).receiverName(receiverName).loc(loc).receiverTel(receiverTel).name(name).email(email).tel(tel).totalPrice(totalPrice).payKind(payKind).orderNo(orderNo).build();
			
//			mv.addObject("list", service.insertPayment(p, cnt, stockNo));
			
			int result = service.insertPayment(p, cnt, stockNo);
			
			if(result>0) {
				mv.addObject("list", service.selectPaymentCompleteList(orderNo));
			}
			
		}else {
			loc = loc + " " + locDetail;
			
			Payment p = Payment.builder().receiverName(receiverName).loc(loc).receiverTel(receiverTel).name(name).email(email).tel(tel).totalPrice(totalPrice).payKind(payKind).orderNo(orderNo).build();
			
//			mv.addObject("list", service.insertPayment(p, cnt, stockNo));
			
			int result = service.insertPayment(p, cnt, stockNo);
			
			if(result>0) {
				mv.addObject("list", service.selectPaymentCompleteList(orderNo));
			}
		}
		
		System.out.println(payKind);
		if(payKind.equals("신용카드")) {
			mv.setViewName("payment/paymentCompleteCredit");
		}else {
			mv.setViewName("payment/paymentCompleteCash");
		}
		return mv;
	}
	
}
