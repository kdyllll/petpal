package com.project.petpal.store.model.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.petpal.community.model.vo.DailyImg;
import com.project.petpal.payment.model.vo.Cart;
import com.project.petpal.store.model.dao.StoreDao;
import com.project.petpal.store.model.vo.Product;
import com.project.petpal.store.model.vo.ProductImg;
import com.project.petpal.store.model.vo.Qna;
import com.project.petpal.store.model.vo.Review;
import com.project.petpal.store.model.vo.Stock;

@Service
public class StoreServiceImpl implements StoreService{
	@Autowired
	private StoreDao dao;
	
	@Autowired
	private SqlSession session;
	
	@Override
	public List<Product> categoryList(String cNo) {
		
		return dao.categoryList(session,cNo);
	}

	@Override
	public List<Product> dogList() {
		
		return dao.dogList(session);
	}

	@Override
	public List<Product> catList() {
		
		return dao.catList(session);
	}

	@Override
	public List<Product> smallList() {
		
		return dao.smallList(session);
	}


	@Override
	public Product selectProduct(String productNo) {
		return dao.selectProduct(session,productNo);
	}

	@Override
	public List<Stock> selectStockList(String productNo) {
		return dao.selectStockList(session,productNo);
	}

	@Override
	public List<ProductImg> selectImg(String productNo) {
		// TODO Auto-generated method stub
		return dao.selectImg(session,productNo);
	}

	@Override
	public List<Map> subCateList(String cNo) {
		// TODO Auto-generated method stub
		return dao.subCateList(session,cNo);
	}

	@Override
	public List<Product> soldOutList(String cNo) {
		// TODO Auto-generated method stub
		return dao.soldOutList(session,cNo);
	}
	@Override
	public int insertCart(Map m) {
		// TODO Auto-generated method stub
		return dao.insertCart(session,m);
	}

	@Override
	public List<String> payCheck(Map m) {
		// TODO Auto-generated method stub
		return dao.payCheck(session,m);
	}

	@Override
	public int insertReview(Review r) {
		// TODO Auto-generated method stub
		return dao.insertReview(session,r);
	}

	@Override
	public List<Review> selectReview(String productNo,int cPage,int numPerPage) {
		// TODO Auto-generated method stub
		return dao.selectReview(session,productNo,cPage,numPerPage);
	}

	@Override
	public Map selectStock(String detailNo) {
		// TODO Auto-generated method stub
		return dao.selectStock(session,detailNo);
	}

	@Override
	public int deleteReview(String reviewNo) {
		// TODO Auto-generated method stub
		return dao.deleteReview(session,reviewNo);
	}
	
	@Override
	public int updateReview(Review r) {
		// TODO Auto-generated method stub
		return dao.updateReview(session,r);
	}

	@Override
	public Review selectReviewOne(String reviewNo) {
		// TODO Auto-generated method stub
		return dao.selectReviewOne(session,reviewNo);
	}

	@Override
	public int reviewComment(Map map) {
		// TODO Auto-generated method stub
		return dao.reviewComment(session,map);
	}

	@Override
	public ProductImg selectMainImg(String productNo) {
		// TODO Auto-generated method stub
		return dao.selectMainImg(session,productNo);
	}

	@Override
	public int insertQna(Qna q) {
		// TODO Auto-generated method stub
		return dao.insertQna(session,q);
	}

	@Override
	public List<Qna> selectQna(String productNo,int cPage,int numPerPage) {
		// TODO Auto-generated method stub
		return dao.selectQna(session,productNo,cPage,numPerPage);
	}

	@Override
	public int deleteQna(String qnaNo) {
		// TODO Auto-generated method stub
		return dao.deleteQna(session,qnaNo);
	}

	@Override
	public Qna selectQnaOne(String qnaNo) {
		// TODO Auto-generated method stub
		return dao.selectQnaOne(session,qnaNo);
	}

	@Override
	public int updateQna(Qna qna) {
		// TODO Auto-generated method stub
		return dao.updateQna(session,qna);
	}
	
	@Override
	public int writeQnaComment(Qna qna) {
		// TODO Auto-generated method stub
		return dao.writeQnaComment(session,qna);
	}

	@Override
	public int editQnaComment(Qna qna) {
		// TODO Auto-generated method stub
		return dao.editQnaComment(session,qna);
	}

	@Override
	public int deleteQnaComment(String qnaNo) {
		// TODO Auto-generated method stub
		return dao.deleteQnaComment(session,qnaNo);
	}

	@Override
	public Cart selectCartOne(Map m) {
		// TODO Auto-generated method stub
		return dao.selectCartOne(session,m);
	}

	@Override
	public int updateCartCnt(Map m) {
		// TODO Auto-generated method stub
		return dao.updateCartCnt(session,m);
	}

	@Override
	public int totalReviewCount(String productNo) {
		// TODO Auto-generated method stub
		return dao.totalReviewCount(session,productNo);
	}

	@Override
	public int totalQnaCount(String productNo) {
		// TODO Auto-generated method stub
		return dao.totalQnaCount(session,productNo);
	}

	@Override
	public List<DailyImg> selectDailyImg(String productNo) {
		// TODO Auto-generated method stub
		return dao.selectDailyImg(session,productNo);
	}

	@Override
	public int insertFav(Map fav) {
		// TODO Auto-generated method stub
		return dao.insertFav(session,fav);
	}

	@Override
	public List<Product> favList(String memberNo) {
		// TODO Auto-generated method stub
		return dao.favList(session,memberNo);
	}

	@Override
	public int deleteFav(Map fav) {
		// TODO Auto-generated method stub
		return dao.deleteFav(session,fav);
	}

	@Override
	public List<Product> starList() {
		// TODO Auto-generated method stub
		return dao.starList(session);
	}

	
	
	
	
	
}
