package com.project.petpal.store.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.project.petpal.payment.model.vo.Cart;
import com.project.petpal.store.model.vo.Product;
import com.project.petpal.store.model.vo.ProductImg;
import com.project.petpal.store.model.vo.Qna;
import com.project.petpal.store.model.vo.Review;
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
	List<String> payCheck(SqlSession session,Map m);
	int insertReview(SqlSession session,Review r);
	List<Review> selectReview(SqlSession session,String productNo);
	Stock selectStock(SqlSession session,String detailNo);
	int deleteReview(SqlSession session,String reviewNo);
	int updateReview(SqlSession session,Review r);
	Review selectReviewOne(SqlSession session,String reviewNo);
	int reviewComment(SqlSession session,Map map);
	ProductImg selectMainImg(SqlSession session,String productNo);
	int insertQna(SqlSession session,Qna q);
	List<Qna> selectQna(SqlSession session,String productNo);
	int deleteQna(SqlSession session,String qnaNo);
	Qna selectQnaOne(SqlSession session,String qnaNo);
	int updateQna(SqlSession session,Qna qna);
	int writeQnaComment(SqlSession session,Qna qna);
	int editQnaComment(SqlSession session,Qna qna);
	int deleteQnaComment(SqlSession session,String qnaNo);
	Cart selectCartOne(SqlSession session,Map m);
	int updateCartCnt(SqlSession session,Map m);
}
