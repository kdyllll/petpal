package com.project.petpal.community.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
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

	@Override
	public int updateTipImg(SqlSession session, TipImg ti) {
		return session.update("tip.updateTipImg", ti);
	}

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
	public List<Map> selectTipHeartWeek(SqlSession session, int cPage, int numPerPage) {
		// TODO Auto-generated method stub
		RowBounds rb=new RowBounds((cPage-1)*numPerPage,numPerPage);
		return session.selectList("tip.selectTipHeartWeek",null,rb);
	}
	
	
}
