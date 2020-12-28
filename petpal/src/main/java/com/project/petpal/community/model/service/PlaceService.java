package com.project.petpal.community.model.service;

import java.util.List;

import com.project.petpal.community.model.vo.Hashtag;
import com.project.petpal.community.model.vo.Place;
import com.project.petpal.community.model.vo.PlaceComment;
import com.project.petpal.community.model.vo.PlaceImg;

public interface PlaceService {

	int insertPlace(Place p,List<PlaceImg> list,String[] hashtag) throws Exception;
	List<Place> placeList(String category,int cPage,int numPerpage);
	List<Place> selectPlace(String placeNo);
	int selectCount(String category);
	int commentCount(String placeNo);
	int insertComment(PlaceComment pc);
	List<PlaceComment> commentList(String placeNo,int cPage,int numPerpage);
	List<Hashtag> hashList(String placeNo);
	
	
}
