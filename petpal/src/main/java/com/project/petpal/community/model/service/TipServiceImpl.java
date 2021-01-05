package com.project.petpal.community.model.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.petpal.community.model.dao.TipDao;
import com.project.petpal.community.model.vo.FindImg;
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
				for(TipImg img: files) {
					img.setTipNo("T" + t.getTipNo());
					result = dao.insertTipImg(session, img);
				}
			}
		}
		
		return result;
	}

	@Override
	public List<Map> tipList() {
		return dao.tipList(session);
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
	public int updateTip(Tip t) {
		return dao.updateTip(session, t);
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

}
