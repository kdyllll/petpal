package com.project.petpal.payment.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.project.petpal.payment.model.service.PaymentService;
import com.project.petpal.payment.model.vo.Cart;
import com.project.petpal.payment.model.vo.PayDetail;
import com.project.petpal.payment.model.vo.Payment;

@Controller
public class PaymentController {
	
	@Autowired
	private PaymentService service;
	
	@RequestMapping("/payment/payment.do")
	public ModelAndView payment(ModelAndView mv, String memberNo,
								@RequestParam(value="productName") String[] productName,
								@RequestParam(value="size") String[] size,
								@RequestParam(value="color") String[] color,
								@RequestParam(value="count") int[] count,
								@RequestParam(value="price") int[] price,
								@RequestParam(value="stockNo") String[] stockNo,
								@RequestParam(value="click") String[] click) {
		
		int totalPrice = 0;
		
		for(int i=0;i<price.length;i++) {
			if(click[i].equals("1")) {
				totalPrice = totalPrice + (count[i] * price[i]);
			}
		}
		
		List list = new ArrayList();
		
		Cart c = Cart.builder().build();
		
		for(int i=0; i<count.length;i++) {
			if(click[i].equals("1")) {
				c = Cart.builder().productName(productName[i]).productSize(size[i]).color(color[i]).count(count[i]).price(count[i] * price[i]).totalPrice(totalPrice).stockNo(stockNo[i]).build();
				list.add(c);
			}
		}
	
		mv.addObject("list", list);
		
		return mv;
	}

	@RequestMapping("/payment/paymentComplete.do")
	public ModelAndView paymentComplete(ModelAndView mv, HttpServletRequest request, HttpServletResponse response,
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
		
		String memberNo = "63";
		
		loc = loc + " " + locDetail;
		
		Payment p = Payment.builder().memberNo(memberNo).receiverName(receiverName).loc(loc).receiverTel(receiverTel).name(name).email(email).tel(tel).totalPrice(totalPrice).payKind(payKind).build();
		
		mv.addObject("list", service.insertPayment(p, cnt, stockNo));
		
		mv.setViewName("payment/paymentComplete");
		
		return mv;
	}
	
	@RequestMapping("/payment/myPayment.do")
	public String mypayment() {
		return "/payment/myPayment";
	}
	
	@RequestMapping("/payment/paymentComplete2.do")
	public String com() {
		return "/payment/paymentComplete2";
	}
}
