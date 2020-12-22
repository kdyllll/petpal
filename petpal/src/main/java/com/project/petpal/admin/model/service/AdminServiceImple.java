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

	@Override
	public List<Map> selectPayDetail(String paymentNo) {
		// TODO Auto-generated method stub
		return dao.selectPayDetail(session, paymentNo);
	}

	@Override
	public Map selectPaymentOne(String paymentNo) {
		// TODO Auto-generated method stub
		return dao.selectPaymentOne(session, paymentNo);
	}

	@Override
	public int orderCancelOne(String detailNo) {
		// TODO Auto-generated method stub
		return dao.orderCancelOne(session, detailNo);
	}

	@Override
	public List<Map> payDetailStatus(String paymentNo) {
		// TODO Auto-generated method stub
		return dao.payDetailStatus(session, paymentNo);
	}

	@Override
	public int updatePaymentStatus(String paymentNo) {
		// TODO Auto-generated method stub
		return dao.updatePaymentStatus(session, paymentNo);
	}

	@Override
	public int orderCancelAll(String paymentNo) {
		// TODO Auto-generated method stub
		return dao.orderCancelAll(session, paymentNo);
	}

	@Override
	public List<Map> selectClaimAll() {
		// TODO Auto-generated method stub
		return dao.selectClaimAll(session);
	}

	@Override
	public Map selectClaimOne(String claimNo) {
		// TODO Auto-generated method stub
		return dao.selectClaimOne(session, claimNo);
	}

	@Override
	public int claimDelete(String claimNo) {
		// TODO Auto-generated method stub
		return dao.claimDelete(session, claimNo);
	}

	@Override
	public int claimAccept(String claimNo) {
		// TODO Auto-generated method stub
		return dao.claimAccept(session, claimNo);
	}

	@Override
	public List<Map> selectPlaceList() {
		// TODO Auto-generated method stub
		return dao.selectPlaceList(session);
	}

	
}
