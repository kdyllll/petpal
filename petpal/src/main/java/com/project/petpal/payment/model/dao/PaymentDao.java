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
}
