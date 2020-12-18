package com.project.petpal.community.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.project.petpal.community.model.service.PlaceService;
import com.project.petpal.community.model.vo.Place;
import com.project.petpal.community.model.vo.PlaceImg;
import com.project.petpal.member.model.vo.Member;

@Controller
public class PlaceController {

	@Autowired
	private PlaceService service;
	
	@RequestMapping("/place/movePlaceWrite.do")
	public String movePlacePostWrite() {
		
		return "community/placeWrite";
	}
	@RequestMapping("/place/placeWriteEnd.do")
	public String placePostWriteEnd(Place p,@RequestParam(value="content",required=false, defaultValue=" ")String[] content,String[] hashtag,Model m,@RequestParam(value="pic", required=false)MultipartFile[] files,HttpSession session) {
		p.setMemberNo(((Member)session.getAttribute("loginMember")).getMemberNo());//회원번호 글객체에 저장
		String path=session.getServletContext().getRealPath("/resources/upload/place");
		System.out.println(content.length);
		System.out.println("컨텐트"+content);
		
		File dir=new File(path);
		if(!dir.exists()) dir.mkdirs();//폴더를 생성
		List<PlaceImg> list = new ArrayList();
		for(int i=0;i<content.length;i++) {
		if(!files[i].isEmpty()) {
			  //파일명생성하기
			  String originalName=files[i].getOriginalFilename();
			  String ext=originalName.substring(originalName.lastIndexOf(".")+1);
			  //리네임규칙
			  SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMdd_HHmmssSSS");
			  int rndValue=(int)(Math.random()*10000);
			  String reName=sdf.format(System.currentTimeMillis())+"_"+rndValue+"."+ext;
			  try {
				  files[i].transferTo(new File(path+"/"+reName));
			  }catch(IOException e) {
				  e.printStackTrace();
				  m.addAttribute("msg","오류가 발생하였습니다.다시 시도해주세요.");
			  }
			  PlaceImg pi=new PlaceImg();
			  System.out.println(content[i]);
			  pi.setContent(content[i]);
			  pi.setFileName(reName);
			  list.add(pi);
		}
		
	}
		try {
			int result=service.insertPlace(p, list, hashtag);
			m.addAttribute("msg","작성에 성공하였습니다.");
			m.addAttribute("loc","/place/movePlaceList.do");
		}catch(Exception e) {
			e.printStackTrace();
			m.addAttribute("msg","작성에 실패하였습니다.");
		}
		
		
		return "common/msg";
	}
	@RequestMapping("/place/movePlaceList.do")
	public String placeList(Model m,String category) {
		List<Place> list=service.placeList(category);
		
		long curTime=System.currentTimeMillis();
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
		for(Place p:list) {
			try {
			Date pd=sdf.parse(p.getPlaceDate());
			long pTime=pd.getTime();
			long cha=(curTime-pTime)/1000/60;//분단위
			String status="";
			if(cha<60) {//1시간보단 적을경우
				status=cha+"분 전";
				p.setPlaceDate(status);
			}else if(cha>=60&&cha<1440) {//1시간~23시간
				status=cha/60+"시간 전";
				p.setPlaceDate(status);
			}else if(cha>=1440&&cha<43200) {//1일~29일
				status=cha/60/24+"일 전";
				p.setPlaceDate(status);
			}else {//1달이상은 기본 날짜 출력
				Date d=sdf.parse(p.getPlaceDate());
				p.setPlaceDate(sdf.format(d));
			}
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		m.addAttribute("list",list);
		return "community/placeList";
	}
	@RequestMapping("/place/movePlaceDetail.do")
	public String selectPlace(String placeNo,Model m) {
		Place p = service.selectPlace(placeNo);
		System.out.println(p);
		return "community/placeDetail";
	}
}
