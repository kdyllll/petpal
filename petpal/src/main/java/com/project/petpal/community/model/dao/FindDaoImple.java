package com.project.petpal.community.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.project.petpal.community.model.vo.Find;
import com.project.petpal.community.model.vo.FindImg;

@Repository
public class FindDaoImple implements FindDao {

	@Override
	public int insertFindWrite(SqlSession session, Find f) {
		// TODO Auto-generated method stub
		return session.insert("find.insertFindWrite",f);
	}

	@Override
	public int insertMainPic(SqlSession session, FindImg fi) {
		// TODO Auto-generated method stub
		return session.insert("find.insertFindPic",fi);
	}

	@Override
	public int insertSubPic(SqlSession session, FindImg sfi) {
		// TODO Auto-generated method stub
		return session.insert("find.insertFindPic", sfi);
	}

	@Override
	public List<Map> selectFindList(SqlSession session,Map map) {
		// TODO Auto-generated method stub
		return session.selectList("find.selectFindList", map);
	}
	
	@Override
	public List<Map> selectFindListOne(SqlSession session, String memberNo) {
		// TODO Auto-generated method stub
		return session.selectList("find.selectFindListOne", memberNo);
	}

	@Override
	public int findCnt(SqlSession session, String memberNo) {
		// TODO Auto-generated method stub
		return session.selectOne("find.findCnt", memberNo);
	}

	@Override
	public Map detailOne(SqlSession session, String findNo) {
		// TODO Auto-generated method stub
		return session.selectOne("find.detailOne", findNo);
	}

	@Override
	public List<Map> findSubPic(SqlSession session, String findNo) {
		// TODO Auto-generated method stub
		return session.selectList("find.findSubPic", findNo);
	}

	@Override
	public int updateMainImg(SqlSession session, FindImg fi) {
		// TODO Auto-generated method stub
		return session.update("find.updateMainImg", fi);
	}

	@Override
	public int deleteFindImg(SqlSession session, FindImg fin) {
		// TODO Auto-generated method stub
		return session.delete("find.deleteFindImg", fin);
	}

	@Override
	public int insertSubImgs(SqlSession session, FindImg fin) {
		// TODO Auto-generated method stub
		return session.insert("find.insertFindPic", fin);
	}

	@Override
	public int updateOtherFind(SqlSession session, Map m) {
		// TODO Auto-generated method stub
		return session.update("find.updateOtherFind", m);
	}

	@Override
	public List<String> selectFindLike(SqlSession session, String memberNo) {
		// TODO Auto-generated method stub
		return session.selectList("find.selectFindLike", memberNo);
	}

	@Override
	public int deleteFindLike(SqlSession session, String findNo) {
		// TODO Auto-generated method stub
		return session.delete("find.deleteFindLike", findNo);
	}

	@Override
	public int insertFindLike(SqlSession session, Map m) {
		// TODO Auto-generated method stub
		return session.insert("find.insertFindLike", m);
	}

	@Override
	public List<Map> selectFindHeartWeek(SqlSession session, int cPage, int numPerPage) {
		// TODO Auto-generated method stub
		RowBounds rb=new RowBounds((cPage-1)*numPerPage,numPerPage);
		return session.selectList("find.selectFindHeartWeek",null,rb);
	}

	@Override
	public int deleteFind(SqlSession session, String findNo) {
		// TODO Auto-generated method stub
		return session.delete("find.deleteFind", findNo);
	}

	
	
}
