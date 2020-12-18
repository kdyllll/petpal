package com.project.petpal.community.model.service;

import java.util.List;

import com.project.petpal.community.model.vo.Place;
import com.project.petpal.community.model.vo.PlaceImg;

public interface PlaceService {

	int insertPlace(Place p,List<PlaceImg> list,String[] hashtag) throws Exception;
	List<Place> placeList(String category);
	Place selectPlace(String placeNo);
}
