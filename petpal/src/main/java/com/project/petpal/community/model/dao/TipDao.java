package com.project.petpal.community.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.project.petpal.community.model.vo.Hashtag;
import com.project.petpal.community.model.vo.Tip;
import com.project.petpal.community.model.vo.TipComment;
import com.project.petpal.community.model.vo.TipImg;

public interface TipDao {
	int insertTip(SqlSession session, Tip t);
	int insertTipImg(SqlSession session, TipImg ti);
	List<Map> tipList(SqlSession session, int cPage,int numPerPage, Map<String,String> keyword);
	List<Map> tipMainList(SqlSession session, String tipNo);
	List<Map> tipDetail(SqlSession sessio, String tipNo);
	int updateTip(SqlSession session, Tip t);
	List<Map> selectTipListOne(SqlSession session, String memberNo);
	int tipCnt(SqlSession session, String memberNo);
	List<Map> selectTipHeartWeek(SqlSession session,int cPage,int numPerPage);
	List<Map> selectTipHash(SqlSession session,int cPage,int numPerPage,String hashtag);
	int tipDelete(SqlSession session, String tipNo);
	int updateMainImg(SqlSession session, TipImg ti);
	int deleteTipImg(SqlSession session, TipImg ti);
	int insertSubImgs(SqlSession session, TipImg ti);
	int updateContent(SqlSession session, TipImg ti);
	List<Map> selectMember(SqlSession session, String writerNo);
	List<String> selectTipLike(SqlSession session, String memberNo);
	int insertLike(SqlSession session, Map m);
	int deleteLike(SqlSession session, Map m);
	int insertHashtag(SqlSession session,Hashtag h);
	List<Hashtag> selectHashList(SqlSession session,String tipNo);
	int deleteAllHash(SqlSession session,String tipNo);
	int totalTipCount(SqlSession session,Map keyword);
	List<Map> selectFollowingList(SqlSession session, String memberNo);
	List<TipComment> selectComment(SqlSession session,String tipNo,int cPage,int numPerPage);
	int countComment(SqlSession session,String tipNo);
	int countCommentPage(SqlSession session,String tipNo);
	int insertComment(SqlSession session,TipComment tc);
	int commentDelete(SqlSession session,String tipCommentNo);
	int comment2Delete(SqlSession session,String tipCommentNo);
	int tipLikeCount(SqlSession session, String tipNo);
	List<Map> selectTipDate(SqlSession session, int cPage, int numPerPage, Map<String,String> keyword); 
	List<Map> selectTipHeart(SqlSession session, int cPage, int numPerPage, Map<String,String> keyword);
	List<Map> selectTipFollow(SqlSession session, int cPage, int numPerPage, Map<String,String> keyword);
}
