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
	public List<Map> noticeList(int cPage, int numPerPage) {
		return dao.noticeList(session, cPage, numPerPage);
	}

	@Override
	public List<Map> noticeMainList(String noticeNo) {
		return dao.noticeMainList(session, noticeNo);
	}

	@Override
	public List<Map> noticeImgList(String noticeNo) {
		return dao.noticeImgList(session, noticeNo);
	}
	
	@Override
	public int updateNotice(Notice n) {
		return dao.updateNotice(session, n);
	}

	@Override
	public int noticeDelete(String noticeNo) {
		return dao.noticeDelete(session, noticeNo);
	}

	@Override
	public int deleteNoticeImg(NoticeImg ni) {
		return dao.deleteNoticeImg(session, ni);
	}

	@Override
	public int insertSubImgs(List<NoticeImg> ni) {
		int result = 0;
		for(NoticeImg fi : ni) {
			result = dao.insertSubImgs(session, fi);
		}
		return result;
	}

	@Override
	public int updateContent(NoticeImg ni) {
		return dao.updateContent(session, ni);
	}

	@Override
	public int totalNoticeCount() {
		// TODO Auto-generated method stub
		return dao.totalNoticeCount(session);
	}
}
