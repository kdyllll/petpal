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
		System.out.println(result>0?"글삽입":"글실패");
		//사진 삽입
		if(result>0) {
			if(files!=null) {//사진이 있을 때
				for(DailyImg di:files) {
					di.setDailyNo(d.getDailyNo());
					result=dao.insertDailyImg(session,di);
					//실패할 경우를 대비해서 result가 0일 때는 분기문으로 강제 exception 처리해야함	
					System.out.println(result>0?"사진삽입":"사진실패");
				}
				//좌표 삽입(사진이 있을 때만 좌표 있음!)
				if(result>0) {
					if(coords!=null) {
						System.out.println("좌표 있음");
						for(DailyCoord dc:coords) {
							switch(dc.getIndex()) {
								case "0":dc.setDailyImgNo(files.get(0).getDailyImgNo());break;
								case "1":dc.setDailyImgNo(files.get(1).getDailyImgNo());break;
								case "2":dc.setDailyImgNo(files.get(2).getDailyImgNo());break;
								case "3":dc.setDailyImgNo(files.get(3).getDailyImgNo());break;
								case "4":dc.setDailyImgNo(files.get(4).getDailyImgNo());break;
							}
							result=dao.insertDailyCoords(session,dc);
							System.out.println(result>0?"좌표삽입":"좌표실패");
						}
					}
					//해시태그 삽입
					if(result>0) {
						System.out.println("해시 시도");
						if(hashList.size()!=0) {//해시태그가 있으면
							System.out.println("해시 있음");
							System.out.println(hashList);
							for(Hashtag h:hashList) {
								h.setPostNo(d.getDailyNo());
								System.out.println(h);
								result=dao.insertHashtag(session,h);
								System.out.println(result>0?"해시삽입":"해시실패");
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

	


}
