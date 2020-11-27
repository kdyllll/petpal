package com.project.petpal.community.model.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.project.petpal.community.model.vo.Daily;
import com.project.petpal.community.model.vo.DailyCoord;
import com.project.petpal.community.model.vo.DailyImg;

@Repository
public class DailyDaoImpl implements DailyDao {

	@Override
	public int insertDaily(SqlSession session, Daily d) {
		return session.insert("daily.insertDaily",d);
	}

	@Override
	public int insertDailyImg(SqlSession session, DailyImg di) {
		return session.insert("daily.insertDailyImg",di);
	}

	@Override
	public int insertDailyCoords(SqlSession session, DailyCoord dc) {
		return session.insert("daily.insertDailyCoords",dc);
	}

}
