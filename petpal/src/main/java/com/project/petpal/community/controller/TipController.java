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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.project.petpal.common.AjaxPageBarFactory;
import com.project.petpal.common.PageBarFactory;
import com.project.petpal.community.model.service.CommunityService;
import com.project.petpal.community.model.service.TipService;
import com.project.petpal.community.model.vo.Hashtag;
import com.project.petpal.community.model.vo.Tip;
import com.project.petpal.community.model.vo.TipComment;
import com.project.petpal.community.model.vo.TipImg;
import com.project.petpal.member.model.vo.Member;

@Controller
public class TipController {
	
	@Autowired
	private TipService service;
	@Autowired
	private CommunityService cService;
	
	@RequestMapping("/community/tipList.do")
	public String TipList(ModelAndView mv, HttpSession session, Model model, String category, String sort,
							@RequestParam(value="hashtag", required=false) String hashtag,
							@RequestParam(value="word", required=false) String word,
							@RequestParam(value="cPage",defaultValue="1") int cPage,
							@RequestParam(value="numPerPage",defaultValue="12") int numPerPage) {
		Map keyword;
		List<Map> TipList=null;
		if(word!=null) {
			keyword=new HashMap();
			String keyword2=word.replace(" ", "");//공백제거
			String[] keywords=keyword2.split("");
			keyword.put("keywords", keywords);
			TipList=service.tipList(keyword);
		}else {
			//해시태그 검색어로 검색됐을 경우 구분
			keyword=new HashMap<String,String>();
			keyword.put("hashtag", hashtag);
			keyword.put("category", category);
			TipList = service.tipList(cPage,numPerPage, keyword);
		}
		
		
		String search="";
		//검색어를 통해 들어오는 거면 search도 보내서 정렬버튼 없앰
		if(hashtag!=null) {
			search="search";
		}
		if(word!=null) {
			search="search";
		}
		
		System.out.println("카테고리 : " + category);
		System.out.println("정렬 : " + sort);
		
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
		
		
		int totalCount=service.totalTipCount(keyword);
		String pageBar=new PageBarFactory().getPageBar2(totalCount, cPage, numPerPage, category, null, "tipList.do");
		
		
		//팔로우 검사
		if(loginMember != null) {
			String no = loginMember.getMemberNo();
			List<Map> followingList = service.selectFollowingList(no);
			model.addAttribute("following", followingList);
		}
		
		if(sort!=null) {
			if(sort.equals("최신순")) {
				if(category!=null) {
					TipList=service.selectTipDate(cPage,numPerPage, keyword);
				}else {
					TipList=service.selectTipDate(cPage,numPerPage, null);
				}
			}else if(sort.equals("인기순")) {
				if(category!=null) {
					TipList=service.selectTipHeart(cPage,numPerPage, keyword);
				}else {
					TipList=service.selectTipHeart(cPage,numPerPage, null);
				}
			}else if(sort.equals("댓글순")){
				if(category!=null) {
					TipList=service.selectTipComment(cPage,numPerPage, keyword);
				}else {
					TipList=service.selectTipComment(cPage,numPerPage, null);
				}
			}else {
				if(category!=null) {
					TipList=service.selectTipFollow(cPage,numPerPage, keyword);
				}else {
					TipList=service.selectTipFollow(cPage,numPerPage, null);
				}
			}
		}
		
		for(Map map:TipList) {
			//해시태그 리스트
			String postNo=(String) map.get("TIPNO");
			List<String> hashList=cService.selectHashList(postNo);
			map.put("hashList", hashList);
			//좋아요 수
			int likeCnt = service.tipLikeCount(postNo);
			//댓글 수 
			int commentCnt = service.countCommentPage(postNo);
			
			map.put("likeCnt",likeCnt);
			map.put("commentCnt",commentCnt);
		}
		
		
		model.addAttribute("search",search);
		model.addAttribute("list", TipList);
		model.addAttribute("memberNo", memberNo);
		model.addAttribute("pageBar", pageBar);
		if(category==null) {
			category = "전체";
		}
		model.addAttribute("category", category);
		
		return "/community/tipList";
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
		
		List<Map> mainList = service.tipMainList(tipNo);
		
		for(Map map:mainList) {
			String postNo=(String) map.get("TIPNO");
			List<String> hashList=cService.selectHashList(postNo);
			map.put("hashList", hashList);
		}
		
		int likeCount = service.tipLikeCount(tipNo);
		int commentCount = service.countCommentPage(tipNo);
		
		List<Map> tip = service.tipMainList(tipNo);
		String writer = (String) tip.get(0).get("MEMBERNO");
		mv.addObject("member", service.selectMember((String) tip.get(0).get("MEMBERNO")));
		mv.addObject("mainList", mainList);
		mv.addObject("imgList",service.tipDetail(tipNo));
		mv.addObject("memberNo", memberNo);
		mv.addObject("writer", writer);
		mv.addObject("likeCount", likeCount);
		mv.addObject("commentCount", commentCount);
		
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
							@RequestParam(value="content2", defaultValue = "") String content2,
							@RequestParam(value="hashtag", required=false) String[] hashtag
							) {
		
		Member loginMember=(Member)session.getAttribute("loginMember");
		
		String memberNo = loginMember.getMemberNo();
		
		Tip t = Tip.builder().memberNo(memberNo).category(category).title(title).content1(content1).content2(content2).build();
		
		//해시태그
		List<Hashtag> hashList=new ArrayList();
		if(hashtag!=null) {
			for(String hash:hashtag) {
				Hashtag h=new Hashtag();
				h.setHashContent(hash);
				hashList.add(h);
			};
		};
		
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
		
		int result = service.insertTip(t, files, hashList);
		mv.addObject("msg", result>0?"입력 성공":"입력 실패");
		mv.addObject("loc", "/community/tipList.do");
		
		mv.setViewName("common/msg");
		
		return mv;
	}
	
	@RequestMapping("/community/tipUpdate.do")
	public ModelAndView tipUpdate(HttpServletRequest request, HttpServletResponse response, ModelAndView mv) {
		String tipNo = request.getParameter("tipNo");
		
		//해시태그
		List<Hashtag> hashList=service.selectHashList(tipNo);
		
		mv.addObject("mainList",service.tipMainList(tipNo));
		mv.addObject("imgList",service.tipDetail(tipNo));
		mv.addObject("hashList",hashList);
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
			@RequestParam(value = "tipImgNo", defaultValue = "0") String[] tipImgNo,
			@RequestParam(value="hashtag", required=false) String[] hashtag
			) {
		
		//로그인 정보 받아오기
		Member loginMember=(Member)session.getAttribute("loginMember");
		String memberNo = loginMember.getMemberNo();
		
		//업데이트할 Tip 객체 생성 후 값 넣어줌
		Tip t = Tip.builder().memberNo(memberNo).category(category).title(title).content1(content1).content2(content2).tipNo(tipNo).build();
		
		//Tip update

		//for문에서 사용할 TipImg 객체
		TipImg img = TipImg.builder().build();
		
		//해시태그
		List<Hashtag> hashList=new ArrayList();
		if(hashtag!=null) {
			for(String hash:hashtag) {
				Hashtag h=new Hashtag();
				h.setPostNo(tipNo);
				h.setHashContent(hash);
				hashList.add(h);
			};
		}
		int tResult = service.updateTip(t, hashList);
		
		//사진 저장될 경로 지정
		String path=session.getServletContext().getRealPath("/resources/upload/tip");
		File dir=new File(path);
		//경로가 없으면 만들기
		if(!dir.exists()) dir.mkdirs();
		
		//main사진 업데이트용 변수
		int mResult = 0;
		
		//메인사진용 for문
		for(MultipartFile f:mainImg) {
			//넘어온 사진이 없으면 update 안함
			mResult = 1;
			if(!f.isEmpty()) {
				//넘어온 사진이 있으면 update 함
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
					//객체에 정보를 담아줌
					img = TipImg.builder().mainImg(reName).tipImgNo(mainImgNo[0]).build();
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
		
//		기존 이미지 삭제
		for(int i=0;i<deleteImgNo.length;i++) {
			TipImg ti = TipImg.builder().tipImgNo(deleteImgNo[i]).build();
			dResult=service.deleteTipImg(ti);
		}
		
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
			int cResult = 0;
			for(int k=0;k<content.size();k++) {
				img = TipImg.builder().content(content.get(k)).tipImgNo(tipImgNo[k]).build();
				cResult = service.updateContent(img);
			}
		}else {
			int cResult = 0;
			for(int k=0;k<content.size();k++) {
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
	
	//노하우 댓글 불러오기
	@RequestMapping("/tip/tipComment.do")
	public String selectComment(String tipNo,String writeMember,
			@RequestParam(value="cPage",defaultValue="1") int cPage,
			@RequestParam(value="numPerPage",defaultValue="5") int numPerPage,
			Model m) {
		List<TipComment> cList=service.selectComment(tipNo,cPage,numPerPage);
		int count=service.countComment(tipNo);
		int total=service.countCommentPage(tipNo);
		String pageBar=new AjaxPageBarFactory().getPageBar(total, cPage, numPerPage, "tipComment.do", null, "#commentContainer", null, "commentAjax",tipNo,writeMember,null);
		m.addAttribute("count",count);
		m.addAttribute("pageBar",pageBar);
		m.addAttribute("cList",cList);	
		m.addAttribute("writeMember",writeMember);
		return "community/communityAjax/tipComment";
	}
	
	//노하우 댓글 작성
	@RequestMapping("/tip/commentWrite.do")
	@ResponseBody
	public Boolean insertComment(TipComment tc) {
		int result=service.insertComment(tc);
		return result>0?true:false;
	}
	
	//노하우 댓글 삭제 → 댓글 상태 D로 변경
	@RequestMapping("/tip/commentDelete.do")
	@ResponseBody
	public Boolean commentDelete(String tipCommentNo) {
		int result=service.commentDelete(tipCommentNo);
		return result>0?true:false;
	}
	
	//노하우 대댓글 삭제 
	@RequestMapping("/tip/comment2Delete.do")
	@ResponseBody
	public Boolean comment2Delete(String tipCommentNo) {
		int result=service.comment2Delete(tipCommentNo);
		return result>0?true:false;
	}
	
	@RequestMapping("/tip/likeCount.do")
	@ResponseBody
	public int likeCount(String tipNo) {
		int likeCount = service.tipLikeCount(tipNo);
		
		return likeCount;
	}
	
	@RequestMapping("/tip/commentCount.do")
	@ResponseBody
	public int commentCount(String tipNo) {
		int commentCount = service.countCommentPage(tipNo);
		
		return commentCount;
	}
	
}
