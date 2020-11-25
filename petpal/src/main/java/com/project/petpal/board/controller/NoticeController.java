package com.project.petpal.board.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class NoticeController {
	@RequestMapping("board/noticeList.do")
	public String noticeList() {
		return "board/noticeList";
	}

	@RequestMapping("board/noticeWrite.do")
	public String noticeWrite() {
		return "board/noticeWrite";
	}
	
	@RequestMapping("/board/noticeDetail.do")
	public String noticeDetail() {
		return "/board/noticeDetail";
	}
}
