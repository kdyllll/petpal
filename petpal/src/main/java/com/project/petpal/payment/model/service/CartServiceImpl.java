package com.project.petpal.payment.model.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.petpal.payment.model.dao.CartDao;

@Service
public class CartServiceImpl implements CartService {

	@Autowired
	private SqlSession session;
	
	@Autowired
	private CartDao dao;
	
	@Override
	public List<Map> cartList(String memberNo) {
		return dao.cartList(session, memberNo);
	}

	@Override
	public List<Map> cartListNonMember(List<String> stockNo) {
		return dao.cartListNonMember(session, stockNo);
	}

}
