package com.project.petpal.community.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.project.petpal.admin.model.vo.Product;
import com.project.petpal.store.model.vo.ProductImg;
import com.project.petpal.community.model.vo.Daily;
import com.project.petpal.community.model.vo.DailyCoord;
import com.project.petpal.community.model.vo.DailyImg;
import com.project.petpal.community.model.vo.Hashtag;

public interface DailyDao {
	int insertDaily(SqlSession session, Daily d);
	int insertDailyImg(SqlSession session, DailyImg di);
	int insertDailyCoords(SqlSession session, DailyCoord dc);
	String selectProductNo(SqlSession session, String name);
	ProductImg selectDailyProduct(SqlSession session, String productNo);
	List<Product> selectProductName(SqlSession session,String key);
	List<Product> selectProductAll(SqlSession session);
	int insertHashtag(SqlSession session,Hashtag h);
	List<Map> selectDailyAll(SqlSession session);
	List<DailyImg> selectMainImg(SqlSession session);
	List<Hashtag> selectHashAll(SqlSession session);
	Map selectDailyOne(SqlSession session,String dailyNo);
	List<DailyImg> selectDailyImg(SqlSession session,String dailyNo);
	List<Hashtag> selectHashList(SqlSession session,String dailyNo);
	List<Map> selectCoordList(SqlSession session,String dailyNo);
	ProductImg selectProductImg(SqlSession session,String productNo);
	int deleteDaily(SqlSession session,String dailyNo);
}
