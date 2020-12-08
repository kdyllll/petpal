package com.project.petpal.store.model.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.petpal.store.model.dao.StoreDao;
import com.project.petpal.store.model.vo.Product;
import com.project.petpal.store.model.vo.ProductImg;
import com.project.petpal.store.model.vo.Stock;

@Service
public class StoreServiceImpl implements StoreService{
	@Autowired
	private StoreDao dao;
	
	@Autowired
	private SqlSession session;

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

}
