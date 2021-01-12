package com.project.petpal.admin.model.service;

import java.util.List;
import java.util.Map;

import com.project.petpal.admin.model.vo.Product;
import com.project.petpal.admin.model.vo.ProductImg;
import com.project.petpal.admin.model.vo.Stock;

public interface AdminService {
	int insertProduct(Product p, List<Stock> stockList, List<ProductImg> pImg);
	List<Map> selectProductAll(int cPage,int numPerPage);
	List<Stock> selectStock(String pdtNo);
	int updatePrice(Stock s);
	int updateIo(Map m);
	int deleteStockOne(Stock s);
	int deleteProductOne(Stock s);
	Map selectProductOne(Product p);
	int updateProductEnd(Map p, List<ProductImg> pimgList);
	List<ProductImg> selectProductImgAll(Product p);
	List<Map> productIOAll(int cPage,int numPerPage);
	List<Map> searchProduct(Map m);
	List<Map> inOutSearch(Map m);
	List<Map> selectOrderList(int cPage,int numPerPage);
	List<Map> selectPayDetail(String paymentNo);
	Map selectPaymentOne(String paymentNo);
	int orderCancelOne(String detailNo,int detailCnt,String paymentNo);
	List<Map> payDetailStatus(String paymentNo);
	int updatePaymentStatus(String paymentNo);
	int orderCancelAll(String paymentNo);
	List<Map> selectClaimAll(int cPage,int numPerPage);
	Map selectClaimOne(String claimNo);
	int claimDelete(String claimNo);
	int claimAccept(String claimNo);
	List<Map> selectPlaceList(int cPage,int numPerPage);
	Map selectPlaceOne(String placeNo);
	int updatePlace(Map m);
	List<Map> orderSearch(Map m);
	List<Map> memberSearch(Map m);
	List<Map> searchClaim(Map m);
	List<Map> searchCommunity(Map m);
	int pTotalCount();
	int ioTotalCount();
	int cumTotalCount();
	int claimTotalCount();
	int mTotalCount();
	int orderTotalCount();
	int orderAccept(Map m);
	int detailCnt(String paymentNo);
	List<Map> refundChangeList();
	Map refundChangeOne(String detailNo);
}
