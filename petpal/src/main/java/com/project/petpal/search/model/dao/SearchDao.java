package com.project.petpal.search.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.project.petpal.store.model.vo.Product;

public interface SearchDao {
	List<Product> searchProduct(SqlSession session,String keyword);

}
