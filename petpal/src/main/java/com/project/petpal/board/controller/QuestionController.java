package com.project.petpal.board.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class QuestionController {
	@RequestMapping("/board/questionList.do")
	public String questionList() {
		return "/board/questionList";
	}

	@RequestMapping("/board/questionWrite.do")
	public String questionWrite() {
		return "/board/questionWrite";
	}
	
	@RequestMapping("/board/questionDetail.do")
	public String questionDetail() {
		return "/board/questionDetail";
	}
}
