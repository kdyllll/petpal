package com.project.petpal.payment.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.project.petpal.payment.model.vo.PayDetail;
import com.project.petpal.payment.model.vo.Payment;

@Repository
public class PaymentDaoImpl implements PaymentDao {

	@Override
	public int insertPayment(SqlSession session, Payment p) {
		return session.insert("payment.insertPayment", p);
	}

	@Override
	public int insertPayDetail(SqlSession session, PayDetail pd) {
		return session.insert("payment.insertPayDetail", pd);
	}

	@Override
	public List<Map> selectPaymentCompleteList(SqlSession session, String orderNo) {
		return session.selectList("payment.selectPaymentCompleteList", orderNo);
	}

	@Override
	public String selectPaymentNo(SqlSession session, String orderNo) {
		return session.selectOne("payment.selectPaymentNo", orderNo);
	}

	@Override
	public List<String> selectStockNo(SqlSession session, String paymentNo) {
		return session.selectList("payment.selectStockNo", paymentNo);
	}

	@Override
	public int deleteCart(SqlSession session, String stockNo, String memberNo) {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("stockNo", stockNo);
		map.put("memberNo", memberNo);
		
		return session.delete("payment.deleteCart", map);
	}

	@Override
	public String selectStock(SqlSession session, String stockNo) {
		return session.selectOne("payment.selectStock", stockNo);
	}

	@Override
	public int selectPoint(SqlSession session, String memberNo) {
		return session.selectOne("payment.selectPoint", memberNo);
	}

	@Override
	public List<Map> selectAddress(SqlSession session, String memberNo) {
		return session.selectList("payment.selectAddress", memberNo);
	}

}
