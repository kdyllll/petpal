package com.project.petpal.community.model.service;

import java.util.List;
import java.util.Map;

import com.project.petpal.community.model.vo.DailyComment;
import com.project.petpal.community.model.vo.Hashtag;
import com.project.petpal.community.model.vo.Tip;
import com.project.petpal.community.model.vo.TipComment;
import com.project.petpal.community.model.vo.TipImg;

public interface TipService {
	int insertTip(Tip t, List<TipImg> files, List<Hashtag> hashList);
	List<Map> tipList(int cPage,int numPerPage, Map<String,String> keyword);
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
	int totalTipCount(Map keyword);
	List<Map> selectFollowingList(String memberNo);
	List<TipComment> selectComment(String tipNo,int cPage,int numPerPage);
	int countComment(String tipNo);
	int countCommentPage(String tipNo);
	int insertComment(TipComment tc);
	int commentDelete(String tipCommentNo);
	int comment2Delete(String tipCommentNo);
	int tipLikeCount(String tipNo);
	List<Map> tipList(Map keywordMap);
}
