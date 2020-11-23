package com.project.petpal.member.model.dao;

import org.apache.ibatis.session.SqlSession;

import com.project.petpal.member.model.vo.Member;

public interface MemberDao {

	int insertMember(SqlSession session,Member m);
}
