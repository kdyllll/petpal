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
	public List<Product> searchProduct(SqlSession session, Map<String,String[]> key) {
		for(String a:key.get("keywords")) {
			System.out.println(a);
		}
		//return session.selectList("store.searchProduct");
		return new ArrayList<Product>();
	}

	@Override
	public List<Product> aProduct(SqlSession session, String[] apple) {
		// TODO Auto-generated method stub
		List<Product> list=session.selectList("store.aProduct",apple);
		System.out.println("list"+list);
		return list;
	}

}
