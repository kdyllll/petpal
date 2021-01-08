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

	@Override
	public Member selectSnsMember(String id) {
		// TODO Auto-generated method stub
		return dao.selectSnsMember(session,id);	
	}
	
	@Override
	public List<Map> selectPaymentList(Map m) {
		// TODO Auto-generated method stub
		return dao.selectPaymentList(session, m);
	}

	@Override
	public Map selectShopDetail(String detailNo) {
		// TODO Auto-generated method stub
		return dao.selectShopDetail(session, detailNo);
	}

	@Override
	public int productRefund(Map m) {
		// TODO Auto-generated method stub
		return dao.productRefund(session, m);
	}

	@Override
	public String getStockNo(String detailNo) {
		// TODO Auto-generated method stub
		return dao.getStockNo(session, detailNo);
	}

	@Override
	public String getProductNo(String stockNo) {
		// TODO Auto-generated method stub
		return dao.getProductNo(session, stockNo);
	}

	@Override
	public int productChange(Map m) {
		// TODO Auto-generated method stub
		return dao.productChange(session, m);
	}

	@Override
	public Map selectPayDetail(String detailNo) {
		// TODO Auto-generated method stub
		return dao.selectPayDetail(session, detailNo);
	}

	@Override
	public int selectCnt(Map m) {
		// TODO Auto-generated method stub
		return dao.selectCnt(session, m);
	}

	@Override
	public int selectDeliveryCnt(Map m) {
		// TODO Auto-generated method stub
		return dao.selectDeliveryCnt(session, m);
	}

	@Override
	public List<Map> selectPointList(String memberNo) {
		// TODO Auto-generated method stub
		return dao.selectPointList(session,memberNo);
	}

	@Override
	public List<Map> selectPaymentListNon(Map m) {
		// TODO Auto-generated method stub
		return dao.selectPaymentListNon(session,m);
	}

	@Override
	public int selectOrderCheck(String orderNo) {
		// TODO Auto-generated method stub
		return dao.selectOrderCheck(session,orderNo);
	}
	
	@Override
	public Member checkNickName(String nickName) {
		// TODO Auto-generated method stub
		return dao.checkNickName(session,nickName);
	}
	   
	@Override
	public int selectCntNon(Map m) {
		// TODO Auto-generated method stub
		return dao.selectCntNon(session, m);
	}

	@Override
	public int selectDeliveryCntNon(Map m) {
		// TODO Auto-generated method stub
		return dao.selectDeliveryCntNon(session, m);
	}

	@Override
	public List<Map> selectDailyLikeList(String memberNo) {
		// TODO Auto-generated method stub
		return dao.selectDailyLikeList(session, memberNo);
	}

	@Override
	public List<Map> selectFindLikeList(String memberNo) {
		// TODO Auto-generated method stub
		return dao.selectFindLikeList(session, memberNo);
	}

	@Override
	public List<Map> selectPlaceLikeList(String memberNo) {
		// TODO Auto-generated method stub
		return dao.selectPlaceLikeList(session, memberNo);
	}

	@Override
	public List<Map> selectTipLikeList(String memberNo) {
		// TODO Auto-generated method stub
		return dao.selectTipLikeList(session, memberNo);
	}

	@Override
	public List<Map> selectFollowing(String memberNo, int cPage, int numPerPage) {
		// TODO Auto-generated method stub
		return dao.selectFollowing(session,memberNo,cPage,numPerPage);
	}
	
	@Override
	public List<Map> selectFollower(String memberNo, int cPage, int numPerPage) {
		// TODO Auto-generated method stub
		return dao.selectFollower(session,memberNo,cPage,numPerPage);
	}
	
	@Override
	public int followingCount(String memberNo) {
		// TODO Auto-generated method stub
		return dao.followingCount(session,memberNo);
	}
	
	@Override
	public int followerCount(String memberNo) {
		// TODO Auto-generated method stub
		return dao.followerCount(session,memberNo);
	}

	@Override
	public String selectNList(String memberNo) {
		// TODO Auto-generated method stub
		return dao.selectNList(session, memberNo);
	}
	@Override
	public String selectIList(String memberNo) {
		// TODO Auto-generated method stub
		return dao.selectIList(session, memberNo);
	}
	@Override
	public String selectMList(String memberNo) {
		// TODO Auto-generated method stub
		return dao.selectMList(session, memberNo);
	}

	@Override
	public int insertFollow(String memberNo, String writerNo) {
		// TODO Auto-generated method stub
		return dao.insertFollow(session, memberNo, writerNo);
	}

	@Override
	public List<Map> selectFollow(String memberNo, String writerNo) {
		// TODO Auto-generated method stub
		return dao.selectFollow(session, memberNo, writerNo);
	}

	@Override
	public int deleteFollow(String memberNo, String writerNo) {
		// TODO Auto-generated method stub
		return dao.deleteFollow(session, memberNo, writerNo);
	}

	@Override
	public String selectIdCheck(Map m) {
		// TODO Auto-generated method stub
		return dao.selectIdCheck(session,m);
	}
	
	
}
