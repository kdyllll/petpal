package com.project.petpal.board.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
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
	public List<Map> noticeList(SqlSession session, int cPage, int numPerPage) {
		RowBounds rb=new RowBounds((cPage-1)*numPerPage,numPerPage);
		return session.selectList("notice.noticeList", rb);
	}

	@Override
	public List<Map> noticeMainList(SqlSession session, String noticeNo) {
		return session.selectList("notice.noticeMainList", noticeNo);
	}

	@Override
	public List<Map> noticeImgList(SqlSession session, String noticeNo) {
		return session.selectList("notice.noticeImgList", noticeNo);
	}
	
	
	
	
	@Override
	public int updateNotice(SqlSession session, Notice n) {
		return session.update("notice.updateNotice", n);
	}

	@Override
	public int noticeDelete(SqlSession session, String noticeNo) {
		return session.delete("notice.noticeDelete", noticeNo);
	}

	@Override
	public int deleteNoticeImg(SqlSession session, NoticeImg ni) {
		return session.delete("notice.deleteNoticeImg", ni);
	}

	@Override
	public int insertSubImgs(SqlSession session, NoticeImg ni) {
		return session.insert("notice.insertSubImgs", ni);
	}

	@Override
	public int updateContent(SqlSession session, NoticeImg ni) {
		return session.update("notice.updateContent", ni);
	}

	@Override
	public int totalNoticeCount(SqlSession session) {
		// TODO Auto-generated method stub
		return session.selectOne("notice.totalNoticeCount");
	}

}
