package com.project.petpal.admin.model.service;

import java.util.List;
import java.util.Map;

import com.project.petpal.admin.model.vo.Product;
import com.project.petpal.admin.model.vo.ProductImg;
import com.project.petpal.admin.model.vo.Stock;

public interface AdminService {
	int insertProduct(Product p, List<Stock> stockList, List<ProductImg> pImg);
	List<Map> selectProductAll();
	List<Stock> selectStock(String pdtNo);
	int updatePrice(Stock s);
	int updateIo(Map m);
	int deleteStockOne(Stock s);
	int deleteProductOne(Stock s);
	Map selectProductOne(Product p);
	int updateProductEnd(Map p, List<ProductImg> pimgList);
	List<ProductImg> selectProductImgAll(Product p);
	List<Map> productIOAll();
	List<Map> searchProduct(String productName);
	List<Map> inOutSearch(Map m);
	List<Map> selectOrderList();
	List<Map> selectPayDetail(String paymentNo);
	Map selectPaymentOne(String paymentNo);
	int orderCancelOne(String detailNo);
	List<Map> payDetailStatus(String paymentNo);
	int updatePaymentStatus(String paymentNo);
	int orderCancelAll(String paymentNo);
	List<Map> selectClaimAll();
	Map selectClaimOne(String claimNo);
	int claimDelete(String claimNo);
	int claimAccept(String claimNo);
	List<Map> selectPlaceList();
	Map selectPlaceOne(String placeNo);
	int updatePlace(Map m);
	List<Map> orderSearch(Map m);
	List<Map> memberSearch(Map m);
	List<Map> searchClaim(Map m);
	List<Map> searchCommunity(Map m);
}
