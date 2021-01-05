package com.project.petpal.community.model.service;

import java.util.List;
import java.util.Map;

import com.project.petpal.community.model.vo.Tip;
import com.project.petpal.community.model.vo.TipImg;

public interface TipService {
	int insertTip(Tip t, List<TipImg> files);
	List<Map> tipList();
	List<Map> tipMainList(String tipNo);
	List<Map> tipDetail(String tipNo);
	int updateTip(Tip t);
	List<Map> selectTipListOne(String memberNo);
	int tipCnt(String memberNo);
	int tipDelete(String tipNo);
	int updateMainImg(TipImg ti);
	int deleteTipImg(TipImg ti);
	int insertSubImgs(List<TipImg> ti);
	int updateContent(TipImg ti);
}
