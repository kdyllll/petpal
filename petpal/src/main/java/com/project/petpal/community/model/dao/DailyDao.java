package com.project.petpal.community.model.dao;

import org.apache.ibatis.session.SqlSession;

import com.project.petpal.community.model.vo.Daily;
import com.project.petpal.community.model.vo.DailyCoord;
import com.project.petpal.community.model.vo.DailyImg;

public interface DailyDao {
	int insertDaily(SqlSession session, Daily d);
	int insertDailyImg(SqlSession session, DailyImg di);
	int insertDailyCoords(SqlSession session, DailyCoord dc);
}
