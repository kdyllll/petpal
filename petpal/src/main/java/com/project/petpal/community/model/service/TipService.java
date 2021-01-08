package com.project.petpal.community.model.service;

import java.util.List;
import java.util.Map;

import com.project.petpal.community.model.vo.Hashtag;
import com.project.petpal.community.model.vo.Tip;
import com.project.petpal.community.model.vo.TipImg;

public interface TipService {
	int insertTip(Tip t, List<TipImg> files, List<Hashtag> hashList);
	List<Map> tipList();
	List<Map> tipMainList(String tipNo);
	List<Map> tipDetail(String tipNo);
	int updateTip(Tip t, List<Hashtag> hashList);
	List<Map> selectTipListOne(String memberNo);
	int tipCnt(String memberNo);
	List<Map> selectTipHeartWeek(int cPage,int numPerPage);
	List<Map> selectTipHash(int cPage,int numPerPage,String hashtag);
	int tipDelete(String tipNo);
	int updateMainImg(TipImg ti);
	int deleteTipImg(TipImg ti);
	int insertSubImgs(List<TipImg> ti);
	int updateContent(TipImg ti);
	List<Map> selectMember(String writerNo);
	List<String> selectTipLike(String memberNo);
	int insertLike(Map m);
	int deleteLike(Map m);
	List<Hashtag> selectHashList(String tipNo);
}
