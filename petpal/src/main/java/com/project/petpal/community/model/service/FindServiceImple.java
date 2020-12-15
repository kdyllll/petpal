package com.project.petpal.community.model.service;

import java.util.List;

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
}
