package com.project.petpal.community.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class CommunityDaoImpl implements CommunityDao {

	@Override
	public List<String> selectHashList(SqlSession session, String postNo) {
		// TODO Auto-generated method stub
		return session.selectList("community.selectHashList",postNo);
	}

	
}
