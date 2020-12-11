package com.project.petpal.admin.model.dao;

import java.util.List;
import java.util.Map;

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
	public List<Map> selectProductAll(SqlSession session) {
		// TODO Auto-generated method stub
		return session.selectList("product.selectProductAll");
	}

	@Override
	public int insertProductMainImg(SqlSession session, ProductImg pi) {
		// TODO Auto-generated method stub
		return session.insert("product.insertProductMainImg", pi);
	}

	@Override
	public List<Stock> selectStock(SqlSession session, String pdtNo) {
		// TODO Auto-generated method stub
		return session.selectList("product.selectStock", pdtNo);
	}

	@Override
	public int updatePrice(SqlSession session, Stock s) {
		// TODO Auto-generated method stub
		return session.update("product.updatePrice", s);
	}

	@Override
	public int updateIo(SqlSession session, Map m) {
		// TODO Auto-generated method stub
		return session.update("product.updateIo",m);
	}

	@Override
	public int deleteStockOne(SqlSession session, Stock s) {
		// TODO Auto-generated method stub
		return session.delete("product.deleteStockOne", s);
	}
	@Override
	public int deleteProductOne(SqlSession session, Stock s) {
		// TODO Auto-generated method stub
		return session.delete("product.deleteProductOne", s);
	}

	@Override
	public Map selectProductOne(SqlSession session, Product p) {
		// TODO Auto-generated method stub
		return session.selectOne("product.selectProductOne", p);
	}

	@Override
	public int updateProductEnd(SqlSession session, Map p) {
		return session.update("product.updateProductEnd", p);
	}

	@Override
	public List<ProductImg> selectProductImgAll(SqlSession session, Product p) {
		// TODO Auto-generated method stub
		return session.selectList("product.selectProductImgAll", p);
	}

	@Override
	public int updateProductImgEnd(SqlSession session, ProductImg p) {
		// TODO Auto-generated method stub
		return session.update("product.updateProductImgEnd", p);
	}

	@Override
	public List<Map> productIOAll(SqlSession session) {
		// TODO Auto-generated method stub
		return session.selectList("product.productIOAll");
	}

	@Override
	public List<Map> searchProduct(SqlSession session, String productName) {
		// TODO Auto-generated method stub
		return session.selectList("product.searchProduct", productName);
	}

	@Override
	public List<Map> inOutSearch(SqlSession session, Map m) {
		return session.selectList("product.inOutSearch", m);
	}

}
