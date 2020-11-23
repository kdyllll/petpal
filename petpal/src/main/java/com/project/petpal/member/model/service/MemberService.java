package com.project.petpal.member.model.service;

import com.project.petpal.member.model.vo.Member;

public interface MemberService {

	int insertMember(Member m);
	Member selectMember(String email);
	
}
