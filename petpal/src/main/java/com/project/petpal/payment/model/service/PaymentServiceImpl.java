package com.project.petpal.payment.model.service;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.petpal.payment.model.dao.PaymentDao;
import com.project.petpal.payment.model.vo.PayDetail;
import com.project.petpal.payment.model.vo.Payment;

@Service
public class PaymentServiceImpl implements PaymentService {

	@Autowired
	private PaymentDao dao;

	@Autowired
	private SqlSession session;

	@Override
	public int insertPayment(Payment p, int[] cnt, String[] stockNo) {
		int result = dao.insertPayment(session, p);

		if (result > 0) {
			for (int i = 0; i < cnt.length; i++) {
				PayDetail pd = PayDetail.builder().paymentNo(p.getPaymentNo()).stockNo(stockNo[i]).cnt(cnt[i]).build();
				result = dao.insertPayDetail(session, pd);
			}
		}
		return result;
	}
}
