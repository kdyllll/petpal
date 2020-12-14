package com.project.petpal.store.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.project.petpal.store.model.vo.Product;
import com.project.petpal.store.model.vo.ProductImg;
import com.project.petpal.store.model.vo.Review;
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
	public List<Product> dogList(SqlSession session) {
		// TODO Auto-generated method stub
		return session.selectList("store.dogList");
	}

	@Override
	public List<Product> catList(SqlSession session) {
		// TODO Auto-generated method stub
		return session.selectList("store.catList");
	}

	@Override
	public List<Product> smallList(SqlSession session) {
		// TODO Auto-generated method stub
		return session.selectList("store.smallList");
	}

	@Override
	public List<ProductImg> selectImg(SqlSession session, String productNo) {
		// TODO Auto-generated method stub
		return session.selectList("store.selectImg",productNo);
	}

	@Override
	public List<Product> categoryList(SqlSession session, String cNo) {
		// TODO Auto-generated method stub
		return session.selectList("store.categoryList",cNo);
	}

	@Override
	public List<Map> subCateList(SqlSession session, String cNo) {
		// TODO Auto-generated method stub
		return session.selectList("store.subCateList",cNo);
	}

	@Override
	public List<Product> soldOutList(SqlSession session, String cNo) {
		// TODO Auto-generated method stub
		return session.selectList("store.soldOutList",cNo);
	}
	@Override
	public int insertCart(SqlSession session, Map m) {
		// TODO Auto-generated method stub
		return session.insert("store.insertCart",m);
	}

	@Override
	public String payCheck(SqlSession session, Map m) {
		// TODO Auto-generated method stub
		return session.selectOne("store.payCheck",m);
	}

	@Override
	public int insertReview(SqlSession session, Review r) {
		// TODO Auto-generated method stub
		return session.insert("store.insertReview",r);
	}

}
