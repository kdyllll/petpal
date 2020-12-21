package com.project.petpal.community.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.project.petpal.community.model.vo.Place;
import com.project.petpal.community.model.vo.PlaceImg;

@Repository
public class PlaceDaoImpl implements PlaceDao{

	@Override
	public int insertPlace(SqlSession session, Place p) {
		return session.insert("place.insertPlace",p);
	}

	@Override
	public int insertPlaceImg(SqlSession session, PlaceImg pi) {
		return session.insert("place.insertPlaceImg",pi);
	}

	@Override
	public int insertHashtag(SqlSession session, Map m) {
		return session.insert("place.insertHashtag",m);
	}

	@Override
	public List<Place> placeList(SqlSession session,String category) {
		return session.selectList("place.placeList",category);
	}

	@Override
	public Place selectPlace(SqlSession session, String placeNo) {
		return session.selectOne("place.selectPlace",placeNo);
	}

}
