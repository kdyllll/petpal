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
	List<Map> selectProductAll(SqlSession session);
	List<Stock> selectStock(SqlSession session, String pdtNo);
	int updatePrice(SqlSession session, Stock s);
	int updateIo(SqlSession session, Map m);
	int deleteStockOne(SqlSession session, Stock s);
	int deleteProductOne(SqlSession session, Stock s);
	Map selectProductOne(SqlSession session, Product p);
	int updateProductEnd(SqlSession session, Map p);
	List<ProductImg> selectProductImgAll(SqlSession session, Product p); 
	int updateProductImgEnd(SqlSession session, ProductImg p);
	List<Map> productIOAll(SqlSession session);
	List<Map> searchProduct(SqlSession session, String productName);
	List<Map> inOutSearch(SqlSession session, Map m);
	List<Map> selectOrderList(SqlSession session);
	List<Map> selectPayDetail(SqlSession session, String paymentNo);
	Map selectPaymentOne(SqlSession session, String paymentNo);
	int orderCancelOne(SqlSession session, String detailNo);
	List<Map> payDetailStatus(SqlSession session, String paymentNo);
	int updatePaymentStatus(SqlSession session, String paymentNo);
	int orderCancelAll(SqlSession session, String paymentNo);
	List<Map> selectClaimAll(SqlSession session);
	Map selectClaimOne(SqlSession session, String claimNo);
	int claimDelete(SqlSession session, String claimNo);
	int claimAccept(SqlSession session, String claimNo);
	List<Map> selectPlaceList(SqlSession session);
	Map selectPlaceOne(SqlSession session, String placeNo);
}
