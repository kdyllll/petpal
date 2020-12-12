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

@Controller
public class TipController {
	
	@Autowired
	private TipService service;
	
	@RequestMapping("community/tipList.do")
	public ModelAndView TipList(ModelAndView mv) {
		
		mv.addObject("list",service.tipList());
		mv.setViewName("community/tipList");
		
		return mv;
	}
	
	@RequestMapping("community/tipDetail.do")
	public ModelAndView TipDetail(HttpServletRequest request, HttpServletResponse response, ModelAndView mv) {
		String tipNo = request.getParameter("tipNo");
		
		mv.addObject("mainList",service.tipMainList(tipNo));
		mv.addObject("imgList",service.tipDetail(tipNo));
		mv.addObject("loc", "/community/tipDetail.do");
		
		return mv;
	}
	
	@RequestMapping("community/tipWrite.do")
	public String TipWrite() {
		return "community/tipWrite";
	}
	
	@RequestMapping("community/tipWriteEnd.do")
	public ModelAndView TipWrite(ModelAndView mv,
							HttpSession session, HttpServletRequest request, HttpServletResponse response,
							@RequestParam(value="mainImg", required=false) MultipartFile[] mainImg,
							@RequestParam(value="contentImg", required=false) MultipartFile[] contentImg,
							@RequestParam(value="category") String category,
							@RequestParam(value="title") String title,
							@RequestParam(value="content1") String content1,
							@RequestParam(value="content2", defaultValue = "") String content2
							) {
		
//		Member login=(Member)session.getAttribute("loginMember");
//		Tip t = Tip.builder().memberNo(login.getMemberNo()).title(title).content1(content1).content2(content2).build();
		
		String memberNo = "1";
		Tip t = Tip.builder().memberNo(memberNo).category(category).title(title).content1(content1).content2(content2).build();
		
		
		String path=session.getServletContext().getRealPath("/resources/upload/tip");
		File dir=new File(path);
		if(!dir.exists()) dir.mkdirs(); 
		
		List<TipImg> files=new ArrayList<TipImg>();
		
		String[] content = request.getParameterValues("content");
//		for(int i=0; i<content.length;i++) {
//			System.out.println("content" + i + "  " + content[i]);
//			TipImg img = TipImg.builder().content(content[i]).build();
//			files.add(img);
//		}
		
		
		for(MultipartFile f:mainImg) {
			if(!f.isEmpty()) {
				String originalName=f.getOriginalFilename();
				String ext=originalName.substring(originalName.lastIndexOf(".")+1);
				
				SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMdd_HHmmssSSS");
				int rndValue=(int)(Math.random()*10000);
				String reName="mainImg_"+sdf.format(System.currentTimeMillis())+"_"+rndValue+"."+ext;
				try {
					f.transferTo(new File(path+"/"+reName));
				}catch(IOException e) {
					e.printStackTrace();
				}
				TipImg img = TipImg.builder().mainImg(reName).build();
				files.add(img);
			}
		}
		
		int i=0;
		for(MultipartFile f:contentImg) {
			if(!f.isEmpty()) {
				String originalName=f.getOriginalFilename();
				String ext=originalName.substring(originalName.lastIndexOf(".")+1);
				
				SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMdd_HHmmssSSS");
				int rndValue=(int)(Math.random()*10000);
				String reName="contentImg" + (i+1) + "_" +sdf.format(System.currentTimeMillis())+"_"+rndValue+"."+ext;
				try {
					f.transferTo(new File(path+"/"+reName));
				}catch(IOException e) {
					e.printStackTrace();
				}
				TipImg img = TipImg.builder().contentImg(reName).content(content[i]).build();
				files.add(img);
				i++;
			}
		}
		
		System.out.println("files : " + files);
		
		int result = service.insertTip(t, files);
		mv.addObject("msg", result>0?"입력 성공":"입력 실패");
		mv.addObject("loc", "/community/tipList.do");
		
		mv.setViewName("common/msg");
		
		return mv;
	}
	
	@RequestMapping("community/tipUpdate.do")
	public ModelAndView tipUpdate(HttpServletRequest request, HttpServletResponse response, ModelAndView mv) {
		String tipNo = request.getParameter("tipNo");
		
		mv.addObject("mainList",service.tipMainList(tipNo));
		mv.addObject("imgList",service.tipDetail(tipNo));
		mv.addObject("loc", "/community/tipUpdate.do");
		
		return mv;
	}
	
	@RequestMapping("community/tipUpdateEnd.do")
	public ModelAndView tipUpdateEnd(ModelAndView mv,
			HttpSession session, HttpServletRequest request, HttpServletResponse response,
			@RequestParam(value="mainImg", required=false) MultipartFile[] mainImg,
			@RequestParam(value="contentImg", required=false) MultipartFile[] contentImg,
			@RequestParam(value="category") String category,
			@RequestParam(value="title") String title,
			@RequestParam(value="content1") String content1,
			@RequestParam(value="content2", defaultValue = "") String content2
			) {
		
		System.out.println("여기로 와?");
		
		Tip t = Tip.builder().build();
		
		String memberNo = "1";

		if(category.equals(null)) {
			category = t.getCategory();
			t = Tip.builder().memberNo(memberNo).category(category).title(title).content1(content1).content2(content2).build();
		}else {
			t = Tip.builder().memberNo(memberNo).category(category).title(title).content1(content1).content2(content2).build();
		}

		
		String path=session.getServletContext().getRealPath("/resources/upload/tip");
		File dir=new File(path);
		if(!dir.exists()) dir.mkdirs(); 
		
		List<TipImg> files=new ArrayList<TipImg>();
		
		String[] content = request.getParameterValues("content");
//		for(int i=0; i<content.length;i++) {
//			System.out.println("content" + i + "  " + content[i]);
//			TipImg img = TipImg.builder().content(content[i]).build();
//			files.add(img);
//		}
		
		TipImg img = TipImg.builder().build();
		
		for(MultipartFile f:mainImg) {
			if(!f.isEmpty()) {
				String originalName=f.getOriginalFilename();
				String ext=originalName.substring(originalName.lastIndexOf(".")+1);
				
				SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMdd_HHmmssSSS");
				int rndValue=(int)(Math.random()*10000);
				String reName="mainImg_"+sdf.format(System.currentTimeMillis())+"_"+rndValue+"."+ext;
				try {
					f.transferTo(new File(path+"/"+reName));
				}catch(IOException e) {
					e.printStackTrace();
				}
				img = TipImg.builder().mainImg(reName).build();
				files.add(img);
			}else {
				img = TipImg.builder().mainImg(img.getMainImg()).build();
				files.add(img);
			}
		}
		
		int i=0;
		for(MultipartFile f:contentImg) {
			if(!f.isEmpty()) {
				String originalName=f.getOriginalFilename();
				String ext=originalName.substring(originalName.lastIndexOf(".")+1);
				
				SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMdd_HHmmssSSS");
				int rndValue=(int)(Math.random()*10000);
				String reName="contentImg" + (i+1) + "_" +sdf.format(System.currentTimeMillis())+"_"+rndValue+"."+ext;
				try {
					f.transferTo(new File(path+"/"+reName));
				}catch(IOException e) {
					e.printStackTrace();
				}
				img = TipImg.builder().contentImg(reName).content(content[i]).build();
				files.add(img);
				i++;
			}
		}
		
		System.out.println("files : " + files);
		
		int result = service.updateTip(t, files);
		mv.addObject("msg", result>0?"입력 성공":"입력 실패");
		mv.addObject("loc", "/community/tipList.do");
		
		mv.setViewName("common/msg");
		
		return mv;
	}
	
}
