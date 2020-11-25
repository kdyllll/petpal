package com.project.petpal.member.model.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.project.petpal.member.model.vo.Member;

@Repository
public class MemberDaoImpl implements MemberDao {

	@Override
	public int insertMember(SqlSession session, Member m) {
		return session.insert("member");
	}

	@Override
	public Member selectMember(SqlSession session, String email) {
		// TODO Auto-generated method stub
		return session.selectOne("member.selectMember",email);
	}

}
