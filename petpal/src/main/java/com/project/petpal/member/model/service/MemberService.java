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
   List<Map> selectMemberAll(int cPage,int numPerPage);
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
   List<Map> selectPaymentList(Map m);
   Map selectShopDetail(String detailNo);
   int productRefund(Map m);
   String getStockNo(String detailNo);
   String getProductNo(String stockNo);
   int productChange(Map m);
   Map selectPayDetail(String detailNo);
   int selectCnt(Map m);
   int selectDeliveryCnt(Map m);
   List<Map> selectPointList(String memberNo);
   List<Map> selectPaymentListNon(Map m);
   int selectOrderCheck(String orderNo);
   int selectCntNon(Map m);
   int selectDeliveryCntNon(Map m);
   Member checkNickName(String nickName);
   List<Map> selectDailyLikeList(String memberNo);
   List<Map> selectFindLikeList(String memberNo);
   List<Map> selectPlaceLikeList(String memberNo);
   List<Map> selectTipLikeList(String memberNo);
   List<Map> selectFollowing(String memberNo,int cPage,int numPerPage);
   List<Map> selectFollower(String memberNo,int cPage,int numPerPage);
   int followingCount(String memberNo);
   int followerCount(String memberNo);
   String selectNList(String memberNo);
   String selectIList(String memberNo);
   String selectMList(String memberNo);
   int insertFollow(String memberNo, String writerNo);
   List<Map> selectFollow(String memberNo, String writerNo);
   int deleteFollow(String memberNo, String writerNo);
}