package com.project.petpal.member.model.dao;

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

}
