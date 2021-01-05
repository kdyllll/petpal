package com.project.petpal.community.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.petpal.community.model.service.DailyService;
import com.project.petpal.community.model.service.FindService;
import com.project.petpal.community.model.service.PlaceService;
import com.project.petpal.community.model.service.TipService;
import com.project.petpal.community.model.vo.DailyImg;

@Controller
public class CommunityController {
   
   @Autowired
   private FindService fService;
   @Autowired
   private TipService tService;
   @Autowired
   private PlaceService pService;
   @Autowired
   private DailyService dService;
	
	@RequestMapping("/community/communityList.do")
	public String communityList() {
		//일상 4개(사진,작성자사진,작성자닉네임) / 2주 안에 올린 것 중 좋아요 순 
		List<Map> dailyList=dService.selectDailyHeartWeek(1,4);
		List<DailyImg> imgList=dService.selectMainImg();
		//노하우 4개(제목,작성자닉네임)
		//장소후기 3개(제목,내용,장소)
		//찾아주세요 5개(장소,제목,내용) 
		return "community/communityMain";
	}
}
