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

	@Override
	public int updatePrice(Stock s) {
		// TODO Auto-generated method stub
		return dao.updatePrice(session, s);
	}

	@Override
	public int updateIo(Map m) {
		// TODO Auto-generated method stub
		return dao.updateIo(session, m);
	}

	@Override
	public int deleteStockOne(Stock s) {
		// TODO Auto-generated method stub
		return dao.deleteStockOne(session, s);
	}

	@Override
	public int deleteProductOne(Stock s) {
		// TODO Auto-generated method stub
		return dao.deleteProductOne(session, s);
	}

	@Override
	public Map selectProductOne(Product p) {
		// TODO Auto-generated method stub
		return dao.selectProductOne(session, p);
	}

	@Override
	@Transactional
	public int updateProductEnd(Map p, List<ProductImg> pimgList) {
		// TODO Auto-generated method stub
		int result = dao.updateProductEnd(session,p);
		if(result>0) {
			if(pimgList != null) {
				for(ProductImg pi : pimgList) {
					result = dao.updateProductImgEnd(session, pi);	
				}
			}
		}
		

		return result;
	}

	@Override
	public List<ProductImg> selectProductImgAll(Product p) {
		// TODO Auto-generated method stub
		return dao.selectProductImgAll(session,p);
	}

	@Override
	public List<Map> productIOAll() {
		// TODO Auto-generated method stub
		return dao.productIOAll(session);
	}

	@Override
	public List<Map> searchProduct(String productName) {
		// TODO Auto-generated method stub
		return dao.searchProduct(session, productName);
	}
	
	@Override
	public List<Map> inOutSearch(Map m) {
		return dao.inOutSearch(session, m);
	}

	@Override
	public List<Map> selectOrderList() {
		// TODO Auto-generated method stub
		return dao.selectOrderList(session);
	}

	
}
