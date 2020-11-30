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
	
}
