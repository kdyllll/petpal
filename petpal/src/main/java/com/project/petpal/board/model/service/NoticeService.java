package com.project.petpal.board.model.service;

import java.util.List;
import java.util.Map;

import com.project.petpal.board.model.vo.Notice;
import com.project.petpal.board.model.vo.NoticeImg;

public interface NoticeService {
	int insertNotice(Notice n, List<NoticeImg> files);
	List<Map> noticeList();
	List<Map> noticeMainList(String noticeNo);
	List<Map> noticeImgList(String noticeNo);
}
