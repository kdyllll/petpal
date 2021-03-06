package com.project.petpal.community.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.petpal.community.model.service.CommunityService;
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
   @Autowired
   private CommunityService service;
	
   //커뮤니티 메인
	@RequestMapping("/community/communityList.do")
	public String communityList(Model m) {
		//일상 4개(사진,작성자사진,작성자닉네임) / 2주 안에 올린 것 중 좋아요 순 
		List<Map> dailyList=dService.selectDailyHeartWeek(1,4);
		//노하우 4개(제목,작성자닉네임)
		List<Map> tipList=tService.selectTipHeartWeek(1,4);
		//장소후기 3개(제목,내용,장소)
		List<Map> placeList=pService.selectPlaceHeartWeek(1,3);
		//찾아주세요 5개(장소,제목,내용) 
		List<Map> findList=fService.selectFindHeartWeek(1,5);	
		
		m.addAttribute("dailyList",dailyList);
		m.addAttribute("tipList",tipList);
		m.addAttribute("placeList",placeList);
		m.addAttribute("findList",findList);
		return "community/communityMain";
	}
	
	//해시태그 검색
	@RequestMapping("/community/hashSearch.do")
	public String hashSearch(String hashtag,Model m) {
		//일상 4개(사진,작성자사진,작성자닉네임,해시태그)
		List<Map> dailyList=dService.selectDailyHash(1,4,hashtag);
		for(Map map:dailyList) {
			String postNo=(String) map.get("DAILYNO");
			List<String> hashList=service.selectHashList(postNo);
			map.put("hashList", hashList);
		}
		//노하우 4개(사진,제목,작성자사진,작성자닉네임,해시태그)
		List<Map> tipList=tService.selectTipHash(1,4,hashtag);
		for(Map map:tipList) {
			String postNo=(String) map.get("TIPNO");
			List<String> hashList=service.selectHashList(postNo);
			map.put("hashList", hashList);
		}
		//장소후기 3개(사진,제목,작성자사진,작성자닉네임,장소)
		List<Map> placeList=pService.selectPlaceHash(1,4,hashtag);
		for(Map map:placeList) {
			String postNo=(String) map.get("PLACENO");
			List<String> hashList=service.selectHashList(postNo);
			map.put("hashList", hashList);
		}
		
		m.addAttribute("hashtag",hashtag);
		m.addAttribute("dailyList",dailyList);
		m.addAttribute("tipList",tipList);
		m.addAttribute("placeList",placeList);		
		
		return "community/hashSearch";
	}
}
