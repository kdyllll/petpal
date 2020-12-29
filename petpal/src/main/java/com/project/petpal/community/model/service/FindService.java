package com.project.petpal.community.model.service;

import java.util.List;
import java.util.Map;

import com.project.petpal.community.model.vo.Find;
import com.project.petpal.community.model.vo.FindImg;

public interface FindService {
	int insertFindWrite(Find f, List<FindImg> lfi, FindImg fi);
	List<Map> selectFindList();
	List<Map> selectFindListOne(String memberNo);
	int findCnt(String memberNo);
	Map detailOne(String findNo);
	List<Map> findSubPic(String findNo);
}
