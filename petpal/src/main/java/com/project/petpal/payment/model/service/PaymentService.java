package com.project.petpal.payment.model.service;

import java.util.List;
import java.util.Map;

import com.project.petpal.payment.model.vo.Payment;

public interface PaymentService {
	int insertPayment(Payment p, int[] cnt, String[] stockNo);
	List<Map> selectPaymentCompleteList(String orderNo);
	String selectPaymentNo(String orderNo);
	List<String> selectStockNo(String paymentNo);
	int deleteCart(String stockNo, String memberNo);
	String selectStock(String stockNo);
	int selectPoint(String memberNo);
	List<Map> selectAddress(String memberNo);
	List<Map> selectProduct(String stockNo);
}
