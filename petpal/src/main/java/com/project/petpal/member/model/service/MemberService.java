package com.project.petpal.member.model.service;

import com.project.petpal.member.model.vo.Member;

public interface MemberService {

	int insertMember(Member member);
	Member selectMember(String email);
	int updatePassword(Member member);
	int updateMemberEnd(Member member);
}
