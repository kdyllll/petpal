package com.project.petpal.community.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.project.petpal.admin.model.vo.Product;
import com.project.petpal.admin.model.vo.ProductImg;
import com.project.petpal.community.model.dao.DailyDao;
import com.project.petpal.community.model.vo.Daily;
import com.project.petpal.community.model.vo.DailyCoord;
import com.project.petpal.community.model.vo.DailyImg;
import com.project.petpal.community.model.vo.Hashtag;

@Service
public class DailyServiceImpl implements DailyService {

	@Autowired
	private SqlSession session;
	@Autowired
	private DailyDao dao;
	
	@Override
	@Transactional
	public int insertDaily(Daily d, List<DailyImg> files, List<DailyCoord> coords,List<Hashtag> hashList){
		//글 삽입
		int result=dao.insertDaily(session,d);
		//사진 삽입
		if(result>0) {
			if(files!=null) {//사진이 있을 때
				for(DailyImg di:files) {
					di.setDailyNo(d.getDailyNo());
					result=dao.insertDailyImg(session,di);
					//실패할 경우를 대비해서 result가 0일 때는 분기문으로 강제 exception 처리해야함	
				}
				//좌표 삽입(사진이 있을 때만 좌표 있음!)
				if(result>0) {
					if(coords!=null) {
						for(DailyCoord dc:coords) {
							switch(dc.getIndex()) {
								case "0":dc.setDailyImgNo(files.get(0).getDailyImgNo());break;
								case "1":dc.setDailyImgNo(files.get(1).getDailyImgNo());break;
								case "2":dc.setDailyImgNo(files.get(2).getDailyImgNo());break;
								case "3":dc.setDailyImgNo(files.get(3).getDailyImgNo());break;
								case "4":dc.setDailyImgNo(files.get(4).getDailyImgNo());break;
							}
							result=dao.insertDailyCoords(session,dc);
						}
					}
					//해시태그 삽입
					if(result>0) {
						if(hashList.size()!=0) {//해시태그가 있으면
							for(Hashtag h:hashList) {
								h.setPostNo(d.getDailyNo());
								result=dao.insertHashtag(session,h);
							}
						}
					}
				}
			}
		}
		
		return result;
	}
	
	@Override
	public List<Product> selectProductName(String key) {
		return dao.selectProductName(session,key);
	}

	@Override
	public String selectProductNo(String name) {		
		return dao.selectProductNo(session,name);
	}

	@Override
	public ProductImg selectDailyProduct(String productNo) {
		return dao.selectDailyProduct(session,productNo);
	}

	@Override
	public List<Product> selectProductAll() {
		return dao.selectProductAll(session);
	}

	@Override
	public List<Map> selectDailyAll() {
		// TODO Auto-generated method stub
		return dao.selectDailyAll(session);
	}

	@Override
	public List<DailyImg> selectMainImg() {
		// TODO Auto-generated method stub
		return dao.selectMainImg(session);
	}

	@Override
	public List<Hashtag> selectHashAll() {
		// TODO Auto-generated method stub
		return dao.selectHashAll(session);
	}

	


}
