package com.project.petpal.community.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.collections.map.HashedMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.project.petpal.common.AjaxPageBarFactory;
import com.project.petpal.common.PageBarFactory;
import com.project.petpal.community.model.service.FindService;
import com.project.petpal.community.model.vo.DailyComment;
import com.project.petpal.community.model.vo.Find;
import com.project.petpal.community.model.vo.FindComment;
import com.project.petpal.community.model.vo.FindImg;
import com.project.petpal.member.model.vo.Member;

import lombok.Builder;

@Controller
public class findController {
	
	@Autowired
	private FindService service;
	
	@RequestMapping("/community/findList.do")
	public String findList(Model model, HttpServletRequest request,HttpSession session,@RequestParam(value = "cPage", defaultValue = "1") int cPage,
			@RequestParam(value = "numPerPage", defaultValue = "12") int numPerPage) {
		Member m =(Member)session.getAttribute("loginMember");
		String cate = request.getParameter("cate");
		Map map = new HashMap();
		map.put("cate",cate);
		int totalData = service.findTotalCount();		
		List<Map> list = service.selectFindList(map, cPage, numPerPage);
		List<Map> count = service.selectCountList();
		if(m!=null) {
			List<String> like = service.selectFindLike(m.getMemberNo());
			model.addAttribute("like", like);
		}
		
		//팔로우 검사
		if(m != null) {
			String memberNo = m.getMemberNo();
			List<Map> followingList = service.selectFollowingList(memberNo);
			model.addAttribute("following", followingList);
		}
		
		model.addAttribute("count", count);
		model.addAttribute("totalData", totalData);
		model.addAttribute("pageBar", new PageBarFactory().getPageBar(totalData, cPage, numPerPage,null,null, "findList.do"));
		model.addAttribute("list", list);
		return "community/findList";
	}
	@RequestMapping("/community/findWrite.do")
	public String findWrite() {
		return "community/findWrite";
	}
	@RequestMapping("/community/findWriteEnd.do")
	public String findWriteEnd(HttpSession session, Find find, @RequestParam(value="contentImg", required=false) MultipartFile[] contentImg, @RequestParam(value="mainImg" , required = false) MultipartFile mainImg, Model model) {

		String path = session.getServletContext().getRealPath("/resources/upload/find");
		File dir = new File(path);
		if(!dir.exists()) dir.mkdirs();
		String mainReName="";
		FindImg fi = null;
		if(!mainImg.isEmpty()) {
			String originalName = mainImg.getOriginalFilename();
			String ext = originalName.substring(originalName.lastIndexOf(".") + 1);
			// 리네임 규칙
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd_HHmmssSSS");
			int rndValue = (int) (Math.random() * 10000);
			mainReName = sdf.format(System.currentTimeMillis()) + "_" + rndValue + "." + ext;
			try {
				mainImg.transferTo(new File(path + "/" + mainReName));
			} catch (IOException e) {
				e.printStackTrace();
			}
			fi = FindImg.builder().fileName(mainReName).imgStatus("M").build();
		}
		
		List<FindImg> subImgs = new ArrayList();
		for(MultipartFile mf : contentImg) {
			if(!mf.isEmpty()) {
				String originalName = mf.getOriginalFilename();
				String ext = originalName.substring(originalName.lastIndexOf(".") + 1);
				// 리네임 규칙
				SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd_HHmmssSSS");
				int rndValue = (int) (Math.random() * 10000);
				String reName = sdf.format(System.currentTimeMillis()) + "_" + rndValue + "." + ext;
				try {
					mf.transferTo(new File(path + "/" + reName));
				} catch (IOException e) {
					e.printStackTrace();
				}
				FindImg cfi = FindImg.builder().fileName(reName).imgStatus("S").build();
				subImgs.add(cfi);
			}
		}
		
		int result = service.insertFindWrite(find,subImgs, fi);

		String msg = "글입력에 실패하였습니다.";
		String loc = "/community/findWrite.do";
		if(result>0) {
			msg="글 입력이 완료되었습니다.";
			loc="/community/findList.do";		
		}
		model.addAttribute("loc", loc);
		model.addAttribute("msg", msg);
		return "common/msg";
	}
	
	@RequestMapping("/community/findDetail.do")
	public String findDetail(HttpServletRequest request, HttpServletResponse response,Model model,HttpSession session) {
		String findNo = request.getParameter("findNo");
		Map fDetail = service.detailOne(findNo);
		List<Map> findPics = service.findSubPic(findNo);
		Member m = (Member)session.getAttribute("loginMember");
		List<Map> count = service.selectCountList();
		
		if(m!=null) {
			List<String> like = service.selectFindLike(m.getMemberNo());
			for(String l : like) {
				if(l.equals(findNo)) {
					String fLike = l;
					model.addAttribute("like", fLike);					
				}
			}
		}
		model.addAttribute("count",count);
		model.addAttribute("fDetail", fDetail);
		model.addAttribute("findPics", findPics);
		return "community/findDetail";
	}
	
	@RequestMapping("/find/findUpdate.do")
	public String findUpdate(String findNo,Model model) {
		
		Map findOne = service.detailOne(findNo);
		List<Map> findPics = service.findSubPic(findNo);
		model.addAttribute("findOne", findOne);
		model.addAttribute("findPics", findPics);
		return "community/findUpdate";
	}
	
	@RequestMapping("/find/findUpdateEnd.do")
	public String findUpdateEnd(String findNo,HttpSession session,
			@RequestParam(value = "mainImg") MultipartFile[] main ,Model model,
			@RequestParam(value="fileINo", defaultValue = "0") String[] fileINo,
			@RequestParam(value = "oriImgNo", defaultValue = "0") String[] oriImgNo,
			@RequestParam(value="newImg") MultipartFile[] newImg,
			String cate, String title, String address, String content) {
		int mResult = 0;
//		파일 저장경로
		String path = session.getServletContext().getRealPath("/resources/upload/find");
		File dir = new File(path);
		if(!dir.exists()) dir.mkdirs();
//		main이미지		
		for(MultipartFile mf: main) {
//			main이미지 안바꿀경우 update안함
			if(mf.isEmpty()) {
				System.out.println("메인사진 update 안함");
			} else {		//메인이미지 바꿀경우만 update	
				String originalName = mf.getOriginalFilename();
				String ext = originalName.substring(originalName.lastIndexOf(".") + 1);
				// 리네임 규칙
				SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd_HHmmssSSS");
				int rndValue = (int) (Math.random() * 10000);
				String reName = sdf.format(System.currentTimeMillis()) + "_" + rndValue + "." + ext;
				try {
					mf.transferTo(new File(path + "/" + reName));
				} catch (IOException e) {
					e.printStackTrace();
				}
				
				FindImg fi = FindImg.builder().fileName(reName).findNo(findNo).build();
				mResult = service.updateMainImg(fi);
				
			}
		}
		System.out.println("메인변경(0이면 변경안됨 1이면 변경됨):"+ mResult);

//		기존 이미지 삭제		
		List<FindImg> delNo = new ArrayList();
		for(String s : oriImgNo) {
			if(!s.equals("0")) {
				FindImg fin = FindImg.builder().findImgNo(s).build();
				delNo.add(fin);
			} 
		}
		int dResult = 0;
		if(!delNo.isEmpty()) {
			dResult=service.deleteFindImg(delNo);
		}
		System.out.println("기존사진 삭제(0이면 삭제안됨, 1이면 삭제됨)"+dResult);

		//새로운 사진추가하기
		List<FindImg> subImgs = new ArrayList();
		for(MultipartFile subImg : newImg) {
			if(!subImg.isEmpty()) {
				String originalName = subImg.getOriginalFilename();
				String ext = originalName.substring(originalName.lastIndexOf(".") + 1);
				// 리네임 규칙
				SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd_HHmmssSSS");
				int rndValue = (int) (Math.random() * 10000);
				String reName = sdf.format(System.currentTimeMillis()) + "_" + rndValue + "." + ext;
				try {
					subImg.transferTo(new File(path + "/" + reName));
				} catch (IOException e) {
					e.printStackTrace();
				}
				FindImg cfi = FindImg.builder().fileName(reName).imgStatus("S").findNo(findNo).build();
				subImgs.add(cfi);
			}
		}
		
		int sResult = service.insertSubImgs(subImgs);
		System.out.println("새 이미지 추가 :" + sResult);
		
//		카테고리, 제목, 내용, 주소 수정
		Map m = new HashMap();
		m.put("cate", cate);
		m.put("title", title);
		m.put("content", content);
		m.put("address", address);
		m.put("findNo", findNo);
		int oResult = service.updateOtherFind(m);
		
		System.out.println(oResult);
		
		String loc = "/community/findDetail.do?findNo="+findNo;
		String msg = "수정성공";
		model.addAttribute("loc", loc);
		model.addAttribute("msg", msg);
		return "common/msg";
	}
	
//	좋아요 삭제
	@RequestMapping("/find/deleteLike.do")
	@ResponseBody
	public Boolean deleteLike(String findNo, Model model ,HttpSession session) {
		Member mem = (Member)session.getAttribute("loginMember");
		Map map = new HashMap();
		map.put("no", findNo);
		map.put("memberNo", mem.getMemberNo());
		int result = service.deleteFindLike(map);
		return result>0?true:false;
	}
//	좋아요 추가
	@RequestMapping("/find/insertLike.do")
	@ResponseBody
	public Boolean insertLike(HttpSession session, String findNo) {
		Map map = new HashMap();
		Member m = (Member)session.getAttribute("loginMember");
		map.put("memberNo", m.getMemberNo());
		map.put("findNo", findNo);
		
		int result = service.insertFindLike(map);
		return result>0?true:false;
	}
	
	@RequestMapping("/find/findDelete.do")
	public String findDelete(String findNo,Model model) {
		String loc= "/community/findDetail.do?findNo="+findNo;
		String msg="삭제되지않았습니다.";
		int result = service.deleteFind(findNo);
		if(result> 0 ) {
			loc= "/community/findList.do";
			msg = "삭제되었습니다.";
		}
		model.addAttribute("loc", loc);
		model.addAttribute("msg", msg);
		return "common/msg";
	}
	
	@RequestMapping("/find/findComment.do")
	public String findComment(String findNo,String writeMember,
			@RequestParam(value="cPage",defaultValue="1") int cPage,
			@RequestParam(value="numPerPage",defaultValue="5") int numPerPage,
			Model m) {
		List<Map> cList=service.selectComment(findNo,cPage,numPerPage);
		int count=service.countComment(findNo);
		int total=service.countCommentPage(findNo);
		String pageBar=new AjaxPageBarFactory().getPageBar(total, cPage, numPerPage, "findComment.do", null, "#commentContainer", null, "commentAjax",findNo,writeMember,null);
		for(Map mm : cList) {
			System.out.println(mm);
		}
		m.addAttribute("count",count);
		m.addAttribute("pageBar",pageBar);
		m.addAttribute("cList",cList);	
		m.addAttribute("writeMember",writeMember);
		return "community/communityAjax/findComment";
	}
	
	//찾아주세요 댓글 작성
	@RequestMapping("/find/commentWrite.do")
	@ResponseBody
	public Boolean insertComment(FindComment fc) {
		int result=service.insertComment(fc);
		return result>0?true:false;
	}
	//찾아주세요 댓글 삭제 → 댓글 상태 D로 변경
	@RequestMapping("/find/commentDelete.do")
	@ResponseBody
	public Boolean commentDelete(String findCommentNo) {
		int result=service.commentDelete(findCommentNo);
		return result>0?true:false;
	}
		
	//찾아주세요 대댓글 삭제 
	@RequestMapping("/find/comment2Delete.do")
	@ResponseBody
	public Boolean comment2Delete(String findCommentNo) {
		int result=service.comment2Delete(findCommentNo);
		return result>0?true:false;
	}
	
}
