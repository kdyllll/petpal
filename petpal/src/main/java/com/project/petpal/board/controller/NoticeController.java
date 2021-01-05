package com.project.petpal.board.controller;

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

import com.project.petpal.board.model.service.NoticeService;
import com.project.petpal.board.model.vo.Notice;
import com.project.petpal.board.model.vo.NoticeImg;
import com.project.petpal.member.model.vo.Member;

@Controller
public class NoticeController {
	
	@Autowired
	private NoticeService service;
	
	@RequestMapping("board/noticeList.do")
	public ModelAndView noticeList(ModelAndView mv, HttpSession session) {
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
		
		mv.addObject("list", service.noticeList());
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

		System.out.println("files : " + files);

		int result = service.insertNotice(n, files);
		mv.addObject("msg", result > 0 ? "입력 성공" : "입력 실패");
		mv.addObject("loc", "/board/noticeList.do");

		mv.setViewName("common/msg");

		return mv;
	}
	
}
