package com.project.petpal.community.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.project.petpal.community.model.dao.PlaceDao;
import com.project.petpal.community.model.vo.Hashtag;
import com.project.petpal.community.model.vo.Place;
import com.project.petpal.community.model.vo.PlaceComment;
import com.project.petpal.community.model.vo.PlaceImg;

@Service
public class PlaceServiceImpl implements PlaceService{
	
	@Autowired
	private PlaceDao dao;
	
	@Autowired
	private SqlSession session;

	@Transactional
	@Override
	public int insertPlace(Place p, List<PlaceImg> list, String[] hashtag) throws Exception {
		
		int result=dao.insertPlace(session,p);//게시판
		
		for(int i=0;i<list.size();i++) {
			PlaceImg pi=list.get(i);
			if(i==0) {//첫번째 사진만 M설정
				pi.setType("M");
			}
			pi.setPlaceNo(p.getPlaceNo());
			 result=dao.insertPlaceImg(session,pi);//이미지
		}
		
		if(hashtag!=null) {
			Map m=new HashMap();
			m.put("postNo",p.getPlaceNo());
			for(String h: hashtag) {
				m.put("hashContent", h);
				result=dao.insertHashtag(session,m);//해시태그
			}
		}
		
		return result;
		}

	@Override
	public List<Place> placeList(String category,int cPage,int numPerpage) {
		return dao.placeList(session,category,cPage,numPerpage);
	}

	@Override
	public List<Place> selectPlace(String placeNo) {
		return dao.selectPlace(session,placeNo);
	}

	@Override
	public int selectCount(String category) {
		return dao.selectCount(session,category);
	}

	@Override
	public int commentCount(String placeNo) {
		return dao.commentCount(session,placeNo);
	}

	@Override
	public int insertComment(PlaceComment pc){
		return dao.insertComment(session,pc);
	}

	@Override
	public List<PlaceComment> commentList(String placeNo,int cPage,int numPerpage) {
		return dao.commentList(session,placeNo,cPage,numPerpage);
	}

	@Override
	public List<Hashtag> hashList(String placeNo){
		return dao.hashList(session,placeNo);
	}

	@Override
	public List<Map> selectPlaceListOne(String memberNo) {
		// TODO Auto-generated method stub
		return dao.selectPlaceListOne(session, memberNo);
	}

	@Override
	public int placeCnt(String memberNo) {
		// TODO Auto-generated method stub
		return dao.placeCnt(session, memberNo);
	}

}
