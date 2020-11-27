package com.project.petpal.admin.model.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.project.petpal.admin.model.dao.AdminDao;
import com.project.petpal.admin.model.vo.Product;
import com.project.petpal.admin.model.vo.ProductImg;
import com.project.petpal.admin.model.vo.Stock;

@Service
public class AdminServiceImple implements AdminService {
	@Autowired
	public AdminDao dao;
	@Autowired
	public SqlSession session;

	@Override
	@Transactional
	public int insertProduct(Product p,List<Stock> stockList,List<ProductImg> pImg) {
		// TODO Auto-generated method stub
		int result = dao.insertProduct(session, p);
		if(result>0) {
			if(stockList!=null) {
				for(Stock s : stockList) {
					s.setProductNo(p.getProductNo());
					result = dao.insertStock(session, s);
				}
			}
			if(pImg != null) {
				for(int i=0; i<pImg.size(); i++) {
					ProductImg pi = (ProductImg)pImg.get(i);
					pi.setProductNo(p.getProductNo());
					if(i==0) {
						result = dao.insertProductMainImg(session, pi);		
					} else if (i!= 0) {			
						result = dao.insertProductImg(session, pi);						
					}
				}
			}
		}
		return result;
	}

	@Override
	public List<Map> selectProductAll() {
		// TODO Auto-generated method stub
		return dao.selectProductAll(session);
	}

	@Override
	public List<Stock> selectStock(String pdtNo) {
		// TODO Auto-generated method stub
		return dao.selectStock(session, pdtNo);
	}
	
	
}
