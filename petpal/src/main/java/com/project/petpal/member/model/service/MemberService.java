package com.project.petpal.member.model.service;

import java.util.List;
import java.util.Map;

import com.project.petpal.community.model.vo.DailyImg;
import com.project.petpal.member.model.vo.Member;

public interface MemberService {

   int insertMember(Member member);
   Member selectMember(String email);
   int updatePassword(Member member);
   int updateMemberEnd(Member member);
   List<Map> selectMemberAll();
   int followCnt(String memberNo);
   int favCnt(String memberNo);
   Map selectMemberOnee(String memberNo);
   Member selectMemberOne(String memberNo);
   int countFollowing(String memberNo);
   int countFollower(String memberNo);
   List<DailyImg> selectDailyMain(String memberNo);
   List<Map> selectTipMain(String memberNo);
   List<Map> selectPlaceMain(String memberNo);
   List<Map> selectFindMain(String memberNo);

}