package com.project.petpal.member.model.dao;

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
   public List<Map> selectMemberAll(SqlSession session) {
      // TODO Auto-generated method stub
      return session.selectList("member.selectMemberAll");
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
		return session.selectOne("place.placeCnt",memberNo);
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
	public Member checkNickName(SqlSession session, String nickName) {
		// TODO Auto-generated method stub
		return session.selectOne("member.checkNickName",nickName);
	}

	
   
   


}
