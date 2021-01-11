package com.project.petpal.community.model.service;

import java.util.List;
import java.util.Map;

import com.project.petpal.admin.model.vo.Product;
import com.project.petpal.community.model.vo.Daily;
import com.project.petpal.community.model.vo.DailyComment;
import com.project.petpal.community.model.vo.DailyCoord;
import com.project.petpal.community.model.vo.DailyImg;
import com.project.petpal.community.model.vo.Hashtag;
import com.project.petpal.store.model.vo.ProductImg;

public interface DailyService {

	int insertDaily(Daily d,List<DailyImg> files,List<DailyCoord> coords,List<Hashtag> hashList);
	String selectProductNo(String name);
	ProductImg selectDailyProduct(String productNo);
	List<Product> selectProductName(String key);
	List<Product> selectProductAll();
	List<Map> selectDailyAll(int cPage,int numPerPage,Map<String,String> keyword);
	List<DailyImg> selectMainImg();
	List<Hashtag> selectHashAll();
	Map selectDailyOne(String dailyNo);
	List<DailyImg> selectDailyImg(String dailyNo);
	List<Hashtag> selectHashList(String dailyNo);
	List<Map> selectCoordList(String dailyNo);
	ProductImg selectProductImg(String productNo);
	int deleteDaily(String dailyNo);
	List<Map> selectDailyListOne(String memberNo);
	int dailyCnt(String memberNo);
	int totalDailyCount(Map<String,String> keyword);
	int updateDaily(Daily d,List<Hashtag> hashList,List<DailyCoord> coords,List<Map> fileList,List<DailyImg> updateFile,List<DailyImg> newFile);
	List<DailyComment> selectComment(String dailyNo,int cPage,int numPerPage);
	int countComment(String dailyNo);
	int countCommentPage(String dailyNo);
	int insertComment(DailyComment dc);
	int commentDelete(String dailyCommentNo);
	int comment2Delete(String dailyCommentNo);
	List<Map> selectDailyHeart(int cPage,int numPerPage);
	List<Map> selectDailyFollow(int cPage,int numPerPage);
	List<Map> selectDailyHeartWeek(int cPage,int numPerPage);
	List<Map> selectDailyHash(int cPage,int numPerPage,String hashtag);
	int insertDailyLike(Map m);
	int deleteDailyLike(Map m);
	List<String> selectDailyLike(String memberNo);
	List<Map> selectFollowingList(String memberNo);
	int selectLikeCnt(String dailyNo);
	int selectCommentCnt(String dailyNo);
	List<Map> selectLikeCount();
}
