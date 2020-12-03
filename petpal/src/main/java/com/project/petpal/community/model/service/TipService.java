package com.project.petpal.community.model.service;

import java.util.List;
import java.util.Map;

import com.project.petpal.community.model.vo.Tip;
import com.project.petpal.community.model.vo.TipImg;

public interface TipService {
//	int insertTip(Tip t, TipImg ti, List<TipImg> files);
	int insertTip(Tip t, List<TipImg> files);
	List<Map> tipList();
	List<Map> tipMainList(String tipNo);
	List<Map> tipDetail(String tipNo);
}
