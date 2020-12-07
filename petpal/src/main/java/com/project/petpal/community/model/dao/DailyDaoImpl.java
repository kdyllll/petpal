package com.project.petpal.community.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.project.petpal.admin.model.vo.Product;
import com.project.petpal.admin.model.vo.ProductImg;
import com.project.petpal.community.model.vo.Daily;
import com.project.petpal.community.model.vo.DailyCoord;
import com.project.petpal.community.model.vo.DailyImg;

@Repository
public class DailyDaoImpl implements DailyDao {

	@Override
	public int insertDaily(SqlSession session, Daily d) {
		return session.insert("daily.insertDaily",d);
	}

	@Override
	public int insertDailyImg(SqlSession session, DailyImg di) {
		return session.insert("daily.insertDailyImg",di);
	}

	@Override
	public int insertDailyCoords(SqlSession session, DailyCoord dc) {
		return session.insert("daily.insertDailyCoords",dc);
	}
	
	@Override
	public List<Product> selectProductName(SqlSession session, String key) {
		return session.selectList("daily.selectProductName",key);
	}

	@Override
	public String selectProductNo(SqlSession session, String name) {
		return session.selectOne("daily.selectProductNo",name);
	}

	@Override
	public ProductImg selectDailyProduct(SqlSession session, String productNo) {
		return session.selectOne("daily.selectDailyProduct",productNo);
	}

	@Override
	public List<Product> selectProductAll(SqlSession session) {
		return session.selectList("daily.selectProductAll");
	}

	

}
