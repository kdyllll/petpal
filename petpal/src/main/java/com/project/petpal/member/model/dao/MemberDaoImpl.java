package com.project.petpal.member.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.project.petpal.community.model.vo.DailyImg;
import com.project.petpal.member.model.vo.Member;

@Repository
public class MemberDaoImpl implements MemberDao {

	@Override
	public int insertMember(SqlSession session, Member member) {
		return session.insert("member.insertMember",member);
	}

	@Override
	public Member selectMember(SqlSession session, String email) {
		// TODO Auto-generated method stub
		return session.selectOne("member.selectMember",email);
	}

	@Override
	public int updatePassword(SqlSession session, Member member) {
		// TODO Auto-generated method stub
		return session.update("member.updatePassword", member);
	}

	@Override
	public int updateMemberEnd(SqlSession session, Member member) {
		// TODO Auto-generated method stub
		return session.update("member.updateMemberEnd", member);
	}

	@Override
	public List<Map> selectMemberAll(SqlSession session) {
		// TODO Auto-generated method stub
		return session.selectList("member.selectMemberAll");
	}

	@Override
	public Member selectMemberOne(SqlSession session, String memberNo) {
		// TODO Auto-generated method stub
		return session.selectOne("member.selectMemberOne",memberNo);
	}

	@Override
	public int countFollowing(SqlSession session, String memberNo) {
		// TODO Auto-generated method stub
		return session.selectOne("member.countFollowing",memberNo);
	}

	@Override
	public int countFollower(SqlSession session, String memberNo) {
		// TODO Auto-generated method stub
		return session.selectOne("member.countFollower",memberNo);
	}

	@Override
	public List<DailyImg> selectDailyMain(SqlSession session, String memberNo) {
		// TODO Auto-generated method stub
		return session.selectList("member.selectDailyMain",memberNo);
	}

	@Override
	public List<Map> selectTipMain(SqlSession session, String memberNo) {
		// TODO Auto-generated method stub
		return session.selectList("member.selectTipMain",memberNo);
	}

	@Override
	public List<Map> selectPlaceMain(SqlSession session, String memberNo) {
		// TODO Auto-generated method stub
		return session.selectList("member.selectPlaceMain",memberNo);
	}

	@Override
	public List<Map> selectFindMain(SqlSession session, String memberNo) {
		// TODO Auto-generated method stub
		return session.selectList("member.selectFindMain",memberNo);
	}
	
	

}
