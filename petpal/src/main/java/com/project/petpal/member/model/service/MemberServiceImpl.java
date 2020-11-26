package com.project.petpal.member.model.service;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.petpal.member.model.dao.MemberDao;
import com.project.petpal.member.model.vo.Member;

@Service
public class MemberServiceImpl implements MemberService{

	@Autowired
	private MemberDao dao;
	
	@Autowired
	private SqlSession session;
	
	@Override
	public int insertMember(Member member) {
		// TODO Auto-generated method stub
		return dao.insertMember(session,member);
	}

	@Override
	public Member selectMember(String email) {
		// TODO Auto-generated method stub
		return dao.selectMember(session,email);
	}

}
