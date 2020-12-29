package com.project.petpal.payment.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class CartDaoImpl implements CartDao {

	@Override
	public List<Map> cartList(SqlSession session, String memberNo) {
		return session.selectList("cart.cartList", memberNo);
	}

	@Override
	public List<Map> cartListNonMember(SqlSession session, List<String> stockNo) {
		return session.selectList("cart.cartListNonMember", stockNo);
	}

	@Override
	public int deleteCart(SqlSession session, String[] stockNo) {
		return session.delete("cart.deleteCart", stockNo);
	}

}
