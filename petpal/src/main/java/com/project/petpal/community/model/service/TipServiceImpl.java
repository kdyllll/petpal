package com.project.petpal.community.model.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.petpal.community.model.dao.TipDao;
import com.project.petpal.community.model.vo.Tip;
import com.project.petpal.community.model.vo.TipImg;

@Service
public class TipServiceImpl implements TipService {
	
	@Autowired
	private SqlSession session;
	
	@Autowired
	private TipDao dao;
	
	@Override
	public int insertTip(Tip t, List<TipImg> files) {
		int result = dao.insertTip(session, t);
		if(result>0) {
			if(files!=null) {
				for(TipImg ti: files) {
					ti.setTipImgNo(ti.getTipImgNo());
					result = dao.insertTipImg(session, ti);
				}
			}
		}
		
		return result;
	}

}
