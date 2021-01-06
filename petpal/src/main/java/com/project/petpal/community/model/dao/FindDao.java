package com.project.petpal.community.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.project.petpal.community.model.vo.Find;
import com.project.petpal.community.model.vo.FindImg;

public interface FindDao {
	int insertFindWrite(SqlSession session, Find f);
	int insertMainPic(SqlSession session, FindImg fi);
	int insertSubPic(SqlSession session, FindImg sfi);
	List<Map> selectFindList(SqlSession session,Map map);
	List<Map> selectFindListOne(SqlSession session, String memberNo);
	int findCnt(SqlSession session, String memberNo);
	Map detailOne(SqlSession session, String findNo);
	List<Map> findSubPic(SqlSession session, String findNo);
	int updateMainImg(SqlSession session, FindImg fi);
	int deleteFindImg(SqlSession session, FindImg fin);
	int insertSubImgs(SqlSession session, FindImg fin);
	int updateOtherFind(SqlSession session, Map m);
	List<String> selectFindLike(SqlSession session, String memberNo);
	int deleteFindLike(SqlSession session, String findNo);
	int insertFindLike(SqlSession session, Map m);
	List<Map> selectFindHeartWeek(SqlSession session,int cPage,int numPerPage);
	int deleteFind(SqlSession session, String findNo);
}
