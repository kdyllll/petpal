package com.project.petpal.community.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
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
			@RequestParam(value="tag0", required=false) String[] tag0,
			@RequestParam(value="tag1", required=false) String[] tag1,
			@RequestParam(value="tag2", required=false) String[] tag2,
			@RequestParam(value="tag3", required=false) String[] tag3,
			@RequestParam(value="tag4", required=false) String[] tag4,
			@RequestParam(value="hashtag", required=false) String[] hashtag
			) {
		//받아야 하는것
		//1.글내용 2.작성자(접속자) 3.사진(최대5개) 4.사진 당 상품좌표 5.해시태그
		
		
		
//		String path=session.getServletContext().getRealPath("/resources/upload/board");
//		File dir=new File(path);
//		if(!dir.exists()) dir.mkdirs(); //폴더 생성
//		List<String> files=new ArrayList<String>();
//		for(MultipartFile f:upFile) {
//			if(!f.isEmpty()) {
//				String originalName=f.getOriginalFilename();
//				String ext=originalName.substring(originalName.lastIndexOf(".")+1);
//				
//				SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMdd_HHmmssSSS");
//				int rndValue=(int)(Math.random()*10000);
//				String reName=sdf.format(System.currentTimeMillis())+"_"+rndValue+"."+ext;
//				try {
//					f.transferTo(new File(path+"/"+reName));
//				}catch(IOException e) {
//					e.printStackTrace();
//				}
//				files.add(reName);
//			}
//		}
		
//		int result=service.insertBoard(b,files);
	
		m.addAttribute("msg","만드는중");
		m.addAttribute("loc","/community/dailyWrite");
		return "common/msg";
	}

}
