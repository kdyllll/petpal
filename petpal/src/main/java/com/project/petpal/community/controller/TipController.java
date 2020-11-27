package com.project.petpal.community.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.project.petpal.community.model.service.TipService;
import com.project.petpal.community.model.vo.Tip;
import com.project.petpal.community.model.vo.TipImg;
import com.project.petpal.member.model.vo.Member;

@Controller
public class TipController {
	
	@Autowired
	private TipService service;
	
	@RequestMapping("community/TipList.do")
	public String TipList() {
		return "community/TipList";
	}
	
	@RequestMapping("community/TipDetail.do")
	public String TipDetail() {
		return "community/TipDetail";
	}
	
	@RequestMapping("community/TipWrite.do")
	public ModelAndView TipWrite(ModelAndView mv,
							@RequestParam(value="mainImg", required=false) MultipartFile[] mainImg,
							@RequestParam(value="fileName", required=false) MultipartFile[] fileName,
							HttpSession session, HttpServletRequest request, HttpServletResponse response,
							String title, String content1, String content2, String content) {
		
		Member login=(Member)session.getAttribute("loginMember");
		Tip t = Tip.builder().memberNo(login.getMemberNo()).title(title).content1(content1).content2(content2).build();
			
		
		String path=session.getServletContext().getRealPath("/resources/upload/tip");
		File dir=new File(path);
		if(!dir.exists()) dir.mkdirs(); 
		
		List<TipImg> files=new ArrayList<TipImg>();
		
		for(MultipartFile f:mainImg) {
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
				TipImg img = TipImg.builder().fileName(reName).content(content).build();
				files.add(img);
			}
		}

		for(MultipartFile f:fileName) {
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
				TipImg img = TipImg.builder().fileName(reName).build();
				files.add(img);
			}
		}
		
		int result = service.insertTip(t, files);
		mv.addObject("msg", result>0?"입력 성공":"입력 실패");
		mv.addObject("loc", "/community/TipWrite.do");
		
		mv.setViewName("common/msg");
		
		
		return mv;
	}
	
}
