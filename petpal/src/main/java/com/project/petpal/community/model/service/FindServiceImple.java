package com.project.petpal.community.model.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.petpal.community.model.dao.FindDao;
import com.project.petpal.community.model.vo.Find;
import com.project.petpal.community.model.vo.FindComment;
import com.project.petpal.community.model.vo.FindImg;

@Service
public class FindServiceImple implements FindService {
	@Autowired 
	public FindDao dao;
	
	@Autowired
	public SqlSession session;

	@Override
	@ResponseBody
	public int insertFindWrite(Find f, List<FindImg> lfi, FindImg fi) {
		// TODO Auto-generated method stub
		int result = dao.insertFindWrite(session, f);
		String findNo = "F" + f.getFindNo();
		if(result>0) {
			System.out.println(findNo);
			fi.setFindNo(findNo);
			result = dao.insertMainPic(session, fi);
			if(lfi!=null) {
				for(FindImg sfi : lfi) {
					sfi.setFindNo(findNo);
					result = dao.insertSubPic(session, sfi);
				}
			}
		}
		return result;
	}

	@Override
	public List<Map> selectFindList(Map map,int cPage,int numPerPage) {
		// TODO Auto-generated method stub
		return dao.selectFindList(session, map ,cPage, numPerPage);
	}
	
	@Override
	public List<Map> selectFindListOne(String memberNo) {
		// TODO Auto-generated method stub
		return dao.selectFindListOne(session, memberNo);
	}

	@Override
	public int findCnt(String memberNo) {
		// TODO Auto-generated method stub
		return dao.findCnt(session, memberNo);
	}

	@Override
	public Map detailOne(String findNo) {
		// TODO Auto-generated method stub
		return dao.detailOne(session, findNo);
	}

	@Override
	public List<Map> findSubPic(String findNo) {
		// TODO Auto-generated method stub
		return dao.findSubPic(session, findNo);
	}

	@Override
	public int updateMainImg(FindImg fi) {
		// TODO Auto-generated method stub
		return dao.updateMainImg(session, fi);
	}

	@Override
	public int deleteFindImg(List<FindImg> fin) {
		int result = 0;
		for(FindImg sfi : fin) {
			result = dao.deleteFindImg(session, sfi);
		}
		return result;
	}

	@Override
	public int insertSubImgs(List<FindImg> fin) {
		// TODO Auto-generated method stub
		int result = 0;
		for(FindImg fi : fin) {
			result = dao.insertSubImgs(session, fi);
		}
		return result;
	}

	@Override
	public int updateOtherFind(Map m) {
		// TODO Auto-generated method stub
		return dao.updateOtherFind(session, m);
	}

	@Override
	public List<String> selectFindLike(String memberNo) {
		// TODO Auto-generated method stub
		return dao.selectFindLike(session, memberNo);
	}

	@Override
	public int deleteFindLike(Map m) {
		// TODO Auto-generated method stub
		return dao.deleteFindLike(session, m);
	}

	@Override
	public int insertFindLike(Map m) {
		// TODO Auto-generated method stub
		return dao.insertFindLike(session,m);
	}

	@Override
	public List<Map> selectFindHeartWeek(int cPage, int numPerPage) {
		// TODO Auto-generated method stub
		return dao.selectFindHeartWeek(session,cPage,numPerPage);
	}

	@Override
	public int deleteFind(String findNo) {
		// TODO Auto-generated method stub
		return dao.deleteFind(session, findNo);
	}

	@Override
	public int findTotalCount() {
		// TODO Auto-generated method stub
		return dao.findTotalCount(session);
	}
	
	@Override
	public List<Map> selectFollowingList(String memberNo) {
		// TODO Auto-generated method stub
		return dao.selectFollowingList(session, memberNo);
	}

	@Override
	public List<Map> selectComment(String findNo, int cPage, int numPerPage) {
		// TODO Auto-generated method stub
		return dao.selectComment(session,findNo,cPage,numPerPage);
	}

	@Override
	public int countComment(String findNo) {
		// TODO Auto-generated method stub
		return dao.countComment(session,findNo);
	}

	@Override
	public int countCommentPage(String findNo) {
		// TODO Auto-generated method stub
		return dao.countCommentPage(session,findNo);
	}

	@Override
	public int insertComment(FindComment fc) {
		// TODO Auto-generated method stub
		return dao.insertComment(session, fc);
	}

	@Override
	public int commentDelete(String findCommentNo) {
		// TODO Auto-generated method stub
		//자기 자신을 참조하는 댓글(=대댓글)이 있다면 상태만 D로 변경
		int result=dao.commentDelete(session,findCommentNo);
		//대댓글이 없다면 댓글 삭제 처리
		if(result<1) {
			result=dao.comment2Delete(session,findCommentNo);
		}		
		return result;
	}

	@Override
	public int comment2Delete(String findCommentNo) {
		// TODO Auto-generated method stub
		return dao.comment2Delete(session, findCommentNo);
	}

	@Override
	public List<Map> selectLikeCount() {
		// TODO Auto-generated method stub
		return dao.selectLikeCount(session);
	}
	
}
