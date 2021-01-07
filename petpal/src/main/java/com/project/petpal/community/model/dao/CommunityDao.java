package com.project.petpal.community.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

public interface CommunityDao {

	List<String> selectHashList(SqlSession session,String postNo);
}
