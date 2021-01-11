package com.project.petpal.community.model.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.project.petpal.community.model.dao.TipDao;
import com.project.petpal.community.model.vo.DailyComment;
import com.project.petpal.community.model.vo.Hashtag;
import com.project.petpal.community.model.vo.Tip;
import com.project.petpal.community.model.vo.TipComment;
import com.project.petpal.community.model.vo.TipImg;

@Service
public class TipServiceImpl implements TipService {
	
	@Autowired
	private SqlSession session;
	
	@Autowired
	private TipDao dao;
	
	@Override
	public int insertTip(Tip t, List<TipImg> files, List<Hashtag> hashList) {
		int result = dao.insertTip(session, t);

		if(result>0) {
			if(files!=null) {
				for(TipImg img: files) {
					img.setTipNo("T" + t.getTipNo());
					result = dao.insertTipImg(session, img);
				}
			}
		}
		
		//해시태그 삽입
		if(result>0) {
			if(hashList.size()!=0) {//해시태그가 있으면
				for(Hashtag h:hashList) {
					h.setPostNo("T" + t.getTipNo());
					result=dao.insertHashtag(session,h);
				}
			}
		}
		
		return result;
	}

	@Override
	public List<Map> tipList(int cPage,int numPerPage, Map<String,String> keyword) {
		return dao.tipList(session, cPage, numPerPage, keyword);
	}
	
	@Override
	public List<Map> tipMainList(String tipNo) {
		return dao.tipMainList(session, tipNo);
	}
	
	@Override
	public List<Map> tipDetail(String tipNo) {
		return dao.tipDetail(session, tipNo);
	}

	@Override
	public int updateTip(Tip t, List<Hashtag> hashList) {
		int result = dao.updateTip(session, t);
		
		//해시태그 삭제
		dao.deleteAllHash(session,t.getTipNo());
		//해시태그 삽입
		if(result>0) {
			if(hashList.size()!=0) {//해시태그가 있으면
				for(Hashtag h:hashList) {
					h.setPostNo(t.getTipNo());
					result=dao.insertHashtag(session,h);
				}
			}
		}
		return result;
	}

	@Override
	public List<Map> selectTipListOne(String memberNo) {
		// TODO Auto-generated method stub
		return dao.selectTipListOne(session, memberNo);
	}

	@Override
	public int tipCnt(String memberNo) {
		// TODO Auto-generated method stub
		return dao.tipCnt(session, memberNo);
	}

	@Override
	public List<Map> selectTipHeartWeek(int cPage, int numPerPage) {
		// TODO Auto-generated method stub
		return dao.selectTipHeartWeek(session,cPage,numPerPage);
	}
	
	@Override
	public List<Map> selectTipHash(int cPage, int numPerPage,String hashtag) {
		// TODO Auto-generated method stub
		return dao.selectTipHash(session,cPage,numPerPage,hashtag);
	}

	@Override
	public int tipDelete(String tipNo) {
		return dao.tipDelete(session, tipNo);
	}

	@Override
	public int updateMainImg(TipImg ti) {
		return dao.updateMainImg(session, ti);
	}

	@Override
	public int deleteTipImg(TipImg ti) {
		return dao.deleteTipImg(session, ti);
	}

	@Override
	public int insertSubImgs(List<TipImg> ti) {
		int result = 0;
		for(TipImg fi : ti) {
			result = dao.insertSubImgs(session, fi);
		}
		return result;
	}

	@Override
	public int updateContent(TipImg ti) {
		return dao.updateContent(session, ti);
	}

	@Override
	public List<Map> selectMember(String writerNo) {
		return dao.selectMember(session, writerNo);
	}

	@Override
	public List<String> selectTipLike(String memberNo) {
		// TODO Auto-generated method stub
		return dao.selectTipLike(session, memberNo);
	}

	@Override
	public int insertLike(Map m) {
		// TODO Auto-generated method stub
		return dao.insertLike(session, m);
	}

	@Override
	public int deleteLike(Map m) {
		// TODO Auto-generated method stub
		return dao.deleteLike(session, m);
	}
	
	@Override
	public List<Hashtag> selectHashList(String tipNo) {
		// TODO Auto-generated method stub
		return dao.selectHashList(session,tipNo);
	}

	@Override
	public int totalTipCount(Map keyword) {
		// TODO Auto-generated method stub
		return dao.totalTipCount(session,keyword);
	}
	
	@Override
	public List<Map> selectFollowingList(String memberNo) {
		// TODO Auto-generated method stub
		return dao.selectFollowingList(session, memberNo);
	}
	
	@Override
	public List<TipComment> selectComment(String tipNo,int cPage,int numPerPage) {
		// TODO Auto-generated method stub
		return dao.selectComment(session,tipNo,cPage,numPerPage);
	}

	@Override
	public int countComment(String tipNo) {
		// TODO Auto-generated method stub
		return dao.countComment(session,tipNo);
	}
	
	@Override
	public int countCommentPage(String tipNo) {
		// TODO Auto-generated method stub
		return dao.countCommentPage(session,tipNo);
	}

	@Override
	public int insertComment(TipComment tc) {
		// TODO Auto-generated method stub
		return dao.insertComment(session,tc);
	}

	@Override
	@Transactional
	public int commentDelete(String tipCommentNo) {
		// TODO Auto-generated method stub
		//자기 자신을 참조하는 댓글(=대댓글)이 있다면 상태만 D로 변경
		int result=dao.commentDelete(session,tipCommentNo);
		//대댓글이 없다면 댓글 삭제 처리
		if(result<1) {
			result=dao.comment2Delete(session,tipCommentNo);
		}		
		return result;
	}

	@Override
	public int comment2Delete(String tipCommentNo) {
		// TODO Auto-generated method stub
		return dao.comment2Delete(session,tipCommentNo);
	}

	@Override
	public int tipLikeCount(String tipNo) {
		// TODO Auto-generated method stub
		return dao.tipLikeCount(session, tipNo);
	}

	@Override
	public List<Map> selectTipDate(int cPage, int numPerPage, Map<String,String> keyword) {
		// TODO Auto-generated method stub
		return dao.selectTipDate(session, cPage, numPerPage, keyword);
	}

	@Override
	public List<Map> selectTipHeart(int cPage, int numPerPage, Map<String,String> keyword) {
		// TODO Auto-generated method stub
		return dao.selectTipHeart(session, cPage, numPerPage, keyword);
	}

	@Override
	public List<Map> selectTipComment(int cPage, int numPerPage, Map<String,String> keyword) {
		// TODO Auto-generated method stub
		return dao.selectTipComment(session, cPage, numPerPage, keyword);
	}
	
	@Override
	public List<Map> selectTipFollow(int cPage, int numPerPage, Map<String,String> keyword) {
		// TODO Auto-generated method stub
		return dao.selectTipFollow(session, cPage, numPerPage, keyword);
	}

}
