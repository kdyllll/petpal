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
	public List<Map> selectProductAll(int cPage,int numPerPage) {
		// TODO Auto-generated method stub
		return dao.selectProductAll(session, cPage, numPerPage);
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
	public List<Map> productIOAll(int cPage,int numPerPage) {
		// TODO Auto-generated method stub
		return dao.productIOAll(session,cPage,numPerPage);
	}

	@Override
	public List<Map> searchProduct(Map m) {
		// TODO Auto-generated method stub
		return dao.searchProduct(session, m);
	}
	
	@Override
	public List<Map> inOutSearch(Map m) {
		return dao.inOutSearch(session, m);
	}

	@Override
	public List<Map> selectOrderList(int cPage,int numPerPage) {
		// TODO Auto-generated method stub
		return dao.selectOrderList(session, cPage, numPerPage);
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
	public int orderCancelOne(String detailNo,int detailCnt,String paymentNo) {
		// TODO Auto-generated method stub
		int result =  dao.orderCancelOne(session, detailNo);
		if(detailCnt == 1) {
			result = dao.updatePaymentStatus(session, paymentNo);
		}
		return result;
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
	public List<Map> selectClaimAll(int cPage,int numPerPage) {
		// TODO Auto-generated method stub
		return dao.selectClaimAll(session , cPage,numPerPage);
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
	public List<Map> selectPlaceList(int cPage,int numPerPage) {
		// TODO Auto-generated method stub
		return dao.selectPlaceList(session, cPage, numPerPage);
	}

	@Override
	public Map selectPlaceOne(String placeNo) {
		// TODO Auto-generated method stub
		return dao.selectPlaceOne(session, placeNo);
	}

	@Override
	public int updatePlace(Map m) {
		// TODO Auto-generated method stub
		return dao.updatePlace(session, m);
	}

	@Override
	public List<Map> orderSearch(Map m) {
		// TODO Auto-generated method stub
		return dao.orderSearch(session, m);
	}

	@Override
	public List<Map> memberSearch(Map m) {
		// TODO Auto-generated method stub
		return dao.memberSearch(session, m);
	}

	@Override
	public List<Map> searchClaim(Map m) {
		// TODO Auto-generated method stub
		return dao.searchClaim(session, m);
	}

	@Override
	public List<Map> searchCommunity(Map m) {
		// TODO Auto-generated method stub
		return dao.searchCommunity(session,m);
	}

	@Override
	public int pTotalCount() {
		// TODO Auto-generated method stub
		return dao.pTotalCount(session);
	}

	@Override
	public int ioTotalCount() {
		// TODO Auto-generated method stub
		return dao.ioTotalCount(session);
	}

	@Override
	public int cumTotalCount() {
		// TODO Auto-generated method stub
		return dao.cumTotalCount(session);
	}

	@Override
	public int claimTotalCount() {
		// TODO Auto-generated method stub
		return dao.claimTotalCount(session);
	}

	@Override
	public int mTotalCount() {
		// TODO Auto-generated method stub
		return dao.mTotalCount(session);
	}

	@Override
	public int orderTotalCount() {
		// TODO Auto-generated method stub
		return dao.orderTotalCount(session);
	}

	@Override
	@Transactional
	public int orderAccept(Map m) {
		// TODO Auto-generated method stub
		String paymentNo = (String)m.get("paymentNo");
		int result = dao.orderAccept(session, paymentNo);
		if(result > 0) {
			result = dao.orderDetailAccept(session,paymentNo);
			if(result>0 && m.get("memberNo") != null) {
				result = dao.updatePoint(session, m);
			}
		}
		return result;
	}

	@Override
	public int detailCnt(String paymentNo) {
		// TODO Auto-generated method stub
		return dao.detailCnt(session, paymentNo);
	}

	
}
