package com.project.petpal.community.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
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

@Controller
public class PlaceController {

	@Autowired
	private PlaceService service;
	
	@RequestMapping("/place/movePlaceWrite.do")
	public String movePlacePostWrite() {
		
		return "community/placeWrite";
	}
	@RequestMapping("/place/placeWriteEnd.do")
	public String placePostWriteEnd(Place p,Model m,@RequestParam(value="pic", required=false)MultipartFile pic,HttpSession session) {

		String path=session.getServletContext().getRealPath("/resources/upload/place");
		System.out.println(pic.getOriginalFilename());
		File dir=new File(path);
		
//		System.out.println(files.length);
//		System.out.println(files[0]);
//		System.out.println("dd"+files[0].getOriginalFilename());
//		if(!dir.exists()) dir.mkdirs();//폴더를 생성
//		List<PlaceImg> list = new ArrayList();
//		for(int i=0;i<files.length;i++) {
//			
//			System.out.println(files[i].getOriginalFilename());
//		if(!files[i].isEmpty()) {
//			  //파일명생성하기
//			  String originalName=files[i].getOriginalFilename();
//			  String ext=originalName.substring(originalName.lastIndexOf(".")+1);
//			  //리네임규칙
//			  SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMdd_HHmmssSSS");
//			  int rndValue=(int)(Math.random()*10000);
//			  String reName=sdf.format(System.currentTimeMillis())+"_"+rndValue+"."+ext;
//			  try {
//				  files[i].transferTo(new File(path+"/"+reName));
//			  }catch(IOException e) {
//				  e.printStackTrace();
//				  m.addAttribute("msg","오류가 발생하였습니다.다시 시도해주세요.");
//			  }
//			  PlaceImg pi=new PlaceImg();
//			  pi.setContent(content[i]);
//			  pi.setFileName(reName);
//			  System.out.println(i+"번째"+pi.getContent());
//			  System.out.println(i+"번째"+pi.getFileName());
//			  list.add(pi);
//
//		}
//		
//	}
		return "common/msg";
	}
}
