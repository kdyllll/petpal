package com.project.petpal.community.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.project.petpal.community.model.vo.Hashtag;
import com.project.petpal.community.model.vo.Place;
import com.project.petpal.community.model.vo.PlaceComment;
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
	public List<Place> placeList(SqlSession session,int cPage,int numPerpage,Map<String,String> keyword) {
		return session.selectList("place.placeList",keyword,new RowBounds((cPage-1)*numPerpage,numPerpage));
	}

	@Override
	public List<Place> selectPlace(SqlSession session, String placeNo) {
		return session.selectList("place.selectPlace",placeNo);
	}

	@Override
	public int selectCount(SqlSession session,Map<String,String> keyword) {
		return session.selectOne("place.selectCount",keyword);
	}

	@Override
	public int commentCount(SqlSession session,String placeNo) {
		return session.selectOne("place.commentCount",placeNo);
	}

	@Override
	public int insertComment(SqlSession session, PlaceComment pc) {
		return session.insert("place.insertComment",pc);
	}

	@Override
	public List<PlaceComment> commentList(SqlSession session, String placeNo,int cPage,int numPerpage) {
		return session.selectList("place.commentList",placeNo,new RowBounds((cPage-1)*numPerpage,numPerpage));
	}

	@Override
	public List<Hashtag> hashList(SqlSession session, String placeNo) {
		return session.selectList("place.hashList",placeNo);
	}

	@Override
	public List<Map> selectPlaceListOne(SqlSession session, String memberNo) {
		return session.selectList("place.selectPlaceListOne",memberNo);
	}

	@Override
	public int placeCnt(SqlSession session, String memberNo) {
		return session.selectOne("place.placeCnt", memberNo);
	}

	@Override
	public int deletePlaceImg(SqlSession session, String placeNo) {
		return session.delete("place.deletePlaceImg",placeNo);
	}

	@Override
	public int updatePlace(SqlSession session, Place p) {
		return session.update("place.updatePlace",p);
	}

	@Override
	public int deleteHashtag(SqlSession session, String placeNo) {
		return session.delete("place.deleteHashtag",placeNo);
	}

	@Override
	public List<Map> selectPlaceHeartWeek(SqlSession session, int cPage, int numPerPage) {
		// TODO Auto-generated method stub
		RowBounds rb=new RowBounds((cPage-1)*numPerPage,numPerPage);
		return session.selectList("place.selectPlaceHeartWeek",null,rb);
	}
	
	@Override
	public List<Map> selectPlaceHash(SqlSession session, int cPage, int numPerPage,String hashtag) {
		// TODO Auto-generated method stub
		RowBounds rb=new RowBounds((cPage-1)*numPerPage,numPerPage);
		return session.selectList("place.selectPlaceHash",hashtag,rb);
	}

	@Override
	public int deletePlace(SqlSession session, String placeNo) {
		// TODO Auto-generated method stub
		return session.delete("place.deletePlace",placeNo);
	}

	@Override
	public String selectLike(SqlSession session, Map m) {
		// TODO Auto-generated method stub
		return session.selectOne("place.selectLike", m);
	}

	@Override
	public int insertLike(SqlSession session, Map m) {
		// TODO Auto-generated method stub
		return session.insert("place.insertLike", m);
	}

	@Override
	public int deleteLike(SqlSession session,Map m) {
		// TODO Auto-generated method stub
		return session.delete("place.deleteLike", m);
	}
	
	

}
