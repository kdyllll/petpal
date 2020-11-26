package com.project.petpal.payment.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class PaymentCompleteController {
	@RequestMapping("/payment/paymentComplete.do")
	public String paymentComplete() {
		return "/payment/paymentComplete";
	}
	
	@RequestMapping("/payment/payment.do")
	public String payment() {
		return "/payment/payment";
	}

	@RequestMapping("/payment/myPayment.do")
	public String mypayment() {
		return "/payment/myPayment";
	}
}
