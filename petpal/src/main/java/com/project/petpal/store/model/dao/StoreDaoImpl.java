package com.project.petpal.store.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.project.petpal.store.model.vo.Product;
import com.project.petpal.store.model.vo.ProductImg;
import com.project.petpal.store.model.vo.Stock;

@Repository
public class StoreDaoImpl implements StoreDao{

	@Override
	public Product selectProduct(SqlSession session, String productNo) {
		// TODO Auto-generated method stub
		return session.selectOne("store.selectProduct",productNo);
	}

	@Override
	public List<Stock> selectStockList(SqlSession session, String productNo) {
		// TODO Auto-generated method stub
		return session.selectList("store.selectStockList",productNo);
	}

	@Override
	public List<ProductImg> selectImg(SqlSession session, String productNo) {
		// TODO Auto-generated method stub
		return session.selectList("store.selectImg",productNo);
	}

	@Override
	public int insertCart(SqlSession session, Map m) {
		// TODO Auto-generated method stub
		return session.insert("store.insertCart",m);
	}

}
