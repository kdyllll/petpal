package com.project.petpal.admin.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.project.petpal.admin.model.vo.Product;
import com.project.petpal.admin.model.vo.ProductImg;
import com.project.petpal.admin.model.vo.Stock;

@Repository
public class AdminDaoImple implements AdminDao {

	@Override
	public int insertProduct(SqlSession session,Product p) {
		// TODO Auto-generated method stub
		return session.insert("product.insertProduct",p);
	}

	@Override
	public int insertStock(SqlSession session, Stock s) {
		// TODO Auto-generated method stub
		return session.insert("product.insertStock", s);
	}

	@Override
	public int insertProductImg(SqlSession session, ProductImg pi) {
		// TODO Auto-generated method stub
		return session.insert("product.insertProductImg", pi);
	}

	@Override
	public List<Product> selectProductAll(SqlSession session) {
		// TODO Auto-generated method stub
		return session.selectList("product.selectProductAll");
	}

	@Override
	public int insertProductMainImg(SqlSession session, ProductImg pi) {
		// TODO Auto-generated method stub
		return session.insert("product.insertProductMainImg", pi);
	}

}
