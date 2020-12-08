package com.project.petpal.store.model.service;

import java.util.List;
import java.util.Map;

import com.project.petpal.store.model.vo.Product;
import com.project.petpal.store.model.vo.ProductImg;
import com.project.petpal.store.model.vo.Stock;

public interface StoreService {
	Product selectProduct(String productNo);
	List<Stock> selectStockList(String productNo);
	List<ProductImg> selectImg(String productNo);
	int insertCart(Map m);
}
