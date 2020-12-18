package com.project.petpal.payment.model.service;

import com.project.petpal.payment.model.vo.Payment;

public interface PaymentService {
	int insertPayment(Payment p, int[] cnt, String[] stockNo);
}
