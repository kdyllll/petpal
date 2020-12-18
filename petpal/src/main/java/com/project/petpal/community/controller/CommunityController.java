package com.project.petpal.community.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CommunityController {
	@RequestMapping("/community/communityList.do")
	public String communityList() {
		return "community/communityMain";
	}
}
