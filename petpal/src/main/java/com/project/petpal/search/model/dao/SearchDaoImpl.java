package com.project.petpal.search.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.project.petpal.store.model.vo.Product;

@Repository
public class SearchDaoImpl implements SearchDao{

	@Override
	public List<Product> searchProduct(SqlSession session, String keyword) {
		return session.selectList("store.searchProduct",keyword);
	}

}
