package com.project.petpal.community.model.dao;

import java.util.List;
import java.util.Map;

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
	public List<Map> selectFindList(SqlSession session) {
		// TODO Auto-generated method stub
		return session.selectList("find.selectFindList");
	}
	
}
