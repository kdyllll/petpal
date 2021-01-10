package com.project.petpal.payment.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.project.petpal.payment.model.vo.PayDetail;
import com.project.petpal.payment.model.vo.Payment;

public interface PaymentDao {
	int insertPayment(SqlSession session, Payment p);
	int insertPayDetail(SqlSession session, PayDetail pd);
	List<Map> selectPaymentCompleteList(SqlSession session, String orderNo);
	String selectPaymentNo(SqlSession session, String orderNo);
	List<String> selectStockNo(SqlSession session, String paymentNo);
	int deleteCart(SqlSession session, String stockNo, String memberNo);
	String selectStock(SqlSession session, String stockNo);
	int selectPoint(SqlSession session, String memberNo);
	List<Map> selectAddress(SqlSession session, String memberNo);
	List<Map> selectProduct(SqlSession session, String stockNo);
	int updateMemberPoint(SqlSession session, int point, String memberNo);
}
