package com.project.petpal.community.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.petpal.common.PageBarFactory;
import com.project.petpal.community.model.service.PlaceService;
import com.project.petpal.community.model.vo.PlaceComment;

@Controller
public class PlaceAjaxController {
	
	@Autowired
	private PlaceService service;
	
	@RequestMapping("/place/commentWrite.do")
	public String commentWrite(PlaceComment pc,Model m) {//댓글썼을때
		int numPerpage=5;
		int result=service.insertComment(pc);
		List<PlaceComment> cList=service.commentList(pc.getPlaceNo(),1,numPerpage);
		int count=service.commentCount(pc.getPlaceNo());//댓글개수
		m.addAttribute("count",count);
		m.addAttribute("pageBar",PageBarFactory.getPageBar(count, 1, numPerpage,null,pc.getPlaceNo(), "movePlaceDetail.do"));
		m.addAttribute("cList",cList);
		return "community/communityAjax/placeComment";
	}

}
