package com.project.petpal.payment.model.dao;

import java.util.List;

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
}
