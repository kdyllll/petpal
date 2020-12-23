package com.project.petpal.member.model.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.petpal.community.model.vo.DailyImg;
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

	@Override
	public int updatePassword(Member member) {
		// TODO Auto-generated method stub
		return dao.updatePassword(session, member);
	}

	@Override
	public int updateMemberEnd(Member member) {
		// TODO Auto-generated method stub
		return dao.updateMemberEnd(session, member);
	}

	@Override
	public List<Map> selectMemberAll() {
		// TODO Auto-generated method stub
		return dao.selectMemberAll(session);
	}

	@Override
	public Member selectMemberOne(String memberNo) {
		// TODO Auto-generated method stub
		return dao.selectMemberOne(session,memberNo);
	}

	@Override
	public int countFollowing(String memberNo) {
		// TODO Auto-generated method stub
		return dao.countFollowing(session,memberNo);
	}

	@Override
	public int countFollower(String memberNo) {
		// TODO Auto-generated method stub
		return dao.countFollower(session,memberNo);
	}

	@Override
	public List<DailyImg> selectDailyMain(String memberNo) {
		// TODO Auto-generated method stub
		return dao.selectDailyMain(session,memberNo);
	}

	@Override
	public List<Map> selectTipMain(String memberNo) {
		// TODO Auto-generated method stub
		return dao.selectTipMain(session,memberNo);
	}

	@Override
	public List<Map> selectPlaceMain(String memberNo) {
		// TODO Auto-generated method stub
		return dao.selectPlaceMain(session,memberNo);
	}

	@Override
	public List<Map> selectFindMain(String memberNo) {
		// TODO Auto-generated method stub
		return dao.selectFindMain(session,memberNo);
	}
	
	

}
