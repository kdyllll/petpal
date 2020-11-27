package com.project.petpal.admin.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.project.petpal.admin.model.vo.Product;
import com.project.petpal.admin.model.vo.ProductImg;
import com.project.petpal.admin.model.vo.Stock;

public interface AdminDao {
	int insertProduct(SqlSession session, Product p);
	int insertStock(SqlSession session, Stock s);
	int insertProductImg(SqlSession session, ProductImg pi);
	int insertProductMainImg(SqlSession session, ProductImg pi);
	List<Product> selectProductAll(SqlSession session);
}
