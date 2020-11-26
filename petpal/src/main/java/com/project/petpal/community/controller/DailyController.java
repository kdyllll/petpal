package com.project.petpal.community.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;


@Controller
public class DailyController {
	
	@RequestMapping("/daily/moveWrite.do")
	public String moveDailyWrite() {
		return "community/dailyWrite";
	}
	
	@RequestMapping("/daily/dailyWriteEnd.do")
	public String insertDaily(HttpSession session,Model m,String content,
			@RequestParam(value="pic", required=false) MultipartFile[] pic,
			@RequestParam(value="tag1", required=false) String[] tag1,
			@RequestParam(value="tag1", required=false) String[] tag2,
			@RequestParam(value="tag1", required=false) String[] tag3,
			@RequestParam(value="tag1", required=false) String[] tag4,
			@RequestParam(value="tag1", required=false) String[] tag5,
			@RequestParam(value="hashtag", required=false) String[] hashtag
			) {
		//받아야 하는것
		//1.글내용 2.작성자(접속자) 3.사진(최대5개) 4.사진 당 상품좌표 5.해시태그
		
		System.out.println();
		return "common/msg";
	}

}
