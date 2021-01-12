package com.project.petpal.admin.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.project.petpal.admin.model.vo.Product;
import com.project.petpal.admin.model.vo.ProductImg;
import com.project.petpal.admin.model.vo.Stock;

public interface AdminDao {
	int insertProduct(SqlSession session, Product p);
	int insertStock(SqlSession session, Stock s);
	int insertProductImg(SqlSession session, ProductImg pi);
	int insertProductMainImg(SqlSession session, ProductImg pi);
	List<Map> selectProductAll(SqlSession session, int cPage, int numPerPage);
	List<Stock> selectStock(SqlSession session, String pdtNo);
	int updatePrice(SqlSession session, Stock s);
	int updateIo(SqlSession session, Map m);
	int deleteStockOne(SqlSession session, Stock s);
	int deleteProductOne(SqlSession session, Stock s);
	Map selectProductOne(SqlSession session, Product p);
	int updateProductEnd(SqlSession session, Map p);
	List<ProductImg> selectProductImgAll(SqlSession session, Product p); 
	int updateProductImgEnd(SqlSession session, ProductImg p);
	List<Map> productIOAll(SqlSession session, int cPage,int numPerPage);
	List<Map> searchProduct(SqlSession session, Map m);
	List<Map> inOutSearch(SqlSession session, Map m);
	List<Map> selectOrderList(SqlSession session,int cPage, int numPerPage);
	List<Map> selectPayDetail(SqlSession session, String paymentNo);
	Map selectPaymentOne(SqlSession session, String paymentNo);
	int orderCancelOne(SqlSession session, String detailNo);
	List<Map> payDetailStatus(SqlSession session, String paymentNo);
	int updatePaymentStatus(SqlSession session, String paymentNo);
	int orderCancelAll(SqlSession session, String paymentNo);
	List<Map> selectClaimAll(SqlSession session,int cPage, int numPerPage);
	Map selectClaimOne(SqlSession session, String claimNo);
	int claimDelete(SqlSession session, String claimNo);
	int claimAccept(SqlSession session, String claimNo);
	List<Map> selectPlaceList(SqlSession session,int cPage, int numPerPage);
	Map selectPlaceOne(SqlSession session, String placeNo);
	int updatePlace(SqlSession session, Map m);
	List<Map> orderSearch(SqlSession session, Map m);
	List<Map> memberSearch(SqlSession session, Map m);
	List<Map> searchClaim(SqlSession session, Map m);
	List<Map> searchCommunity(SqlSession session, Map m);
	int pTotalCount(SqlSession session);
	int ioTotalCount(SqlSession session);
	int cumTotalCount(SqlSession session);
	int claimTotalCount(SqlSession session);
	int orderTotalCount(SqlSession session);
	int mTotalCount(SqlSession session);
	int orderAccept(SqlSession session, String paymentNo);
	int orderDetailAccept(SqlSession session, String paymentNo);
	int updatePoint(SqlSession session, Map m);
	int detailCnt(SqlSession session, String paymentNo);
	List<Map> refundChangeList(SqlSession session);
	Map refundChangeOne(SqlSession session, String detailNo);
	int updateRefundPayment(SqlSession session, Map m);
	int updateRefundDetail(SqlSession session, Map m);
	int updateChange(SqlSession session, Map m);
	List<Map> refundChangeSearch(SqlSession session, Map m);
	
}
