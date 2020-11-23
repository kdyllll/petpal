package com.project.petpal.payment.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class PaymentCompleteController {
	@RequestMapping("/payment/paymentComplete.do")
	public String paymentComplete() {
		return "/payment/paymentComplete";
	}
}
