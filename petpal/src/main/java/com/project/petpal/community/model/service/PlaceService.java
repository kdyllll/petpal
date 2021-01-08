package com.project.petpal.community.model.service;

import java.util.List;
import java.util.Map;

import com.project.petpal.community.model.vo.Hashtag;
import com.project.petpal.community.model.vo.Place;
import com.project.petpal.community.model.vo.PlaceComment;
import com.project.petpal.community.model.vo.PlaceImg;

public interface PlaceService {

	int insertPlace(Place p,List<PlaceImg> list,String[] hashtag) throws Exception;
	List<Place> placeList(int cPage,int numPerpage,Map<String,String> keyword);
	List<Place> selectPlace(String placeNo);
	int selectCount(Map<String,String> keyword);
	int commentCount(String placeNo);
	int insertComment(PlaceComment pc);

	List<Map> selectPlaceListOne(String memberNo);
	int placeCnt(String memberNo);

	List<PlaceComment> commentList(String placeNo,int cPage,int numPerpage);
	List<Hashtag> hashList(String placeNo);
	int updatePlace(Place p,List<PlaceImg> list,String[] hashtag) throws Exception;
	List<Map> selectPlaceHeartWeek(int cPage,int numPerPage);
	List<Map> selectPlaceHash(int cPage,int numPerPage,String hashtag);
	int deletePlace(String placeNo);
	String selectLike(Map m);
	int insertLike(Map m);
	int deleteLike(String placeNo);
}
