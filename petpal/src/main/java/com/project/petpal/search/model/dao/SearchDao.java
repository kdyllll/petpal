package com.project.petpal.search.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.project.petpal.store.model.vo.Product;

public interface SearchDao {
	List<Product> searchProduct(SqlSession session,Map<String,String[]> key);
	List<Product> aProduct(SqlSession session,String[] a);
}
