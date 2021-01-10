package com.project.petpal.search.model.service;

import java.util.List;
import java.util.Map;

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
	public List<Product> searchProduct(String[] keywords) {
		return dao.searchProduct(session,keywords);
	}

	@Override
	public List<Product> searchSoldOutList(String[] keywords) {
		return dao.searchSoldOutList(session,keywords);
	}

	@Override
	public int searchProductCount(String[] keywords) {
		return dao.searchProductCount(session,keywords);
	}

	@Override
	public int searchSoldOutProductCount(String[] keywords) {
		return dao.searchSoldOutProductCount(session,keywords);
	}


}
