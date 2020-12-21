package com.project.petpal.community.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.project.petpal.community.model.vo.Find;
import com.project.petpal.community.model.vo.FindImg;

public interface FindDao {
	int insertFindWrite(SqlSession session, Find f);
	int insertMainPic(SqlSession session, FindImg fi);
	int insertSubPic(SqlSession session, FindImg sfi);
	List<Map> selectFindList(SqlSession session);
}
