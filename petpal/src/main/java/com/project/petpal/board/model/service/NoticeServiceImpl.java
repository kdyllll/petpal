package com.project.petpal.board.model.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.petpal.board.model.dao.NoticeDao;
import com.project.petpal.board.model.vo.Notice;
import com.project.petpal.board.model.vo.NoticeImg;

@Service
public class NoticeServiceImpl implements NoticeService {

	@Autowired
	private SqlSession session;
	
	@Autowired
	private NoticeDao dao;

	@Override
	public int insertNotice(Notice n, List<NoticeImg> files) {
		int result = dao.insertNotice(session, n);

		if(result>0) {
			if(files!=null) {
				for(NoticeImg img: files) {
					img.setNoticeNo(n.getNoticeNo());
					result = dao.insertNoticeImg(session, img);
				}
			}
		}
		
		return result;
	}

	@Override
	public List<Map> noticeList() {
		return dao.noticeList(session);
	}

	@Override
	public List<Map> noticeMainList(String noticeNo) {
		return dao.noticeMainList(session, noticeNo);
	}

	@Override
	public List<Map> noticeImgList(String noticeNo) {
		return dao.noticeImgList(session, noticeNo);
	}
}
