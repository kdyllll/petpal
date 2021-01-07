package com.project.petpal.community.model.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.petpal.community.model.dao.CommunityDao;

@Service
public class CommunityServiceImpl implements CommunityService{
	@Autowired
	public SqlSession session;
	
	@Autowired
	public CommunityDao dao;

	@Override
	public List<String> selectHashList(String postNo) {
		// TODO Auto-generated method stub
		return dao.selectHashList(session,postNo);
	}
	
	
	
}
