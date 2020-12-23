package com.project.petpal.member.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

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
	public int followCnt(SqlSession session, String memberNo) {
		// TODO Auto-generated method stub
		return session.selectOne("member.followCnt", memberNo);
	}
	@Override
	public int favCnt(SqlSession session, String memberNo) {
		// TODO Auto-generated method stub
		return session.selectOne("member.favCnt", memberNo);
	}

	@Override
	public Map selectMemberOne(SqlSession session, String memberNo) {
		// TODO Auto-generated method stub
		return session.selectOne("member.selectMemberOne", memberNo);
	}



}
