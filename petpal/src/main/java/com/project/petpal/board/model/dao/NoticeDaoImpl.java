package com.project.petpal.board.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.project.petpal.board.model.vo.Notice;
import com.project.petpal.board.model.vo.NoticeImg;

@Repository
public class NoticeDaoImpl implements NoticeDao {

	@Override
	public int insertNotice(SqlSession session, Notice n) {
		return session.insert("notice.insertNotice", n);
	}

	@Override
	public int insertNoticeImg(SqlSession session, NoticeImg ni) {
		return session.insert("notice.insertNoticeImg", ni);
	}

	@Override
	public List<Map> noticeList(SqlSession session) {
		return session.selectList("notice.noticeList");
	}

	@Override
	public List<Map> noticeMainList(SqlSession session, String noticeNo) {
		return session.selectList("notice.noticeMainList", noticeNo);
	}

	@Override
	public List<Map> noticeImgList(SqlSession session, String noticeNo) {
		return session.selectList("notice.noticeImgList", noticeNo);
	}

}
