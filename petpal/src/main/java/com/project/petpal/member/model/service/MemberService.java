package com.project.petpal.member.model.service;

import java.util.List;
import java.util.Map;

import com.project.petpal.community.model.vo.Daily;
import com.project.petpal.community.model.vo.DailyImg;
import com.project.petpal.community.model.vo.Hashtag;
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
   List<Map> selectTipMain(String memberNo,int cPage,int numPerPage);
   List<Map> selectPlaceMain(String memberNo,int cPage,int numPerPage);
   List<Map> selectFindMain(String memberNo,int cPage,int numPerPage);
   List<Daily> selectDailyList(String memberNo,int cPage,int numPerPage);
   List<Hashtag> selectDailyHash(String memberNo);
   int dailyCount(String memberNo);
   int tipCount(String memberNo);
   int placeCount(String memberNo);
   int findCount(String memberNo);
   Member selectSnsMember(String id);
   List<Map> selectPaymentList(String memberNo);
   Map selectShopDetail(String detailNo);
   int productRefund(Map m);
   String getStockNo(String detailNo);
   String getProductNo(String stockNo);
   int productChange(Map m);
   Map selectPayDetail(String detailNo);

}