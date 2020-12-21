package com.project.petpal.community.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.project.petpal.community.model.vo.Place;
import com.project.petpal.community.model.vo.PlaceImg;

public interface PlaceDao {

	int insertPlace(SqlSession session,Place p);
	int insertPlaceImg(SqlSession session,PlaceImg pi);
	int insertHashtag(SqlSession session,Map m);
	List<Place> placeList(SqlSession session,String category,int cPage,int numPerpage);
	List<Place> selectPlace(SqlSession session,String placeNo);
	int selectCount(SqlSession session,String category);
	int commentCount(SqlSession session,String placeNo);
	
}
