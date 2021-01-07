package com.project.petpal.community.model.dao;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;

public interface ClaimDao {
	int claimCheck(SqlSession session,Map m);
	int insertClaim(SqlSession session,Map m);
}
