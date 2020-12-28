package com.project.petpal.store.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.project.petpal.community.model.vo.DailyImg;
import com.project.petpal.payment.model.vo.Cart;
import com.project.petpal.store.model.vo.Product;
import com.project.petpal.store.model.vo.ProductImg;
import com.project.petpal.store.model.vo.Qna;
import com.project.petpal.store.model.vo.Review;
import com.project.petpal.store.model.vo.Stock;

@Repository
public class StoreDaoImpl implements StoreDao{

	@Override
	public Product selectProduct(SqlSession session, String productNo) {
		// TODO Auto-generated method stub
		return session.selectOne("store.selectProduct",productNo);
	}

	@Override
	public List<Stock> selectStockList(SqlSession session, String productNo) {
		// TODO Auto-generated method stub
		return session.selectList("store.selectStockList",productNo);
	}

	@Override
	public List<Product> dogList(SqlSession session) {
		// TODO Auto-generated method stub
		return session.selectList("store.dogList");
	}

	@Override
	public List<Product> catList(SqlSession session) {
		// TODO Auto-generated method stub
		return session.selectList("store.catList");
	}

	@Override
	public List<Product> smallList(SqlSession session) {
		// TODO Auto-generated method stub
		return session.selectList("store.smallList");
	}

	@Override
	public List<ProductImg> selectImg(SqlSession session, String productNo) {
		// TODO Auto-generated method stub
		return session.selectList("store.selectImg",productNo);
	}

	@Override
	public List<Product> categoryList(SqlSession session, String cNo) {
		// TODO Auto-generated method stub
		return session.selectList("store.categoryList",cNo);
	}

	@Override
	public List<Map> subCateList(SqlSession session, String cNo) {
		// TODO Auto-generated method stub
		return session.selectList("store.subCateList",cNo);
	}

	@Override
	public List<Product> soldOutList(SqlSession session, String cNo) {
		// TODO Auto-generated method stub
		return session.selectList("store.soldOutList",cNo);
	}
	@Override
	public int insertCart(SqlSession session, Map m) {
		// TODO Auto-generated method stub
		return session.insert("cart.insertCart",m);
	}

	@Override
	public List<String> payCheck(SqlSession session, Map m) {
		// TODO Auto-generated method stub
		return session.selectList("store.payCheck",m);
	}

	@Override
	public int insertReview(SqlSession session, Review r) {
		// TODO Auto-generated method stub
		return session.insert("store.insertReview",r);
	}

	@Override
	public List<Review> selectReview(SqlSession session, String productNo,int cPage,int numPerPage) {
		// TODO Auto-generated method stub
		RowBounds rb=new RowBounds((cPage-1)*numPerPage,numPerPage);
		return session.selectList("store.selectReview",productNo,rb);
	}

	@Override
	public Stock selectStock(SqlSession session, String detailNo) {
		// TODO Auto-generated method stub
		return session.selectOne("store.selectStock",detailNo);
	}

	@Override
	public int deleteReview(SqlSession session, String reviewNo) {
		// TODO Auto-generated method stub
		return session.delete("store.deleteReview",reviewNo);
	}

	@Override
	public int updateReview(SqlSession session, Review r) {
		// TODO Auto-generated method stub
		return session.update("store.updateReview",r);
	}
	
	@Override
	public Review selectReviewOne(SqlSession session, String reviewNo) {
		// TODO Auto-generated method stub
		return session.selectOne("store.selectReviewOne",reviewNo);
	}

	@Override
	public int reviewComment(SqlSession session, Map map) {
		// TODO Auto-generated method stub
		return session.update("store.reviewComment",map);
	}

	@Override
	public ProductImg selectMainImg(SqlSession session, String productNo) {
		// TODO Auto-generated method stub
		return session.selectOne("store.selectMainImg",productNo);
	}

	@Override
	public int insertQna(SqlSession session, Qna q) {
		// TODO Auto-generated method stub
		return session.insert("store.insertQna",q);
	}

	@Override
	public List<Qna> selectQna(SqlSession session, String productNo,int cPage,int numPerPage) {
		// TODO Auto-generated method stub
		RowBounds rb=new RowBounds((cPage-1)*numPerPage,numPerPage);
		return session.selectList("store.selectQna", productNo,rb);
	}

	@Override
	public int deleteQna(SqlSession session, String qnaNo) {
		// TODO Auto-generated method stub
		return session.delete("store.deleteQna",qnaNo);
	}

	@Override
	public Qna selectQnaOne(SqlSession session, String qnaNo) {
		// TODO Auto-generated method stub
		return session.selectOne("store.selectQnaOne",qnaNo);
	}

	@Override
	public int updateQna(SqlSession session, Qna qna) {
		// TODO Auto-generated method stub
		return session.update("store.updateQna",qna);
	}

	@Override
	public int writeQnaComment(SqlSession session, Qna qna) {
		// TODO Auto-generated method stub
		return session.update("store.writeQnaComment",qna);
	}

	@Override
	public int editQnaComment(SqlSession session, Qna qna) {
		// TODO Auto-generated method stub
		return session.update("store.editQnaComment",qna);
	}

	@Override
	public int deleteQnaComment(SqlSession session, String qnaNo) {
		// TODO Auto-generated method stub
		return session.delete("store.deleteQnaComment",qnaNo);
	}

	@Override
	public Cart selectCartOne(SqlSession session, Map m) {
		// TODO Auto-generated method stub
		return session.selectOne("cart.selectCartOne",m);
	}

	@Override
	public int updateCartCnt(SqlSession session, Map m) {
		// TODO Auto-generated method stub
		return session.update("cart.updateCartCnt",m);
	}

	@Override
	public int totalReviewCount(SqlSession session, String productNo) {
		// TODO Auto-generated method stub
		return session.selectOne("store.totalReviewCount",productNo);
	}

	@Override
	public int totalQnaCount(SqlSession session, String productNo) {
		// TODO Auto-generated method stub
		return session.selectOne("store.totalQnaCount",productNo);
	}

	@Override
	public List<DailyImg> selectDailyImg(SqlSession session, String productNo) {
		// TODO Auto-generated method stub
		return session.selectList("store.selectDailyImg",productNo);
	}
	
	
	
	

	
	
	

}
