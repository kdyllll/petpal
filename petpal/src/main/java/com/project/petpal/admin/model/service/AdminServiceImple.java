package com.project.petpal.admin.model.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.project.petpal.admin.model.dao.AdminDao;
import com.project.petpal.admin.model.vo.Product;
import com.project.petpal.admin.model.vo.Stock;

@Service
public class AdminServiceImple implements AdminService {
	@Autowired
	public AdminDao dao;
	@Autowired
	public SqlSession session;

	@Override
	@Transactional
	public int insertProduct(Product p,List<Stock> stockList) {
		// TODO Auto-generated method stub
		int result = dao.insertProduct(session, p);
		if(result>0) {
			if(stockList!=null) {
				for(Stock s : stockList) {
					s.setProductNo(p.getProductNo());
					result = dao.insertStock(session, s);
				}
			}
		}
		return result;
	}
	
	
}
