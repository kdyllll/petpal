package com.project.petpal.community.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.project.petpal.community.model.vo.Tip;
import com.project.petpal.community.model.vo.TipImg;

@Repository
public class TipDaoImpl implements TipDao {

	@Override
	public int insertTip(SqlSession session, Tip t) {
		return session.insert("tip.insertTip", t);
	}

	@Override
	public int insertTipImg(SqlSession session, TipImg ti) {
		return session.insert("tip.insertTipImg", ti);
	}

	@Override
	public List<Map> tipList(SqlSession session) {
		return session.selectList("tip.tipList");
	}
	
	@Override
	public List<Map> tipMainList(SqlSession session, String tipNo) {
		return session.selectList("tip.tipMainList", tipNo);
	}

	@Override
	public List<Map> tipDetail(SqlSession session, String tipNo) {
		return session.selectList("tip.tipDetail", tipNo);
	}
}
