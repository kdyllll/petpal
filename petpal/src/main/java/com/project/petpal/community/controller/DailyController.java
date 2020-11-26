package com.project.petpal.community.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.project.petpal.community.model.service.DailyService;
import com.project.petpal.community.model.vo.Daily;
import com.project.petpal.community.model.vo.DailyCoord;
import com.project.petpal.community.model.vo.DailyImg;
import com.project.petpal.member.model.vo.Member;



@Controller
public class DailyController {
	
	@Autowired
	private DailyService service;
	
	@RequestMapping("/daily/moveWrite.do")
	public String moveDailyWrite() {
		return "community/dailyWrite";
	}
	
	@RequestMapping("/daily/dailyWriteEnd.do")
	public String insertDaily(HttpServletRequest request,HttpSession session,Model m,String content,
			@RequestParam(value="pic", required=false) MultipartFile[] pic,
//			@RequestParam(value="tag0", required=false) String[] tag0,
//			@RequestParam(value="tag1", required=false) String[] tag1,
//			@RequestParam(value="tag2", required=false) String[] tag2,
//			@RequestParam(value="tag3", required=false) String[] tag3,
//			@RequestParam(value="tag4", required=false) String[] tag4,
			@RequestParam(value="coord", required=false) String[] coord,
			@RequestParam(value="hashtag", required=false) String[] hashtag
			) {
		//받아야 하는것
		//1.글내용 2.작성자(접속자) 3.사진(최대5개) 4.사진 당 상품좌표 5.해시태그
		
		//DB 
		//글 : 글번호, 작성자번호, 내용, 작성일
		//사진 : 사진번호, 글번호, 파일 이름
		//좌표 : 사진번호, 상품번호, x좌표, y좌표
		
		//글
		Member login=(Member)session.getAttribute("loginMember");
		Daily d=Daily.builder().memberNo(login.getMemberNo()).content(content).build();
		
		//사진
		String path=session.getServletContext().getRealPath("/resources/upload/board");
		File dir=new File(path);
		if(!dir.exists()) dir.mkdirs(); 
		List<DailyImg> files=new ArrayList<DailyImg>();
		for(MultipartFile f:pic) {
			if(!f.isEmpty()) {
				String originalName=f.getOriginalFilename();
				String ext=originalName.substring(originalName.lastIndexOf(".")+1);
				
				SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMdd_HHmmssSSS");
				int rndValue=(int)(Math.random()*10000);
				String reName=sdf.format(System.currentTimeMillis())+"_"+rndValue+"."+ext;
				try {
					f.transferTo(new File(path+"/"+reName));
				}catch(IOException e) {
					e.printStackTrace();
				}
				DailyImg img=DailyImg.builder().dailyImgName(reName).build();
				files.add(img);
			}
		}
		
		//좌표
		//사진번호, 상품번호, x좌표, y좌표
		//tag0~tag4까지 배열에 하나씩 들어있는데 음 사진번호는 사진 넣고나서 생기니까 트렌젝션을 해야해
		//하고나서 이 네개를 한번에 묶어서 하나로 보내야 하는건데, 그러면 객체가 들어있는 list인게 편하겠따
		//순서가 글 인서트 → 글번호 가져오기(객체필요) → 사진 인서트 → 사진번호 가져오기(객체필요) → 좌표들을 사진번호에 맞게 객체에 넣고(객체 필요) → 좌표 인서트
//		List<DailyCoord> coord0=new ArrayList<DailyCoord>();
//		List<DailyCoord> coord1=new ArrayList<DailyCoord>();
//		List<DailyCoord> coord2=new ArrayList<DailyCoord>();
//		List<DailyCoord> coord3=new ArrayList<DailyCoord>();
//		List<DailyCoord> coord4=new ArrayList<DailyCoord>();
//		for(String s:tag0) {
//			String[] code=s.split(",");
//			DailyCoord dc=DailyCoord.builder().productNo(code[0]).xcode(Double.parseDouble(code[1])).ycode(Double.parseDouble(code[2])).build();
//			coord0.add(dc);
//		}
//		for(String s:tag1) {
//			String[] code=s.split(",");
//			DailyCoord dc=DailyCoord.builder().productNo(code[0]).xcode(Double.parseDouble(code[1])).ycode(Double.parseDouble(code[2])).build();
//			coord1.add(dc);
//		}
		List<DailyCoord> coords=new ArrayList<DailyCoord>();
		for(String s:coord) {
			String[] code=s.split(",");
			DailyCoord dc=DailyCoord.builder().productNo(code[0]).xcode(Double.parseDouble(code[1])).ycode(Double.parseDouble(code[2])).index(code[3]).build();
			coords.add(dc);
		}
		
		//보내기
		int result=0;
		try{
			result=service.insertDaily(d,files,coords);
		}catch (Exception e) {
			
		}
	
		m.addAttribute("msg","만드는중");
		m.addAttribute("loc","/community/dailyWrite");
		return "common/msg";
	}

}
