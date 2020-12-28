package com.project.petpal.community.model.service;

import java.util.List;
import java.util.Map;

import com.project.petpal.admin.model.vo.Product;
import com.project.petpal.store.model.vo.ProductImg;
import com.project.petpal.community.model.vo.Daily;
import com.project.petpal.community.model.vo.DailyCoord;
import com.project.petpal.community.model.vo.DailyImg;
import com.project.petpal.community.model.vo.Hashtag;

public interface DailyService {

	int insertDaily(Daily d,List<DailyImg> files,List<DailyCoord> coords,List<Hashtag> hashList);
	String selectProductNo(String name);
	ProductImg selectDailyProduct(String productNo);
	List<Product> selectProductName(String key);
	List<Product> selectProductAll();
	List<Map> selectDailyAll();
	List<DailyImg> selectMainImg();
	List<Hashtag> selectHashAll();
	Map selectDailyOne(String dailyNo);
	List<DailyImg> selectDailyImg(String dailyNo);
	List<Hashtag> selectHashList(String dailyNo);
	List<Map> selectCoordList(String dailyNo);
	ProductImg selectProductImg(String productNo);
	int deleteDaily(String dailyNo);
}
