package com.project.petpal.member.model.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.petpal.community.model.vo.Daily;
import com.project.petpal.community.model.vo.DailyImg;
import com.project.petpal.community.model.vo.Hashtag;
import com.project.petpal.member.model.dao.MemberDao;
import com.project.petpal.member.model.vo.Member;

@Service
public class MemberServiceImpl implements MemberService{

   @Autowired
   private MemberDao dao;
   
   @Autowired
   private SqlSession session;
   
   @Override
   public int insertMember(Member member) {
      // TODO Auto-generated method stub
      return dao.insertMember(session,member);
   }

   @Override
   public Member selectMember(String email) {
      // TODO Auto-generated method stub
      return dao.selectMember(session,email);
   }

   @Override
   public int updatePassword(Member member) {
      // TODO Auto-generated method stub
      return dao.updatePassword(session, member);
   }

   @Override
   public int updateMemberEnd(Member member) {
      // TODO Auto-generated method stub
      return dao.updateMemberEnd(session, member);
   }

   @Override
   public List<Map> selectMemberAll() {
      // TODO Auto-generated method stub
      return dao.selectMemberAll(session);
   }


   @Override

   public int followCnt(String memberNo) {
      // TODO Auto-generated method stub
      return dao.followCnt(session, memberNo);
   }
   @Override
   public int favCnt(String memberNo) {
      // TODO Auto-generated method stub
      return dao.favCnt(session, memberNo);
   }

   @Override
   public Map selectMemberOnee(String memberNo) {
      // TODO Auto-generated method stub
      return dao.selectMemberOnee(session, memberNo);
   }



   public Member selectMemberOne(String memberNo) {
      // TODO Auto-generated method stub
      return dao.selectMemberOne(session,memberNo);
   }

   @Override
   public int countFollowing(String memberNo) {
      // TODO Auto-generated method stub
      return dao.countFollowing(session,memberNo);
   }

   @Override
   public int countFollower(String memberNo) {
      // TODO Auto-generated method stub
      return dao.countFollower(session,memberNo);
   }

   @Override
   public List<DailyImg> selectDailyMain(String memberNo) {
      // TODO Auto-generated method stub
      return dao.selectDailyMain(session,memberNo);
   }

   @Override
   public List<Map> selectTipMain(String memberNo,int cPage,int numPerPage) {
      // TODO Auto-generated method stub
      return dao.selectTipMain(session,memberNo,cPage,numPerPage);
   }

   @Override
   public List<Map> selectPlaceMain(String memberNo,int cPage,int numPerPage) {
      // TODO Auto-generated method stub
      return dao.selectPlaceMain(session,memberNo,cPage,numPerPage);
   }

   @Override
   public List<Map> selectFindMain(String memberNo,int cPage,int numPerPage) {
      // TODO Auto-generated method stub
      return dao.selectFindMain(session,memberNo,cPage,numPerPage);
   }


	@Override
	public List<Daily> selectDailyList(String memberNo,int cPage,int numPerPage) {
		// TODO Auto-generated method stub
		return dao.selectDailyList(session,memberNo,cPage,numPerPage);
	}
	
	@Override
	public List<Hashtag> selectDailyHash(String memberNo) {
		// TODO Auto-generated method stub
		return dao.selectDailyHash(session,memberNo);
	}

	@Override
	public int dailyCount(String memberNo) {
		// TODO Auto-generated method stub
		return dao.dailyCount(session,memberNo);
	}

	@Override
	public int tipCount(String memberNo) {
		// TODO Auto-generated method stub
		return dao.tipCount(session,memberNo);
	}

	@Override
	public int placeCount(String memberNo) {
		// TODO Auto-generated method stub
		return dao.placeCount(session,memberNo);
	}

	@Override
	public int findCount(String memberNo) {
		// TODO Auto-generated method stub
		return dao.findCount(session,memberNo);
	}
	   
	


}
