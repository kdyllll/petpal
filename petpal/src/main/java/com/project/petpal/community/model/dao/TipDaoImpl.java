package com.project.petpal.community.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.project.petpal.community.model.vo.DailyComment;
import com.project.petpal.community.model.vo.Hashtag;
import com.project.petpal.community.model.vo.Tip;
import com.project.petpal.community.model.vo.TipComment;
import com.project.petpal.community.model.vo.TipImg;

@Repository
public class TipDaoImpl implements TipDao {

	@Override
	public int insertTip(SqlSession session, Tip t) {
		return session.insert("tip.insertTip", t);
	}

	@Override
	public int insertTipImg(SqlSession session, TipImg ti) {
		return session.insert("tip.insertTipImg", ti);
	}

	@Override
	public List<Map> tipList(SqlSession session, int cPage,int numPerPage, Map<String,String> keyword) {
		RowBounds rb=new RowBounds((cPage-1)*numPerPage,numPerPage);
		return session.selectList("tip.tipList", keyword, rb);
	}
	
	@Override
	public List<Map> tipMainList(SqlSession session, String tipNo) {
		return session.selectList("tip.tipMainList", tipNo);
	}

	@Override
	public List<Map> tipDetail(SqlSession session, String tipNo) {
		return session.selectList("tip.tipDetail", tipNo);
	}

	@Override
	public int updateTip(SqlSession session, Tip t) {
		return session.update("tip.updateTip", t);
	}

	@Override
	public List<Map> selectTipListOne(SqlSession session, String memberNo) {
		// TODO Auto-generated method stub
		return session.selectList("tip.selectTipListOne", memberNo);
	}

	@Override
	public int tipCnt(SqlSession session, String memberNo) {
		// TODO Auto-generated method stub
		return session.selectOne("tip.tipCnt", memberNo);
	}

	@Override
	public List<Map> selectTipHeartWeek(SqlSession session, int cPage, int numPerPage) {
		// TODO Auto-generated method stub
		RowBounds rb=new RowBounds((cPage-1)*numPerPage,numPerPage);
		return session.selectList("tip.selectTipHeartWeek",null,rb);
	}
	
	@Override
	public List<Map> selectTipHash(SqlSession session, int cPage, int numPerPage,String hashtag) {
		// TODO Auto-generated method stub
		RowBounds rb=new RowBounds((cPage-1)*numPerPage,numPerPage);
		return session.selectList("tip.selectTipHash",hashtag,rb);
	}
	
	@Override
	public int tipDelete(SqlSession session, String tipNo) {
		return session.delete("tip.tipDelete", tipNo);
	}

	@Override
	public int updateMainImg(SqlSession session, TipImg ti) {
		return session.update("tip.updateMainImg", ti);
	}

	@Override
	public int deleteTipImg(SqlSession session, TipImg ti) {
		return session.delete("tip.deleteTipImg", ti);
	}

	@Override
	public int insertSubImgs(SqlSession session, TipImg ti) {
		return session.insert("tip.insertSubImgs", ti);
	}

	@Override
	public int updateContent(SqlSession session, TipImg ti) {
		return session.update("tip.updateContent", ti);
	}

	@Override
	public List<Map> selectMember(SqlSession session, String writerNo) {
		return session.selectList("tip.selectMember", writerNo);
	}

	@Override
	public List<String> selectTipLike(SqlSession session, String memberNo) {
		// TODO Auto-generated method stub
		return session.selectList("tip.selectTipLike", memberNo);
	}

	@Override
	public int insertLike(SqlSession session, Map m) {
		// TODO Auto-generated method stub
		return session.insert("tip.insertLike", m);
	}

	@Override
	public int deleteLike(SqlSession session,Map m) {
		// TODO Auto-generated method stub
		return session.delete("tip.deleteLike", m);
	}
	
	@Override
	public int insertHashtag(SqlSession session, Hashtag h) {
		// TODO Auto-generated method stub
		return session.insert("tip.insertHashtag",h);
	}
	
	@Override
	public List<Hashtag> selectHashList(SqlSession session, String tipNo) {
		// TODO Auto-generated method stub
		return session.selectList("tip.selectHashList",tipNo);
	}
	
	@Override
	public int deleteAllHash(SqlSession session, String tipNo) {
		// TODO Auto-generated method stub
		return session.delete("tip.deleteAllHash",tipNo);
	}

	@Override
	public int totalTipCount(SqlSession session,Map keyword) {
		// TODO Auto-generated method stub
		return session.selectOne("tip.totalTipCount",keyword);
	}
	
	@Override
	public List<Map> selectFollowingList(SqlSession session, String memberNo) {
		// TODO Auto-generated method stub
		return session.selectList("follow.selectFollowing", memberNo);
	}
	
	@Override
	public List<TipComment> selectComment(SqlSession session, String tipNo, int cPage, int numPerPage) {
		RowBounds rb=new RowBounds((cPage-1)*numPerPage,numPerPage);
		return session.selectList("tip.selectComment",tipNo,rb);
	}

	@Override
	public int countComment(SqlSession session, String tipNo) {
		// TODO Auto-generated method stub
		return session.selectOne("tip.countComment",tipNo);
	}
	
	@Override
	public int countCommentPage(SqlSession session, String tipNo) {
		// TODO Auto-generated method stub
		return session.selectOne("tip.countCommentPage",tipNo);
	}

	@Override
	public int insertComment(SqlSession session, TipComment tc) {
		// TODO Auto-generated method stub
		return session.insert("tip.insertComment",tc);
	}

	@Override
	public int commentDelete(SqlSession session, String tipCommentNo) {
		// TODO Auto-generated method stub
		return session.update("tip.commentDelete",tipCommentNo);
	}

	@Override
	public int comment2Delete(SqlSession session, String tipCommentNo) {
		// TODO Auto-generated method stub
		return session.delete("tip.comment2Delete",tipCommentNo);
	}

	@Override
	public int tipLikeCount(SqlSession session, String tipNo) {
		// TODO Auto-generated method stub
		return session.selectOne("tip.tipLikeCount", tipNo);
	}

}
