package com.project.petpal.community.model.dao;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class ClaimDaoImpl implements ClaimDao {

	
	@Override
	public int claimCheck(SqlSession session, Map m) {
		// TODO Auto-generated method stub
		return session.selectOne("claim.claimCheck",m);
	}

	@Override
	public int insertClaim(SqlSession session, Map m) {
		// TODO Auto-generated method stub
		return session.insert("claim.insertClaim",m);
	}

}
