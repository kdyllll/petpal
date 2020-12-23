package com.project.petpal.community.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.petpal.community.model.service.PlaceService;
import com.project.petpal.community.model.vo.PlaceComment;

@Controller
public class PlaceAjaxController {
	
	@Autowired
	private PlaceService service;
	
	@RequestMapping("/place/commentWrite.do")
	public String commentWrite(PlaceComment pc,Model m) {
		int result=service.insertComment(pc);
		List<PlaceComment> cList=service.commentList(pc.getPlaceNo());
		m.addAttribute("cList",cList);
		return "community/communityAjax/placeComment";
	}

}
