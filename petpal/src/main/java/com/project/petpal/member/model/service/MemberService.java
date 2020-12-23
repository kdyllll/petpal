package com.project.petpal.member.model.service;

import java.util.List;
import java.util.Map;

import com.project.petpal.member.model.vo.Member;

public interface MemberService {

	int insertMember(Member member);
	Member selectMember(String email);
	int updatePassword(Member member);
	int updateMemberEnd(Member member);
	List<Map> selectMemberAll();
	int followCnt(String memberNo);
	int favCnt(String memberNo);
	Map selectMemberOne(String memberNo);
}
