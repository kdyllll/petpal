package com.project.petpal.community.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.project.petpal.community.model.vo.Tip;
import com.project.petpal.community.model.vo.TipImg;

public interface TipDao {
	int insertTip(SqlSession session, Tip t);
	int insertTipImg(SqlSession session, TipImg ti);
	List<Map> tipList(SqlSession session);
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
}
