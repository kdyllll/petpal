package com.project.petpal.community.model.service;

import java.util.List;
import java.util.Map;

import com.project.petpal.community.model.vo.Find;
import com.project.petpal.community.model.vo.FindImg;

public interface FindService {
	int insertFindWrite(Find f, List<FindImg> lfi, FindImg fi);
	List<Map> selectFindList(Map map);
	List<Map> selectFindListOne(String memberNo);
	int findCnt(String memberNo);
	Map detailOne(String findNo);
	List<Map> findSubPic(String findNo);
	int updateMainImg(FindImg fi);
	int deleteFindImg(List<FindImg> fin);
	int insertSubImgs(List<FindImg> fin);
	int updateOtherFind(Map m);
	List<String> selectFindLike(String memberNo);
	int deleteFindLike(String findNo);
	int insertFindLike(Map m);
	List<Map> selectFindHeartWeek(int cPage,int numPerPage);
	int deleteFind(String findNo);
}
