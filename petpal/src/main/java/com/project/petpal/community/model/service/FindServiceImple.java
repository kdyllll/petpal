package com.project.petpal.community.model.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.petpal.community.model.dao.FindDao;
import com.project.petpal.community.model.vo.Find;
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
	public List<Map> selectFindList(Map map) {
		// TODO Auto-generated method stub
		return dao.selectFindList(session, map);
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
}
