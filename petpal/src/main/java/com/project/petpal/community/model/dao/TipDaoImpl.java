package com.project.petpal.community.model.dao;

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

}
