package com.project.petpal.payment.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

public interface CartDao {
	List<Map> cartList(SqlSession session, String memberNo);
}
