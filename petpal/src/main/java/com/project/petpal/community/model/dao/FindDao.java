package com.project.petpal.community.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.project.petpal.community.model.vo.DailyComment;
import com.project.petpal.community.model.vo.Find;
import com.project.petpal.community.model.vo.FindComment;
import com.project.petpal.community.model.vo.FindImg;

public interface FindDao {
	int insertFindWrite(SqlSession session, Find f);
	int insertMainPic(SqlSession session, FindImg fi);
	int insertSubPic(SqlSession session, FindImg sfi);
	List<Map> selectFindList(SqlSession session,Map map,int cPage,int numPerPage);
	List<Map> selectFindListOne(SqlSession session, String memberNo);
	int findCnt(SqlSession session, String memberNo);
	Map detailOne(SqlSession session, String findNo);
	List<Map> findSubPic(SqlSession session, String findNo);
	int updateMainImg(SqlSession session, FindImg fi);
	int deleteFindImg(SqlSession session, FindImg fin);
	int insertSubImgs(SqlSession session, FindImg fin);
	int updateOtherFind(SqlSession session, Map m);
	List<String> selectFindLike(SqlSession session, String memberNo);
	int deleteFindLike(SqlSession session,Map m);
	int insertFindLike(SqlSession session, Map m);
	List<Map> selectFindHeartWeek(SqlSession session,int cPage,int numPerPage);
	int deleteFind(SqlSession session, String findNo);
	int findTotalCount(SqlSession session);
	List<Map> selectFollowingList(SqlSession session, String memberNo);
	List<Map> selectComment(SqlSession session,String findNo,int cPage,int numPerPage);
	int countComment(SqlSession session,String findNo);
	int countCommentPage(SqlSession session,String findNo);
	int insertComment(SqlSession session, FindComment fc);
	int commentDelete(SqlSession session,String findCommentNo);
	int comment2Delete(SqlSession session,String findCommentNo);
	List<Map> selectLikeCount(SqlSession session);
	List<Map> selectFindAll(SqlSession session,Map keywords);
	int findTotalCount(SqlSession session,Map keywords);
}
