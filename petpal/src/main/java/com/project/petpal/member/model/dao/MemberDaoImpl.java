package com.project.petpal.member.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.project.petpal.community.model.vo.Daily;
import com.project.petpal.community.model.vo.DailyImg;
import com.project.petpal.community.model.vo.Hashtag;
import com.project.petpal.member.model.vo.Member;

@Repository
public class MemberDaoImpl implements MemberDao {

   @Override
   public int insertMember(SqlSession session, Member member) {
      return session.insert("member.insertMember",member);
   }

   @Override
   public Member selectMember(SqlSession session, String email) {
      // TODO Auto-generated method stub
      return session.selectOne("member.selectMember",email);
   }

   @Override
   public int updatePassword(SqlSession session, Member member) {
      // TODO Auto-generated method stub
      return session.update("member.updatePassword", member);
   }

   @Override
   public int updateMemberEnd(SqlSession session, Member member) {
      // TODO Auto-generated method stub
      return session.update("member.updateMemberEnd", member);
   }

   @Override
   public List<Map> selectMemberAll(SqlSession session,  int cPage, int numPerPage) {
      // TODO Auto-generated method stub
	   RowBounds rb = new RowBounds((cPage -1)*numPerPage, numPerPage);
      return session.selectList("member.selectMemberAll", null, rb);
   }


   @Override
   public int followCnt(SqlSession session, String memberNo) {
      // TODO Auto-generated method stub
      return session.selectOne("member.followCnt", memberNo);
   }
   @Override
   public int favCnt(SqlSession session, String memberNo) {
      // TODO Auto-generated method stub
      return session.selectOne("member.favCnt", memberNo);
   }

   @Override
   public Map selectMemberOnee(SqlSession session, String memberNo) {
      // TODO Auto-generated method stub
      return session.selectOne("member.selectMemberOnee", memberNo);
   }



   public Member selectMemberOne(SqlSession session, String memberNo) {
      // TODO Auto-generated method stub
      return session.selectOne("member.selectMemberOne",memberNo);
   }

   @Override
   public int countFollowing(SqlSession session, String memberNo) {
      // TODO Auto-generated method stub
      return session.selectOne("member.countFollowing",memberNo);
   }

   @Override
   public int countFollower(SqlSession session, String memberNo) {
      // TODO Auto-generated method stub
      return session.selectOne("member.countFollower",memberNo);
   }

   @Override
   public List<DailyImg> selectDailyMain(SqlSession session, String memberNo) {
      // TODO Auto-generated method stub
      return session.selectList("member.selectDailyMain",memberNo);
   }

   @Override
   public List<Map> selectTipMain(SqlSession session, String memberNo,int cPage,int numPerPage) {
      // TODO Auto-generated method stub
	   RowBounds rb=new RowBounds((cPage-1)*numPerPage,numPerPage);
      return session.selectList("member.selectTipMain",memberNo,rb);
   }

   @Override
   public List<Map> selectPlaceMain(SqlSession session, String memberNo,int cPage,int numPerPage) {
      // TODO Auto-generated method stub
	   RowBounds rb=new RowBounds((cPage-1)*numPerPage,numPerPage);
      return session.selectList("member.selectPlaceMain",memberNo,rb);
   }

   @Override
   public List<Map> selectFindMain(SqlSession session, String memberNo,int cPage,int numPerPage) {
      // TODO Auto-generated method stub
	   RowBounds rb=new RowBounds((cPage-1)*numPerPage,numPerPage);
      return session.selectList("member.selectFindMain",memberNo,rb);
   }
	
	@Override
	public List<Daily> selectDailyList(SqlSession session, String memberNo,int cPage,int numPerPage) {
		// TODO Auto-generated method stub
		RowBounds rb=new RowBounds((cPage-1)*numPerPage,numPerPage);
		return session.selectList("member.selectDailyList",memberNo,rb);
	}
	
	@Override
	public List<Hashtag> selectDailyHash(SqlSession session, String memberNo) {
		// TODO Auto-generated method stub
		return session.selectList("member.selectDailyHash",memberNo);
	}

	@Override
	public int dailyCount(SqlSession session, String memberNo) {
		// TODO Auto-generated method stub
		return session.selectOne("daily.dailyCnt",memberNo);
	}

	@Override
	public int tipCount(SqlSession session, String memberNo) {
		// TODO Auto-generated method stub
		return session.selectOne("tip.tipCnt",memberNo);
	}

	@Override
	public int placeCount(SqlSession session, String memberNo) {
		// TODO Auto-generated method stub
		return session.selectOne("place.placeCntYes",memberNo);
	}

	@Override
	public int findCount(SqlSession session, String memberNo) {
		// TODO Auto-generated method stub
		return session.selectOne("find.findCnt",memberNo);
	}

	@Override
	public Member selectSnsMember(SqlSession session, String id) {
		// TODO Auto-generated method stub
		return session.selectOne("member.selectSnsMember",id);
	}
	
	@Override
	public List<Map> selectPaymentList(SqlSession session, Map m) {
		// TODO Auto-generated method stub
		return session.selectList("member.selectPaymentList", m);
	}

	@Override
	public Map selectShopDetail(SqlSession session, String detailNo) {
		// TODO Auto-generated method stub
		return session.selectOne("member.selectShopDetail", detailNo);
	}

	@Override
	public int productRefund(SqlSession session,Map m) {
		// TODO Auto-generated method stub
		return session.update("member.productRefund", m);
	}

	@Override
	public String getStockNo(SqlSession session, String detailNo) {
		// TODO Auto-generated method stub
		return session.selectOne("member.getStockNo", detailNo);
	}

	@Override
	public String getProductNo(SqlSession session, String stockNo) {
		// TODO Auto-generated method stub
		return session.selectOne("member.getProductNo", stockNo);
	}

	@Override
	public int productChange(SqlSession session, Map m) {
		// TODO Auto-generated method stub
		return session.update("member.productChange", m);
	}

	@Override
	public Map selectPayDetail(SqlSession session, String detailNo) {
		// TODO Auto-generated method stub
		return session.selectOne("member.selectPayDetail", detailNo);
	}

	@Override
	public int selectCnt(SqlSession session, Map m) {
		// TODO Auto-generated method stub
		return session.selectOne("member.selectCnt", m);
	}

	@Override
	public int selectDeliveryCnt(SqlSession session, Map m) {
		// TODO Auto-generated method stub
		return session.selectOne("member.selectDeliveryCnt", m);
	}

	@Override
	public List<Map> selectPointList(SqlSession session, String memberNo) {
		// TODO Auto-generated method stub
		return session.selectList("member.selectPointList", memberNo);
	}

	@Override
	public List<Map> selectPaymentListNon(SqlSession session, Map m) {
		// TODO Auto-generated method stub
		return session.selectList("member.selectPaymentListNon",m);
	}

	@Override
	public int selectOrderCheck(SqlSession session, String orderNo) {
		// TODO Auto-generated method stub
		return session.selectOne("member.selectOrderCheck",orderNo);
	}

	@Override
	public int selectCntNon(SqlSession session, Map m) {
		// TODO Auto-generated method stub
		return session.selectOne("member.selectCntNon", m);
	}

	@Override
	public int selectDeliveryCntNon(SqlSession session, Map m) {
		// TODO Auto-generated method stub
		return session.selectOne("member.selectDeliveryCntNon", m);
	}

	@Override
	public Member checkNickName(SqlSession session, String nickName) {
		// TODO Auto-generated method stub
		return session.selectOne("member.checkNickName",nickName);
	}

	@Override
	public List<Map> selectDailyLikeList(SqlSession session, String memberNo) {
		// TODO Auto-generated method stub
		return session.selectList("member.selectDailyLikeList", memberNo);
	}

	@Override
	public List<Map> selectFindLikeList(SqlSession session, String memberNo) {
		// TODO Auto-generated method stub
		return session.selectList("member.selectFindLikeList", memberNo);
	}

	@Override
	public List<Map> selectPlaceLikeList(SqlSession session, String memberNo) {
		// TODO Auto-generated method stub
		return session.selectList("member.selectPlaceLikeList", memberNo);
	}

	@Override
	public List<Map> selectTipLikeList(SqlSession session, String memberNo) {
		// TODO Auto-generated method stub
		return session.selectList("member.selectTipLikeList", memberNo);
	}

	@Override
	public List<Map> selectFollowing(SqlSession session, String memberNo, int cPage, int numPerPage) {
		// TODO Auto-generated method stub
		RowBounds rb=new RowBounds((cPage-1)*numPerPage,numPerPage);
	      return session.selectList("follow.selectFollowing",memberNo,rb);
	}
	
	@Override
	public List<Map> selectFollower(SqlSession session, String memberNo, int cPage, int numPerPage) {
		// TODO Auto-generated method stub
		RowBounds rb=new RowBounds((cPage-1)*numPerPage,numPerPage);
		return session.selectList("follow.selectFollower",memberNo,rb);
	}

	@Override
	public int followingCount(SqlSession session, String memberNo) {
		// TODO Auto-generated method stub
		return session.selectOne("follow.followingCnt",memberNo);
	}
   
	@Override
	public int followerCount(SqlSession session, String memberNo) {
		// TODO Auto-generated method stub
		return session.selectOne("follow.followerCnt",memberNo);
	}

	@Override
	public String selectNList(SqlSession session, String memberNo) {
		// TODO Auto-generated method stub
		return session.selectOne("member.selectNList", memberNo);
	}
	@Override
	public String selectIList(SqlSession session, String memberNo) {
		// TODO Auto-generated method stub
		return session.selectOne("member.selectIList", memberNo);
	}
	@Override
	public String selectMList(SqlSession session, String memberNo) {
		// TODO Auto-generated method stub
		return session.selectOne("member.selectMList", memberNo);
	}

	@Override
	public int insertFollow(SqlSession session, String memberNo, String writerNo) {
		// TODO Auto-generated method stub
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("memberNo", memberNo);
		map.put("writerNo", writerNo);
		
		return session.insert("follow.insertFollow", map);
	}

	@Override
	public List<Map> selectFollow(SqlSession session, String memberNo, String writerNo) {
		// TODO Auto-generated method stub
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("memberNo", memberNo);
		map.put("writerNo", writerNo);
		
		return session.selectList("follow.selectFollow", map);
	}

	@Override
	public int deleteFollow(SqlSession session, String memberNo, String writerNo) {
		// TODO Auto-generated method stub
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("memberNo", memberNo);
		map.put("writerNo", writerNo);
		
		return session.delete("follow.deleteFollow", map);
	}

	@Override
	public String selectIdCheck(SqlSession session, Map m) {
		// TODO Auto-generated method stub
		return session.selectOne("member.selectIdCheck",m);
	}

	@Override
	public int checkEmail(SqlSession session, String email) {
		// TODO Auto-generated method stub
		return session.selectOne("member.checkEmail",email);
	}

	@Override
	public int updatePasswordMap(SqlSession session, Map m) {
		// TODO Auto-generated method stub
		return session.update("member.updatePasswordMap",m);
	}
	
	

}
