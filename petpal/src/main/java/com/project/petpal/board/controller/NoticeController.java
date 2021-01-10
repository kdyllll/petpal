package com.project.petpal.board.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.StringTokenizer;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.project.petpal.board.model.service.NoticeService;
import com.project.petpal.board.model.vo.Notice;
import com.project.petpal.board.model.vo.NoticeImg;
import com.project.petpal.member.model.vo.Member;

@Controller
public class NoticeController {
	
	@Autowired
	private NoticeService service;
	
	@RequestMapping("board/noticeList.do")
	public ModelAndView noticeList(ModelAndView mv, HttpSession session,
									@RequestParam(value="hashtag", required=false) String hashtag,
									@RequestParam(value="cPage",defaultValue="1") int cPage,
									@RequestParam(value="numPerPage",defaultValue="1") int numPerPage) {
		Member loginMember=(Member)session.getAttribute("loginMember");
		
		String email="";
		if(loginMember == null) {
			email = "";
		}else {
			email = loginMember.getEmail();
		}
		
		String manager = "member";
		if(email.equals("admin@naver.com")) {
			manager = "manager";
		}
		
		List<Map> list = service.noticeList(cPage,numPerPage);
		
		mv.addObject("list", list);
		mv.addObject("manager", manager);
		mv.setViewName("board/noticeList");
		return mv;
	}
	
	@RequestMapping("/board/noticeDetail.do")
	public ModelAndView noticeDetail(HttpSession session, HttpServletRequest request, HttpServletResponse response, ModelAndView mv) {
		Member loginMember=(Member)session.getAttribute("loginMember");
		
		String email="";
		if(loginMember == null) {
			email = "";
		}else {
			email = loginMember.getEmail();
		}
		
		String manager = "member";
		if(email.equals("admin@naver.com")) {
			manager = "manager";
		}
		
		String noticeNo = request.getParameter("noticeNo");
		
		mv.addObject("mainList", service.noticeMainList(noticeNo));
		mv.addObject("imgList", service.noticeImgList(noticeNo));
		mv.addObject("manager", manager);
		mv.setViewName("/board/noticeDetail");
		return mv;
	}

	@RequestMapping("board/noticeWrite.do")
	public String noticeWrite() {
		return "board/noticeWrite";
	}

	@RequestMapping("board/noticeWriteEnd.do")
	public ModelAndView noticeWriteEnd(ModelAndView mv,
			HttpSession session, HttpServletRequest request, HttpServletResponse response,
			@RequestParam(value = "contentImg", required = false) MultipartFile[] contentImg,
			@RequestParam(value = "title") String title,
			@RequestParam(value = "content1") String content1,
			@RequestParam(value = "content2", defaultValue = "") String content2) {

		Member loginMember=(Member)session.getAttribute("loginMember");
		String memberNo = loginMember.getMemberNo();
		
		Notice n = Notice.builder().memberNo(memberNo).title(title).content1(content1).content2(content2).build();

		String path = session.getServletContext().getRealPath("/resources/upload/board/notice");
		File dir = new File(path);
		if (!dir.exists())
			dir.mkdirs();

		List<NoticeImg> files = new ArrayList<NoticeImg>();

		String[] content = request.getParameterValues("content");

		int i = 0;
		for (MultipartFile f : contentImg) {
			if (!f.isEmpty()) {
				String originalName = f.getOriginalFilename();
				String ext = originalName.substring(originalName.lastIndexOf(".") + 1);

				SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd_HHmmssSSS");
				int rndValue = (int) (Math.random() * 10000);
				String reName="contentImg" + (i+1) + "_" +sdf.format(System.currentTimeMillis())+"_"+rndValue+"."+ext;
				try {
					f.transferTo(new File(path + "/" + reName));
				} catch (IOException e) {
					e.printStackTrace();
				}
				NoticeImg img = NoticeImg.builder().contentImg(reName).content(content[i]).build();
				files.add(img);
				i++;
			}
		}

		int result = service.insertNotice(n, files);
		mv.addObject("msg", result > 0 ? "입력 성공" : "입력 실패");
		mv.addObject("loc", "/board/noticeList.do");

		mv.setViewName("common/msg");

		return mv;
	}

	@RequestMapping("/board/noticeUpdate.do")
	public ModelAndView noticeUpdate(HttpServletRequest request, HttpServletResponse response, ModelAndView mv) {
		String noticeNo = request.getParameter("noticeNo");
		
		mv.addObject("mainList",service.noticeMainList(noticeNo));
		mv.addObject("imgList",service.noticeImgList(noticeNo));
		mv.addObject("loc", "/board/noticeUpdate.do");
		
		return mv;
	}
	
	@RequestMapping("/board/noticeUpdateEnd.do")
	public ModelAndView noticeUpdateEnd(ModelAndView mv, String noticeNo,
			HttpSession session, HttpServletRequest request, HttpServletResponse response,
			@RequestParam(value="contentImg", required=false) MultipartFile[] contentImg,
			@RequestParam(value="title") String title,
			@RequestParam(value="content1") String content1,
			@RequestParam(value="content2", defaultValue = "") String content2,
			@RequestParam(value="imgContent", defaultValue="") String imgContent,
			@RequestParam(value="newImgContent", defaultValue="") String newImgContent,
			@RequestParam(value = "mainImgNo", defaultValue = "0") String[] mainImgNo,
			@RequestParam(value = "deleteImgNo", defaultValue = "0") String[] deleteImgNo,
			@RequestParam(value = "noticeImgNo", defaultValue = "0") String[] noticeImgNo
			) {
		
		//로그인 정보 받아오기
		Member loginMember=(Member)session.getAttribute("loginMember");
		String memberNo = loginMember.getMemberNo();
		
		//업데이트할 Notice 객체 생성 후 값 넣어줌
		Notice n = Notice.builder().memberNo(memberNo).title(title).content1(content1).content2(content2).noticeNo(noticeNo).build();
		
		//Notice update
		int tResult = service.updateNotice(n);

		//for문에서 사용할 NoticeImg 객체
		NoticeImg img = NoticeImg.builder().build();

		//사진 저장될 경로 지정
		String path=session.getServletContext().getRealPath("/resources/upload/board/notice");
		File dir=new File(path);
		//경로가 없으면 만들기
		if(!dir.exists()) dir.mkdirs();
		
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
		
//		기존 이미지 삭제
		for(int i=0;i<deleteImgNo.length;i++) {
			NoticeImg ni = NoticeImg.builder().noticeImgNo(deleteImgNo[i]).build();
			dResult=service.deleteNoticeImg(ni);
		}
		
		List<NoticeImg> subImgs=new ArrayList<NoticeImg>();
		
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
				img = NoticeImg.builder().contentImg(reName).content(newContent.get(i)).noticeNo(noticeNo).build();
				subImgs.add(img);
				i++;
			}
		}
		int sResult = service.insertSubImgs(subImgs);
		
		if(sResult>0) {
			int cResult = 0;
			for(int k=0;k<content.size();k++) {
				img = NoticeImg.builder().content(content.get(k)).noticeImgNo(noticeImgNo[k]).build();
				cResult = service.updateContent(img);
			}
		}else {
			for(int u=0;u<noticeImgNo.length;u++) {
			}
			
			int cResult = 0;
			for(int k=0;k<content.size();k++) {
				img = NoticeImg.builder().content(content.get(k)).noticeImgNo(noticeImgNo[k]).build();
				cResult = service.updateContent(img);
			}
		}
		
		mv.addObject("msg", sResult>0 || tResult>0?"수정 성공":"수정 실패");
		mv.addObject("loc", "/board/noticeDetail.do?noticeNo=" + noticeNo);
		
		mv.setViewName("common/msg");
		
		return mv;
	}
	
	@RequestMapping("/board/noticeDelete")
	public ModelAndView noticeDelete(HttpServletRequest request, ModelAndView mv) {
		String noticeNo = request.getParameter("noticeNo");
		int result = service.noticeDelete(noticeNo);
		
		mv.addObject("msg", result>0?"삭제되었습니다.":"삭제 실패");
		mv.addObject("loc", "/board/noticeList.do");
		
		mv.setViewName("common/msg");
		
		return mv;
	}
	
}
