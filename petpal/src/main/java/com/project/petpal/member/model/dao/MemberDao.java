package com.project.petpal.member.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.project.petpal.community.model.vo.DailyImg;
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
	List<Map> selectTipMain(SqlSession session, String memberNo);
	List<Map> selectPlaceMain(SqlSession session, String memberNo);
	List<Map> selectFindMain(SqlSession session, String memberNo);

}
