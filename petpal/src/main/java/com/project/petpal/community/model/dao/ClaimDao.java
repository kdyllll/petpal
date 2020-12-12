package com.project.petpal.community.model.dao;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;

public interface ClaimDao {

	int insertClaim(SqlSession session,Map m);
}
