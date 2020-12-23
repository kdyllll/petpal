package com.project.petpal.member.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.project.petpal.member.model.vo.Member;

public interface MemberDao {

	int insertMember(SqlSession session,Member member);
	Member selectMember(SqlSession session,String email);
	int updatePassword(SqlSession session, Member member);
	int updateMemberEnd(SqlSession session, Member member);
	List<Map> selectMemberAll(SqlSession session);
}
