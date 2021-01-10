package com.project.petpal.search.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.project.petpal.store.model.vo.Product;

public interface SearchDao {
	List<Product> searchProduct(SqlSession session,String[] keywords);
	List<Product> searchSoldOutList(SqlSession session,String[] keywords);
	int searchProductCount(SqlSession session,String[] keywords);
	int searchSoldOutProductCount(SqlSession session,String[] keywords);
}
