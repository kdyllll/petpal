package com.project.petpal.community.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.petpal.common.PageBarFactory;
import com.project.petpal.community.model.service.PlaceService;
import com.project.petpal.community.model.vo.PlaceComment;

@Controller
public class PlaceAjaxController {
	
	@Autowired
	private PlaceService service;
	
	@RequestMapping("/place/commentWrite.do")
	public String commentWrite(PlaceComment pc,Model m,String placeMemberNo) {//댓글썼을때
		int numPerpage=5;
		int result=service.insertComment(pc);
		List<PlaceComment> cList=service.commentList(pc.getPlaceNo(),1,numPerpage);
		int count=service.commentCount(pc.getPlaceNo());//댓글개수
		
		m.addAttribute("count",count);
		m.addAttribute("placeMemberNo",placeMemberNo);
		m.addAttribute("pageBar",PageBarFactory.getPageBar(count, 1, numPerpage,null,pc.getPlaceNo(), "movePlaceDetail.do"));
		m.addAttribute("cList",cList);
		return "community/communityAjax/placeComment";
	}
		
	//장소 댓글 삭제 → 댓글 상태 D로 변경
	@RequestMapping("/place/commentDelete.do")
	@ResponseBody
	public Boolean commentDelete(String placeCommentNo) {
		int result=service.commentDelete(placeCommentNo);
		return result>0?true:false;
	}
	
	//장소 대댓글 삭제 
	@RequestMapping("/place/comment2Delete.do")
	@ResponseBody
	public Boolean comment2Delete(String placeCommentNo) {
		int result=service.comment2Delete(placeCommentNo);
		return result>0?true:false;
	}
	
	//댓글 에이작스 불러오기
	@RequestMapping("/place/commentAjax.do")
	public String commentWrite(String placeNo,Model m,String placeMemberNo) {//댓글썼을때
		int numPerpage=5;
		List<PlaceComment> cList=service.commentList(placeNo,1,numPerpage);
		int count=service.commentCount(placeNo);//댓글개수
		m.addAttribute("count",count);
		m.addAttribute("placeMemberNo",placeMemberNo);
		m.addAttribute("pageBar",PageBarFactory.getPageBar(count, 1, numPerpage,null,placeNo, "movePlaceDetail.do"));
		m.addAttribute("cList",cList);
		return "community/communityAjax/placeComment";
	}

}
