package com.project.petpal.community.model.service;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.petpal.community.model.dao.ClaimDao;

@Service
public class ClaimServiceImpl implements ClaimService {

	@Autowired
	private SqlSession session;
	@Autowired
	private ClaimDao dao;
	
	@Override
	public int claimCheck(Map m) {
		// TODO Auto-generated method stub
		return dao.claimCheck(session,m);
	}

	@Override
	public int insertClaim(Map m) {
		// TODO Auto-generated method stub
		return dao.insertClaim(session,m);
	}

}
