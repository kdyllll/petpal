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
	public List<Product> searchProduct(Map<String,String[]> key) {
		for(String a:key.get("keywords")) {
			System.out.println(a);
		}
		String[] a= {"애견 안전문","강아지 댕냥쿠션"};
		//return dao.searchProduct(session, key);
		return dao.aProduct(session,a);
	}


}
