package com.project.petpal.payment.model.service;

import java.util.List;
import java.util.Map;

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
	public int insertPayment(Payment p, int[] cnt, String[] stockNo, String payDetailStatus) {
		int result = dao.insertPayment(session, p);

		if (result > 0) {
			for (int i = 0; i < cnt.length; i++) {
				PayDetail pd = PayDetail.builder().paymentNo(p.getPaymentNo()).stockNo(stockNo[i]).cnt(cnt[i]).detailStatus(payDetailStatus).build();
				result = dao.insertPayDetail(session, pd);
			}
		}
		if(result > 0) {
			if(p.getMemberNo()!=null) {
				String memberNo = p.getMemberNo();
				int point = p.getPoint();
				result = dao.updateMemberPoint(session, point, memberNo);
			}
		}
		return result;
	}

	@Override
	public List<Map> selectPaymentCompleteList(String orderNo) {
		return dao.selectPaymentCompleteList(session, orderNo);
	}

	@Override
	public String selectPaymentNo(String orderNo) {
		return dao.selectPaymentNo(session, orderNo);
	}

	@Override
	public List<String> selectStockNo(String paymentNo) {
		return dao.selectStockNo(session, paymentNo);
	}

	@Override
	public int deleteCart(String stockNo, String memberNo) {
		return dao.deleteCart(session, stockNo, memberNo);
	}

	@Override
	public String selectStock(String stockNo) {
		return dao.selectStock(session, stockNo);
	}

	@Override
	public int selectPoint(String memberNo) {
		return dao.selectPoint(session, memberNo);
	}

	@Override
	public List<Map> selectAddress(String memberNo) {
		return dao.selectAddress(session, memberNo);
	}

	@Override
	public List<Map> selectProduct(String stockNo) {
		return dao.selectProduct(session, stockNo);
	}
}
