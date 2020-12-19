package com.project.petpal.community.model.service;

import java.util.List;

import com.project.petpal.admin.model.vo.Product;
import com.project.petpal.admin.model.vo.ProductImg;
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
	
}
