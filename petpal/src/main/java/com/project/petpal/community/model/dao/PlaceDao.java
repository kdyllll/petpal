package com.project.petpal.community.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.project.petpal.community.model.vo.Hashtag;
import com.project.petpal.community.model.vo.Place;
import com.project.petpal.community.model.vo.PlaceComment;
import com.project.petpal.community.model.vo.PlaceImg;

public interface PlaceDao {

	int insertPlace(SqlSession session,Place p);
	int insertPlaceImg(SqlSession session,PlaceImg pi);
	int insertHashtag(SqlSession session,Map m);
	List<Place> placeList(SqlSession session,String category,int cPage,int numPerpage);
	List<Place> selectPlace(SqlSession session,String placeNo);
	int selectCount(SqlSession session,String category);
	int commentCount(SqlSession session,String placeNo);
	int insertComment(SqlSession session,PlaceComment pc);

	List<Map> selectPlaceListOne(SqlSession session, String memberNo);
	int placeCnt(SqlSession session, String memberNo);

	List<PlaceComment> commentList(SqlSession session,String placeNo,int cPage,int numPerpage);
	List<Hashtag> hashList(SqlSession session,String placeNo);
	int deletePlaceImg(SqlSession session,String placeNo);
	int updatePlace(SqlSession session,Place p);
	int deleteHashtag(SqlSession session,String placeNo);
	List<Map> selectPlaceHeartWeek(SqlSession session,int cPage,int numPerPage);
	List<Map> selectPlaceHash(SqlSession session,int cPage,int numPerPage,String hashtag);
}
