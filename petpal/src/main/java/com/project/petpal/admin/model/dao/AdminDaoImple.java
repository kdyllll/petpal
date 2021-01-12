package com.project.petpal.admin.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
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
	public List<Map> selectProductAll(SqlSession session, int cPage, int numPerPage) {
		// TODO Auto-generated method stub
		RowBounds rb = new RowBounds((cPage -1)*numPerPage, numPerPage);
		return session.selectList("product.selectProductAll",null, rb);
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
	public List<Map> productIOAll(SqlSession session,int cPage,int numPerPage) {
		// TODO Auto-generated method stub
		RowBounds rb = new RowBounds((cPage -1)*numPerPage, numPerPage);
		return session.selectList("product.productIOAll",null,rb);
	}

	@Override
	public List<Map> searchProduct(SqlSession session, Map m) {
		// TODO Auto-generated method stub
		return session.selectList("product.searchProduct", m);
	}

	@Override
	public List<Map> inOutSearch(SqlSession session, Map m) {
		return session.selectList("product.inOutSearch", m);
	}

	@Override
	public List<Map> selectOrderList(SqlSession session,  int cPage, int numPerPage) {
		// TODO Auto-generated method stub
		RowBounds rb = new RowBounds((cPage -1)*numPerPage, numPerPage);
		return session.selectList("pay.selectOrderList",null,rb);
	}

	@Override
	public List<Map> selectPayDetail(SqlSession session, String paymentNo) {
		// TODO Auto-generated method stub
		return session.selectList("pay.selectPayDetail", paymentNo);
	}

	@Override
	public Map selectPaymentOne(SqlSession session, String paymentNo) {
		// TODO Auto-generated method stub
		return session.selectOne("pay.selectPaymentOne", paymentNo);
	}

	@Override
	public int orderCancelOne(SqlSession session, String detailNo) {
		// TODO Auto-generated method stub
		return session.update("pay.orderCancelOne", detailNo);
	}

	@Override
	public List<Map> payDetailStatus(SqlSession session, String paymentNo) {
		// TODO Auto-generated method stub
		return session.selectList("pay.payDetailStatus", paymentNo);
	}

	@Override
	public int updatePaymentStatus(SqlSession session, String paymentNo) {
		// TODO Auto-generated method stub
		return session.update("pay.updatePaymentStatus", paymentNo);
	}

	@Override
	public int orderCancelAll(SqlSession session, String paymentNo) {
		// TODO Auto-generated method stub
		return session.update("pay.orderCancelAll", paymentNo);
	}

	@Override
	public List<Map> selectClaimAll(SqlSession session,  int cPage, int numPerPage) {
		// TODO Auto-generated method stub
		RowBounds rb = new RowBounds((cPage -1)*numPerPage, numPerPage);
		return session.selectList("admin.selectClaimAll",null,rb);
	}

	@Override
	public Map selectClaimOne(SqlSession session, String claimNo) {
		// TODO Auto-generated method stub
		return session.selectOne("admin.selectClaimOne", claimNo);
	}

	@Override
	public int claimDelete(SqlSession session, String claimNo) {
		// TODO Auto-generated method stub
		return session.delete("admin.claimDelete", claimNo);
	}

	@Override
	public int claimAccept(SqlSession session, String claimNo) {
		// TODO Auto-generated method stub
		return session.update("admin.claimAccept",claimNo);
	}

	@Override
	public List<Map> selectPlaceList(SqlSession session,  int cPage, int numPerPage) {
		// TODO Auto-generated method stub
		RowBounds rb = new RowBounds((cPage -1)*numPerPage, numPerPage);
		return session.selectList("admin.selectPlaceList",null,rb);
	}

	@Override
	public Map selectPlaceOne(SqlSession session, String placeNo) {
		// TODO Auto-generated method stub
		return session.selectOne("admin.selectPlaceOne",placeNo);
	}

	@Override
	public int updatePlace(SqlSession session, Map m) {
		// TODO Auto-generated method stub
		return session.update("admin.updatePlace", m);
	}

	@Override
	public List<Map> orderSearch(SqlSession session, Map m) {
		// TODO Auto-generated method stub
		return session.selectList("admin.orderSearch", m);
	}

	@Override
	public List<Map> memberSearch(SqlSession session, Map m) {
		// TODO Auto-generated method stub
		return session.selectList("admin.memberSearch", m);
	}

	@Override
	public List<Map> searchClaim(SqlSession session, Map m) {
		// TODO Auto-generated method stub
		return session.selectList("admin.searchClaim", m);
	}

	@Override
	public List<Map> searchCommunity(SqlSession session, Map m) {
		// TODO Auto-generated method stub
		return session.selectList("admin.searchCommunity", m);
	}

	@Override
	public int pTotalCount(SqlSession session) {
		// TODO Auto-generated method stub
		return session.selectOne("product.pTotalCount");
	}
	@Override
	public int ioTotalCount(SqlSession session) {
		// TODO Auto-generated method stub
		return session.selectOne("product.ioTotalCount");
	}

	@Override
	public int cumTotalCount(SqlSession session) {
		// TODO Auto-generated method stub
		return session.selectOne("admin.cumTotalCount");
	}

	@Override
	public int claimTotalCount(SqlSession session) {
		// TODO Auto-generated method stub
		return session.selectOne("admin.claimTotalCount");
	}

	@Override
	public int orderTotalCount(SqlSession session) {
		// TODO Auto-generated method stub
		return session.selectOne("pay.orderTotalCount");
	}

	@Override
	public int mTotalCount(SqlSession session) {
		// TODO Auto-generated method stub
		return session.selectOne("admin.mTotalCount");
	}

	@Override
	public int orderAccept(SqlSession session, String paymentNo) {
		// TODO Auto-generated method stub
		return session.update("pay.orderAccept",paymentNo);
	}

	@Override
	public int orderDetailAccept(SqlSession session, String paymentNo) {
		// TODO Auto-generated method stub
		return session.update("pay.orderDetailAccept", paymentNo);
	}

	@Override
	public int updatePoint(SqlSession session,Map m) {
		// TODO Auto-generated method stub
		return session.update("pay.updatePoint", m);
	}

	@Override
	public int detailCnt(SqlSession session, String paymentNo) {
		// TODO Auto-generated method stub
		return session.selectOne("pay.detailCnt", paymentNo);
	}

	@Override
	public List<Map> refundChangeList(SqlSession session) {
		// TODO Auto-generated method stub
		return session.selectList("admin.refundChangeList");
	}

	@Override
	public Map refundChangeOne(SqlSession session, String detailNo) {
		// TODO Auto-generated method stub
		return session.selectOne("admin.refundChangeOne", detailNo);
	}

	@Override
	public int updateRefundPayment(SqlSession session, Map m) {
		// TODO Auto-generated method stub
		return session.update("admin.updateRefundPayment", m);
	}

	@Override
	public int updateRefundDetail(SqlSession session, Map m) {
		// TODO Auto-generated method stub
		return session.update("admin.updateRefundDetail",m);
	}

	@Override
	public int updateChange(SqlSession session, Map m) {
		// TODO Auto-generated method stub
		return session.update("admin.updateChange", m);
	}

	@Override
	public List<Map> refundChangeSearch(SqlSession session, Map m) {
		// TODO Auto-generated method stub
		return session.selectList("admin.refundChangeSearch", m);
	}

}
