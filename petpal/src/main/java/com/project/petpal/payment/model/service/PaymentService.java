package com.project.petpal.payment.model.service;

import java.util.List;
import java.util.Map;

import com.project.petpal.payment.model.vo.Payment;

public interface PaymentService {
	int insertPayment(Payment p, int[] cnt, String[] stockNo);
	List<Map> selectPaymentCompleteList(String orderNo);
}
