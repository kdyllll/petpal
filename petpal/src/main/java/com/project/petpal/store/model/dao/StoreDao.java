package com.project.petpal.store.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.project.petpal.store.model.vo.Product;
import com.project.petpal.store.model.vo.ProductImg;
import com.project.petpal.store.model.vo.Stock;

public interface StoreDao {
	
	Product selectProduct(SqlSession session,String productNo);
	List<Stock> selectStockList(SqlSession session,String productNo);
	List<ProductImg> selectImg(SqlSession session,String productNo);
	List<Product> dogList(SqlSession session);
	List<Product> catList(SqlSession session);
	List<Product> smallList(SqlSession session);
	List<Product> categoryList(SqlSession session,String cNo);
	List<Map> subCateList(SqlSession session,String cNo);
	List<Product> soldOutList(SqlSession session,String cNo);
	int insertCart(SqlSession session,Map m);
}
