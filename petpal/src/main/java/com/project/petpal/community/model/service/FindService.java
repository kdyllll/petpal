package com.project.petpal.community.model.service;

import java.util.List;
import java.util.Map;

import com.project.petpal.community.model.vo.DailyComment;
import com.project.petpal.community.model.vo.Find;
import com.project.petpal.community.model.vo.FindComment;
import com.project.petpal.community.model.vo.FindImg;

public interface FindService {
	int insertFindWrite(Find f, List<FindImg> lfi, FindImg fi);
	List<Map> selectFindList(Map map,int cPage,int numPerPage);
	List<Map> selectFindListOne(String memberNo);
	int findCnt(String memberNo);
	Map detailOne(String findNo);
	List<Map> findSubPic(String findNo);
	int updateMainImg(FindImg fi);
	int deleteFindImg(List<FindImg> fin);
	int insertSubImgs(List<FindImg> fin);
	int updateOtherFind(Map m);
	List<String> selectFindLike(String memberNo);
	int deleteFindLike(Map m);
	int insertFindLike(Map m);
	List<Map> selectFindHeartWeek(int cPage,int numPerPage);
	int deleteFind(String findNo);
	int findTotalCount();
	List<Map> selectFollowingList(String memberNo);
	List<Map> selectComment(String findNo,int cPage,int numPerPage);
	int countComment(String findNo);
	int countCommentPage(String findNo);
	int insertComment(FindComment fc);
	int commentDelete(String findCommentNo);
	int comment2Delete(String findCommentNo);
	List<Map> selectLikeCount();
	List<Map> selectFindAll(Map keywords);
	int findTotalCount(Map keywords);
}
