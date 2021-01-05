package com.project.petpal.member.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.project.petpal.community.model.vo.Daily;
import com.project.petpal.community.model.vo.DailyImg;
import com.project.petpal.community.model.vo.Hashtag;
import com.project.petpal.member.model.vo.Member;

public interface MemberDao {

   int insertMember(SqlSession session,Member member);
   Member selectMember(SqlSession session,String email);
   int updatePassword(SqlSession session, Member member);
   int updateMemberEnd(SqlSession session, Member member);
   List<Map> selectMemberAll(SqlSession session);
   int followCnt(SqlSession session, String memberNo);
   int favCnt(SqlSession session, String memberNo);
   Map selectMemberOnee(SqlSession session, String memberNo);
   Member selectMemberOne(SqlSession session, String memberNo);
   int countFollowing(SqlSession session, String memberNo);
   int countFollower(SqlSession session, String memberNo);
   List<DailyImg> selectDailyMain(SqlSession session, String memberNo);
   List<Map> selectTipMain(SqlSession session, String memberNo,int cPage,int numPerPage);
   List<Map> selectPlaceMain(SqlSession session, String memberNo,int cPage,int numPerPage);
   List<Map> selectFindMain(SqlSession session, String memberNo,int cPage,int numPerPage);
   List<Daily> selectDailyList(SqlSession session, String memberNo,int cPage,int numPerPage);
   List<Hashtag> selectDailyHash(SqlSession session, String memberNo);
   int dailyCount(SqlSession session,String memberNo);
   int tipCount(SqlSession session,String memberNo);
   int placeCount(SqlSession session,String memberNo);
   int findCount(SqlSession session,String memberNo);
   Member selectSnsMember(SqlSession session,String id);
   List<Map> selectPaymentList(SqlSession session, Map m);
   Map selectShopDetail(SqlSession session, String detailNo);
   int productRefund(SqlSession session, Map m);
   String getStockNo(SqlSession session, String detailNo);
   String getProductNo(SqlSession session, String stockNo);
   int productChange(SqlSession session, Map m);
   Map selectPayDetail(SqlSession session, String detailNo);
   int selectCnt(SqlSession session,Map m);
   int selectDeliveryCnt(SqlSession session, Map m);
   List<Map> selectPointList(SqlSession session, String memberNo);
   List<Map> selectPaymentListNon(SqlSession session,Map m);
   int selectOrderCheck(SqlSession session,String orderNo);
   int selectCntNon(SqlSession session,Map m);
   int selectDeliveryCntNon(SqlSession session, Map m);
   Member checkNickName(SqlSession session,String nickName);
}