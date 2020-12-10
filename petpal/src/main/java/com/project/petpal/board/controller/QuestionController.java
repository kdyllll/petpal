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

import com.project.petpal.board.model.service.QuestionService;
import com.project.petpal.board.model.vo.Question;
import com.project.petpal.board.model.vo.QuestionImg;

@Controller
public class QuestionController {
	
	@Autowired
	private QuestionService service;
	
	@RequestMapping("/board/questionList.do")
	public ModelAndView questionList(ModelAndView mv) {

		mv.addObject("list", service.questionList());
		mv.setViewName("board/questionList");
		return mv;
	}

	@RequestMapping("/board/questionDetail.do")
	public ModelAndView questionDetail(HttpServletRequest request, HttpServletResponse response, ModelAndView mv) {
		String questionNo = request.getParameter("questionNo");
		
		mv.addObject("mainList", service.questionMainList(questionNo));
		mv.addObject("imgList", service.questionImgList(questionNo));
		mv.setViewName("/board/questionDetail");
		return mv;
	}

	@RequestMapping("/board/questionWrite.do")
	public String questionWrite() {
		return "/board/questionWrite";
	}
	
	@RequestMapping("/board/questionWriteEnd.do")
	public ModelAndView TipWrite(ModelAndView mv,
							HttpSession session, HttpServletRequest request, HttpServletResponse response,
							@RequestParam(value="mainImg", required=false) MultipartFile[] mainImg,
							@RequestParam(value="contentImg", required=false) MultipartFile[] contentImg,
							@RequestParam(value="title") String title,
							@RequestParam(value="content1") String content1,
							@RequestParam(value="content2", defaultValue = "") String content2
							) {
		
//		Member login=(Member)session.getAttribute("loginMember");
//		Tip t = Tip.builder().memberNo(login.getMemberNo()).title(title).content1(content1).content2(content2).build();
		
		String memberNo = "1";
		Question q = Question.builder().memberNo(memberNo).title(title).content1(content1).content2(content2).build();
		
		
		String path=session.getServletContext().getRealPath("/resources/upload/board/question");
		File dir=new File(path);
		if(!dir.exists()) dir.mkdirs(); 
		
		List<QuestionImg> files=new ArrayList<QuestionImg>();
		
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
				QuestionImg img = QuestionImg.builder().mainImg(reName).build();
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
				QuestionImg img = QuestionImg.builder().contentImg(reName).content(content[i]).build();
				files.add(img);
				i++;
			}
		}
		
		System.out.println("files : " + files);
		
		int result = service.insertQuestion(q, files);
		mv.addObject("msg", result>0?"입력 성공":"입력 실패");
		mv.addObject("loc", "/board/questionList.do");
		
		mv.setViewName("common/msg");
		
		return mv;
	}
	
	
	
}
