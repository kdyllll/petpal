package com.project.petpal.community.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.project.petpal.admin.model.vo.Product;
import com.project.petpal.store.model.vo.ProductImg;
import com.project.petpal.community.model.vo.Daily;
import com.project.petpal.community.model.vo.DailyCoord;
import com.project.petpal.community.model.vo.DailyImg;
import com.project.petpal.community.model.vo.Hashtag;

@Repository
public class DailyDaoImpl implements DailyDao {

	@Override
	public int insertDaily(SqlSession session, Daily d) {
		return session.insert("daily.insertDaily",d);
	}

	@Override
	public int insertDailyImg(SqlSession session, DailyImg di) {
		return session.insert("daily.insertDailyImg",di);
	}

	@Override
	public int insertDailyCoords(SqlSession session, DailyCoord dc) {
		return session.insert("daily.insertDailyCoords",dc);
	}
	
	@Override
	public List<Product> selectProductName(SqlSession session, String key) {
		return session.selectList("daily.selectProductName",key);
	}

	@Override
	public String selectProductNo(SqlSession session, String name) {
		return session.selectOne("daily.selectProductNo",name);
	}

	@Override
	public ProductImg selectDailyProduct(SqlSession session, String productNo) {
		return session.selectOne("daily.selectDailyProduct",productNo);
	}

	@Override
	public List<Product> selectProductAll(SqlSession session) {
		return session.selectList("daily.selectProductAll");
	}

	@Override
	public int insertHashtag(SqlSession session, Hashtag h) {
		// TODO Auto-generated method stub
		return session.insert("daily.insertHashtag",h);
	}

	@Override
	public List<Map> selectDailyAll(SqlSession session,int cPage,int numPerPage) {
		// TODO Auto-generated method stub
		RowBounds rb=new RowBounds((cPage-1)*numPerPage,numPerPage);
		return session.selectList("daily.selectDailyAll",null,rb);
	}

	@Override
	public List<DailyImg> selectMainImg(SqlSession session) {
		// TODO Auto-generated method stub
		return session.selectList("daily.selectMainImg");
	}

	@Override
	public List<Hashtag> selectHashAll(SqlSession session) {
		// TODO Auto-generated method stub
		return session.selectList("daily.selectHashAll");
	}

	@Override
	public Map selectDailyOne(SqlSession session, String dailyNo) {
		// TODO Auto-generated method stub
		return session.selectOne("daily.selectDailyOne",dailyNo);
	}

	@Override
	public List<DailyImg> selectDailyImg(SqlSession session, String dailyNo) {
		// TODO Auto-generated method stub
		return session.selectList("daily.selectDailyImg",dailyNo);
	}

	@Override
	public List<Hashtag> selectHashList(SqlSession session, String dailyNo) {
		// TODO Auto-generated method stub
		return session.selectList("daily.selectHashList",dailyNo);
	}

	@Override
	public List<Map> selectCoordList(SqlSession session, String dailyNo) {
		// TODO Auto-generated method stub
		return session.selectList("daily.selectCoordList",dailyNo);
	}

	@Override
	public ProductImg selectProductImg(SqlSession session, String productNo) {
		// TODO Auto-generated method stub
		return session.selectOne("store.selectMainImg",productNo);
	}

	@Override
	public int deleteDaily(SqlSession session, String dailyNo) {
		// TODO Auto-generated method stub
		return session.delete("daily.deleteDaily",dailyNo);
	}
	
	@Override
	public List<Map> selectDailyListOne(SqlSession session, String memberNo) {
		return session.selectList("daily.selectDailyListOne", memberNo);
	}

	@Override
	public int dailyCnt(SqlSession session, String memberNo) {
		// TODO Auto-generated method stub
		return session.selectOne("daily.dailyCnt", memberNo);
	}

	@Override
	public int totalDailyCount(SqlSession session) {
		// TODO Auto-generated method stub
		return session.selectOne("daily.totalDailyCount");
	}

	@Override
	public int deleteDailyImg(SqlSession session, String dailyImgNo) {
		// TODO Auto-generated method stub
		return session.delete("daily.deleteDailyImg",dailyImgNo);
	}

	@Override
	public int updateDailyImg(SqlSession session, DailyImg di) {
		// TODO Auto-generated method stub
		return session.update("daily.updateDailyImg",di);
	}

	@Override
	public int updateImgStatus(SqlSession session, DailyImg di) {
		// TODO Auto-generated method stub
		return session.update("daily.updateImgStatus",di);
	}

	@Override
	public int deleteAllCoords(SqlSession session, String dailyImgNo) {
		// TODO Auto-generated method stub
		return session.delete("daily.deleteAllCoords",dailyImgNo);
	}

	@Override
	public int deleteAllHash(SqlSession session, String dailyNo) {
		// TODO Auto-generated method stub
		return session.delete("daily.deleteAllHash",dailyNo);
	}

	@Override
	public int updateDailyContent(SqlSession session, Daily d) {
		// TODO Auto-generated method stub
		return session.update("daily.updateDailyContent",d);
	}

	
	

}
