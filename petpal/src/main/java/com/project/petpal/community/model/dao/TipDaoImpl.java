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

	@Override
	public int updateTip(SqlSession session, Tip t) {
		return session.update("tip.updateTip", t);
	}

//	@Override
//	public int updateTipImg(SqlSession session, TipImg ti) {
//		return session.update("tip.updateTipImg", ti);
//	}

	@Override
	public List<Map> selectTipListOne(SqlSession session, String memberNo) {
		// TODO Auto-generated method stub
		return session.selectList("tip.selectTipListOne", memberNo);
	}

	@Override
	public int tipCnt(SqlSession session, String memberNo) {
		// TODO Auto-generated method stub
		return session.selectOne("tip.tipCnt", memberNo);
	}

	@Override
	public int tipDelete(SqlSession session, String tipNo) {
		return session.delete("tip.tipDelete", tipNo);
	}

	@Override
	public int updateMainImg(SqlSession session, TipImg ti) {
		return session.update("tip.updateMainImg", ti);
	}

	@Override
	public int deleteTipImg(SqlSession session, TipImg ti) {
		return session.delete("tip.deleteTipImg", ti);
	}

	@Override
	public int insertSubImgs(SqlSession session, TipImg ti) {
		return session.insert("tip.insertSubImgs", ti);
	}

	@Override
	public int updateContent(SqlSession session, TipImg ti) {
		return session.update("tip.updateContent", ti);
	}
}
