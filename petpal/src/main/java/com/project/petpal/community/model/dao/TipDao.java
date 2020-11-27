package com.project.petpal.community.model.dao;

import org.apache.ibatis.session.SqlSession;

import com.project.petpal.community.model.vo.Tip;
import com.project.petpal.community.model.vo.TipImg;

public interface TipDao {
	int insertTip(SqlSession session, Tip t);
	int insertTipImg(SqlSession session, TipImg ti);
}
