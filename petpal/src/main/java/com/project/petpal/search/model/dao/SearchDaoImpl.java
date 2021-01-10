package com.project.petpal.search.model.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.project.petpal.store.model.vo.Product;

@Repository
public class SearchDaoImpl implements SearchDao{

	@Override
	public List<Product> searchProduct(SqlSession session,String[] keywords) {
		return session.selectList("store.searchProduct",keywords);
	}

	@Override
	public List<Product> searchSoldOutList(SqlSession session, String[] keywords) {
		return session.selectList("store.searchSoldOutList",keywords);
	}

	@Override
	public int searchProductCount(SqlSession session, String[] keywords) {
		// TODO Auto-generated method stub
		return session.selectOne("store.searchProductCount",keywords);
	}

	@Override
	public int searchSoldOutProductCount(SqlSession session, String[] keywords) {
		// TODO Auto-generated method stub
		return session.selectOne("store.searchSoldOutProductCount",keywords);
	}


}
