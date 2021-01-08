package com.project.petpal.community.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.StringTokenizer;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
	
	@RequestMapping("/community/tipList.do")
	public ModelAndView TipList(ModelAndView mv, HttpSession session, Model model) {
		Member loginMember=(Member)session.getAttribute("loginMember");
		String memberNo="";
		if(loginMember == null) {
			memberNo = "";
		}else {
			memberNo = loginMember.getMemberNo();
		}
		
		if(loginMember!=null) {
			List<String> like = service.selectTipLike(loginMember.getMemberNo());
			model.addAttribute("like", like);
		}
		
		mv.addObject("list",service.tipList());
		mv.addObject("memberNo", memberNo);
		
		mv.setViewName("/community/tipList");
		
		return mv;
	}
	
	@RequestMapping("/community/tipDetail.do")
	public ModelAndView TipDetail(HttpServletRequest request, HttpServletResponse response, HttpSession session, ModelAndView mv , Model model) {
		String tipNo = request.getParameter("tipNo");
		
		Member loginMember=(Member)session.getAttribute("loginMember");
		String memberNo="";
		if(loginMember == null) {
			memberNo = "";
		}else {
			memberNo = loginMember.getMemberNo();
			//좋아요 가져오기
			List<String> like = service.selectTipLike(loginMember.getMemberNo());
			for(String l : like) {
				if(l.equals(tipNo)) {
					String tLike = l;
					model.addAttribute("like", tLike);					
				}
			}
		}
//		System.out.println(service.selectMember(writerNo));
		List<Map> tip = service.tipMainList(tipNo);
		String writer = (String) tip.get(0).get("MEMBERNO");
		mv.addObject("member", service.selectMember((String) tip.get(0).get("MEMBERNO")));
		mv.addObject("mainList",service.tipMainList(tipNo));
		mv.addObject("imgList",service.tipDetail(tipNo));
		mv.addObject("memberNo", memberNo);
		mv.addObject("writer", writer);
		System.out.println(tip.get(0).get("MEMBERNO"));
		mv.addObject("loc", "/community/tipDetail.do");
		
		return mv;
	}
	
	@RequestMapping("/community/tipWrite.do")
	public String TipWrite() {
		return "community/tipWrite";
	}
	
	@RequestMapping("/community/tipWriteEnd.do")
	public ModelAndView TipWrite(ModelAndView mv,
							HttpSession session, HttpServletRequest request, HttpServletResponse response,
							@RequestParam(value="mainImg", required=false) MultipartFile[] mainImg,
							@RequestParam(value="contentImg", required=false) MultipartFile[] contentImg,
							@RequestParam(value="category") String category,
							@RequestParam(value="title") String title,
							@RequestParam(value="content1") String content1,
							@RequestParam(value="content2", defaultValue = "") String content2
							) {
		
		Member loginMember=(Member)session.getAttribute("loginMember");
		
		String memberNo = loginMember.getMemberNo();
		
		Tip t = Tip.builder().memberNo(memberNo).category(category).title(title).content1(content1).content2(content2).build();
		
		
		String path=session.getServletContext().getRealPath("/resources/upload/tip");
		File dir=new File(path);
		if(!dir.exists()) dir.mkdirs(); 
		
		List<TipImg> files=new ArrayList<TipImg>();
		
		String[] content = request.getParameterValues("content");
		
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
		
		int result = service.insertTip(t, files);
		mv.addObject("msg", result>0?"입력 성공":"입력 실패");
		mv.addObject("loc", "/community/tipList.do");
		
		mv.setViewName("common/msg");
		
		return mv;
	}
	
	@RequestMapping("/community/tipUpdate.do")
	public ModelAndView tipUpdate(HttpServletRequest request, HttpServletResponse response, ModelAndView mv) {
		String tipNo = request.getParameter("tipNo");
		
		mv.addObject("mainList",service.tipMainList(tipNo));
		mv.addObject("imgList",service.tipDetail(tipNo));
		mv.addObject("loc", "/community/tipUpdate.do");
		
		return mv;
	}
	
	@RequestMapping("/community/tipUpdateEnd.do")
	public ModelAndView tipUpdateEnd(ModelAndView mv, String tipNo,
			HttpSession session, HttpServletRequest request, HttpServletResponse response,
			@RequestParam(value="category", defaultValue = "") String category,
			@RequestParam(value="mainImg", required=false) MultipartFile[] mainImg,
			@RequestParam(value="contentImg", required=false) MultipartFile[] contentImg,
			@RequestParam(value="title") String title,
			@RequestParam(value="content1") String content1,
			@RequestParam(value="content2", defaultValue = "") String content2,
			@RequestParam(value="imgContent", defaultValue="") String imgContent,
			@RequestParam(value="newImgContent", defaultValue="") String newImgContent,
			@RequestParam(value = "mainImgNo", defaultValue = "0") String[] mainImgNo,
			@RequestParam(value = "deleteImgNo", defaultValue = "0") String[] deleteImgNo,
			@RequestParam(value = "tipImgNo", defaultValue = "0") String[] tipImgNo
			) {
		
		//로그인 정보 받아오기
		Member loginMember=(Member)session.getAttribute("loginMember");
		String memberNo = loginMember.getMemberNo();
		
		//업데이트할 Tip 객체 생성 후 값 넣어줌
		Tip t = Tip.builder().memberNo(memberNo).category(category).title(title).content1(content1).content2(content2).tipNo(tipNo).build();
		
		//Tip update
		int tResult = service.updateTip(t);

		//for문에서 사용할 TipImg 객체
		TipImg img = TipImg.builder().build();

		//사진 저장될 경로 지정
		String path=session.getServletContext().getRealPath("/resources/upload/tip");
		File dir=new File(path);
		//경로가 없으면 만들기
		if(!dir.exists()) dir.mkdirs();
		
		//main사진 업데이트용 변수
		int mResult = 0;
		
		System.out.println(mainImgNo[0]);
		
		//메인사진용 for문
		for(MultipartFile f:mainImg) {
			//넘어온 사진이 없으면 update 안함
			mResult = 1;
			if(!f.isEmpty()) {
				//넘어온 사진이 있으면 update 함
				if(!f.isEmpty()) {
					System.out.println("메인사진 update 함");
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
					//객체에 정보를 담아줌
					img = TipImg.builder().mainImg(reName).tipImgNo(mainImgNo[0]).build();
					System.out.println(img);
					//메인사진 업데이트
					mResult = service.updateMainImg(img);
				}
			}
		}

		//이미지에 들어갈 내용 리스트
		List<String> content = new ArrayList<String>();
		List<String> newContent = new ArrayList<String>();
		//기존에 넘어온 imgContent에서 ","를 기준으로 잘라줌
		StringTokenizer st1 = new StringTokenizer(imgContent, ",");
		StringTokenizer st2 = new StringTokenizer(newImgContent, ",");
		
		//토큰을 content 리스트에 담아줌
		while(st1.hasMoreTokens()) {
			content.add(st1.nextToken());
		}
		while(st2.hasMoreTokens()) {
			newContent.add(st2.nextToken());
		}
		
		
		int dResult = 0;
		
		for(int i=0;i<deleteImgNo.length;i++) {
			System.out.println("넘어온 번호 : " + deleteImgNo[i]);
		}
		
//		기존 이미지 삭제
		for(int i=0;i<deleteImgNo.length;i++) {
			TipImg ti = TipImg.builder().tipImgNo(deleteImgNo[i]).build();
			dResult=service.deleteTipImg(ti);
		}
		System.out.println("기존사진 삭제(0이면 삭제안됨, 1이면 삭제됨)"+dResult);
		
		List<TipImg> subImgs=new ArrayList<TipImg>();
		
		//content리스트에서 값을 하나씩 빼줄 index 변수
		int i=0;
		//내용사진용 for문
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
				//객체에 정보를 담아줌
				img = TipImg.builder().contentImg(reName).content(newContent.get(i)).tipNo(tipNo).build();
				subImgs.add(img);
				i++;
			}
		}
		int sResult = service.insertSubImgs(subImgs);
		
		if(sResult>0) {
			System.out.println(content);
			for(int u=0;u<tipImgNo.length;u++) {
				System.out.println(tipImgNo[u]);
			}
			
			int cResult = 0;
			for(int k=0;k<content.size();k++) {
				System.out.println("content : " + content.get(k));
				img = TipImg.builder().content(content.get(k)).tipImgNo(tipImgNo[k]).build();
				cResult = service.updateContent(img);
			}
		}else {
			System.out.println(content);
			for(int u=0;u<tipImgNo.length;u++) {
				System.out.println(tipImgNo[u]);
			}
			
			int cResult = 0;
			for(int k=0;k<content.size();k++) {
				System.out.println("content : " + content.get(k));
				img = TipImg.builder().content(content.get(k)).tipImgNo(tipImgNo[k]).build();
				cResult = service.updateContent(img);
			}
		}
		
		

		mv.addObject("msg", sResult>0 || mResult>0 || tResult>0?"수정 성공":"수정 실패");
		mv.addObject("loc", "/community/tipDetail.do?tipNo=" + tipNo);
		
		mv.setViewName("common/msg");
		
		return mv;
	}
	
	@RequestMapping("/community/tipDelete")
	public ModelAndView tipDelete(HttpServletRequest request, ModelAndView mv) {
		String tipNo = request.getParameter("tipNo");
		int result = service.tipDelete(tipNo);
		
		mv.addObject("msg", result>0?"삭제되었습니다.":"삭제 실패");
		mv.addObject("loc", "/community/tipList.do");
		
		mv.setViewName("common/msg");
		
		return mv;
	}
	
//	좋아요 추가
	@RequestMapping("/tip/insertLike.do")
	public String insertLike(HttpSession session, String tipNo) {
		Map map = new HashMap();
		Member m = (Member)session.getAttribute("loginMember");
		map.put("memberNo", m.getMemberNo());
		map.put("tipNo", tipNo);
		
		service.insertLike(map);
		return "";
	}
//	좋아요삭제
	@RequestMapping("/tip/deleteLike.do")
	public String findDelete(String tipNo,Model model, HttpSession session) {
		Member mem = (Member)session.getAttribute("loginMember");
		Map map = new HashMap();
		map.put("no", tipNo);
		map.put("memberNo", mem.getMemberNo());
		service.deleteLike(map);
		return "";
	}
	
}
