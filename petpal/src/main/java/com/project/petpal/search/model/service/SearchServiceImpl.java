package com.project.petpal.search.model.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.petpal.search.model.dao.SearchDao;
import com.project.petpal.store.model.vo.Product;

@Service
public class SearchServiceImpl implements SearchService {

	@Autowired
	private SearchDao dao;
	
	@Autowired
	private SqlSession session;

	@Override
	public List<Product> searchProduct(String keyword) {
		return dao.searchProduct(session,keyword);
	}
}
