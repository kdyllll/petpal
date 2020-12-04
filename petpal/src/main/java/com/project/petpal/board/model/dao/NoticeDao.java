package com.project.petpal.board.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.project.petpal.board.model.vo.Notice;
import com.project.petpal.board.model.vo.NoticeImg;

public interface NoticeDao {
	int insertNotice(SqlSession session, Notice n);
	int insertNoticeImg(SqlSession session, NoticeImg ni);
	List<Map> noticeList(SqlSession session);
	List<Map> noticeMainList(SqlSession session, String noticeNo);
	List<Map> noticeImgList(SqlSession session, String noticeNo);
}