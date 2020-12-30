package com.project.petpal.store.model.service;

import java.util.List;
import java.util.Map;

import com.project.petpal.community.model.vo.DailyImg;
import com.project.petpal.payment.model.vo.Cart;
import com.project.petpal.store.model.vo.Product;
import com.project.petpal.store.model.vo.ProductImg;
import com.project.petpal.store.model.vo.Qna;
import com.project.petpal.store.model.vo.Review;
import com.project.petpal.store.model.vo.Stock;

public interface StoreService {
	Product selectProduct(String productNo);
	List<Stock> selectStockList(String productNo);
	List<ProductImg> selectImg(String productNo);
	List<Product> dogList();
	List<Product> catList();
	List<Product> smallList();
	List<Product> categoryList(String cNo);
	List<Map> subCateList(String cNo);
	List<Product> soldOutList(String cNo);
	int insertCart(Map m);
	List<String> payCheck(Map m);
	int insertReview(Review r);
	List<Review> selectReview(String productNo,int cPage,int numPerPage);
	Map selectStock(String detailNo);
	int deleteReview(String reviewNo);
	int updateReview(Review r);
	Review selectReviewOne(String reviewNo);
	int reviewComment(Map map);
	ProductImg selectMainImg(String productNo);
	int insertQna(Qna q);
	List<Qna> selectQna(String productNo,int cPage,int numPerPage);
	int deleteQna(String qnaNo);
	Qna selectQnaOne(String qnaNo);
	int updateQna(Qna qna);
	int writeQnaComment(Qna qna);
	int editQnaComment(Qna qna);
	int deleteQnaComment(String qnaNo);
	Cart selectCartOne(Map m);
	int updateCartCnt(Map m);
	int totalReviewCount(String productNo);
	int totalQnaCount(String productNo);
	List<DailyImg> selectDailyImg(String productNo);
} 
