package com.project.petpal.store.model.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.petpal.store.model.dao.StoreDao;
import com.project.petpal.store.model.vo.Product;
import com.project.petpal.store.model.vo.ProductImg;
import com.project.petpal.store.model.vo.Review;
import com.project.petpal.store.model.vo.Stock;

@Service
public class StoreServiceImpl implements StoreService{
	@Autowired
	private StoreDao dao;
	
	@Autowired
	private SqlSession session;
	
	@Override
	public List<Product> categoryList(String cNo) {
		
		return dao.categoryList(session,cNo);
	}

	@Override
	public List<Product> dogList() {
		
		return dao.dogList(session);
	}

	@Override
	public List<Product> catList() {
		
		return dao.catList(session);
	}

	@Override
	public List<Product> smallList() {
		
		return dao.smallList(session);
	}


	@Override
	public Product selectProduct(String productNo) {
		return dao.selectProduct(session,productNo);
	}

	@Override
	public List<Stock> selectStockList(String productNo) {
		return dao.selectStockList(session,productNo);
	}

	@Override
	public List<ProductImg> selectImg(String productNo) {
		// TODO Auto-generated method stub
		return dao.selectImg(session,productNo);
	}

	@Override
	public List<Map> subCateList(String cNo) {
		// TODO Auto-generated method stub
		return dao.subCateList(session,cNo);
	}

	@Override
	public List<Product> soldOutList(String cNo) {
		// TODO Auto-generated method stub
		return dao.soldOutList(session,cNo);
	}
	@Override
	public int insertCart(Map m) {
		// TODO Auto-generated method stub
		return dao.insertCart(session,m);
	}

	@Override
	public List<String> payCheck(Map m) {
		// TODO Auto-generated method stub
		return dao.payCheck(session,m);
	}

	@Override
	public int insertReview(Review r) {
		// TODO Auto-generated method stub
		return dao.insertReview(session,r);
	}

	@Override
	public List<Review> selectReview(String productNo) {
		// TODO Auto-generated method stub
		return dao.selectReview(session,productNo);
	}

	@Override
	public Stock selectStock(String detailNo) {
		// TODO Auto-generated method stub
		return dao.selectStock(session,detailNo);
	}

	@Override
	public int deleteReview(String reviewNo) {
		// TODO Auto-generated method stub
		return dao.deleteReview(session,reviewNo);
	}
	
	@Override
	public int updateReview(Review r) {
		// TODO Auto-generated method stub
		return dao.updateReview(session,r);
	}

	@Override
	public Review selectReviewOne(String reviewNo) {
		// TODO Auto-generated method stub
		return dao.selectReviewOne(session,reviewNo);
	}

	@Override
	public int reviewComment(Map map) {
		// TODO Auto-generated method stub
		return dao.reviewComment(session,map);
	}

	
	
	
}
