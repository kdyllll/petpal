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
	int updateTipImg(SqlSession session, TipImg ti);
}
