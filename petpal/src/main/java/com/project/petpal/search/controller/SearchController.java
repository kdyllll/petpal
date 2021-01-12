package com.project.petpal.search.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.petpal.common.StarMapping;
import com.project.petpal.community.model.service.CommunityService;
import com.project.petpal.community.model.service.DailyService;
import com.project.petpal.community.model.service.FindService;
import com.project.petpal.community.model.service.PlaceService;
import com.project.petpal.community.model.service.TipService;
import com.project.petpal.community.model.vo.DailyImg;
import com.project.petpal.community.model.vo.Place;
import com.project.petpal.member.model.vo.Member;
import com.project.petpal.search.model.service.SearchService;
import com.project.petpal.store.model.service.StoreService;
import com.project.petpal.store.model.vo.Product;

@Controller
public class SearchController {
	
	@Autowired
	private SearchService service;
	@Autowired
	private StoreService storeService;
	@Autowired
	private DailyService dailyService;
	@Autowired
	private PlaceService placeService;
	@Autowired
	private FindService findService;
	@Autowired
	private TipService tipService;
	@Autowired
	private CommunityService cService;

	@RequestMapping("/search/searchKeyword.do")
	public String searchKeyword(String keyword,Model m,HttpSession session) {//검색했을때 상품,커뮤니티에 대한 모든 정보가져오는 서블릿
		String keyword2=keyword.replace(" ", "");//공백제거
		String[] keywords=keyword2.split("");//문자열을 문자배열로
		List<Product> starList=storeService.starList();//평점 리스트
		List<Product> pList =StarMapping.starMapping(service.searchProduct(keywords), starList);//재고있는 상품리스트
		int pCount=service.searchProductCount(keywords);//재고있는 상품리스트 개수
		List<Product> soList=service.searchSoldOutList(keywords);//품절리스트
		int soCount=service.searchSoldOutProductCount(keywords);//품절리스트 개수
		int storeCount=pCount+soCount;//스토어 검색결과
		
		Map keywordMap=new HashMap();
		keywordMap.put("keywords", keywords);
		//일상
		List<Map> dailyList=dailyService.selectDailyAll(keywordMap);
		for(Map map:dailyList) {
			//해시태그 리스트
			String postNo=(String) map.get("DAILYNO");
			List<String> hashList=cService.selectHashList(postNo);
			map.put("hashList", hashList);
			//좋아요 수
			int likeCnt=dailyService.selectLikeCnt(postNo);
			//댓글 수 
			int commentCnt=dailyService.selectCommentCnt(postNo);
			map.put("likeCnt",likeCnt);
			map.put("commentCnt",commentCnt);
		}
		//찾아주세요
		List<Map> findList=findService.selectFindAll(keywordMap);
		System.out.println(findList);
		//좋아요 수
		List<Map> findLikeCnt=findService.selectLikeCount();
		m.addAttribute("fLikeCnt",findLikeCnt);
		for(Map map:findList) {
			String postNo=(String) map.get("FINDNO");
			//댓글 수 
			int commentCnt=findService.countComment(postNo);
			map.put("commentCnt",commentCnt);
		}
		List<DailyImg> imgList=dailyService.selectMainImg();
		//좋아요
				Member loginMember=(Member)session.getAttribute("loginMember");
				if(loginMember!=null) {		
					List<String> dLike = dailyService.selectDailyLike(loginMember.getMemberNo());
					List<String> fLike = findService.selectFindLike(loginMember.getMemberNo());
					m.addAttribute("dLike", dLike);
					m.addAttribute("fLike",fLike);
				}
					
				//팔로우 검사
				if(loginMember != null) {
					String memberNo = loginMember.getMemberNo();
					List<Map> dFollowingList = dailyService.selectFollowingList(memberNo);
					List<Map> fFollowingList = findService.selectFollowingList(memberNo);
					m.addAttribute("dFollowing", dFollowingList);
					m.addAttribute("fFollowing", fFollowingList);
				}	
		//노하우
		List<Map> tipList=tipService.tipList(keywordMap);
				//좋아요 수 연동
				List<Map> count = dailyService.selectLikeCount();
		List<Place> placeList=placeService.placeList(keywordMap);
		
		int placeCount=placeService.selectCount(keywordMap);
		int dCount=dailyService.totalDailyCount(keywordMap);
		int fCount=findService.findTotalCount(keywordMap);
		int tCount=tipService.totalTipCount(keywordMap);
		int total=pCount+soCount+dCount+fCount+tCount+placeCount;//통합 검색결과
		m.addAttribute("placeCount",placeCount);
		m.addAttribute("placeList",placeList);
		m.addAttribute("tCount",tCount);
		m.addAttribute("tipList",tipList);
		m.addAttribute("fCount",fCount);
		m.addAttribute("findList",findList);
		m.addAttribute("dCount", dCount);
		m.addAttribute("count", count);
		m.addAttribute("dailyList",dailyList);
		m.addAttribute("imgList",imgList);
		m.addAttribute("pList",pList);
		m.addAttribute("soList",soList);
		m.addAttribute("storeCount",storeCount);
		m.addAttribute("total",total);
		m.addAttribute("keyword",keyword);
		return "search/searchAll";
	}
	@RequestMapping("/search/moveSearchStore.do")
	public String searchProductList(String keyword,Model m) {//검색후 상품 더보기
		String keyword2=keyword.replace(" ", "");//공백제거
		String[] keywords=keyword2.split("");//문자열을 문자배열로
		List<Product> starList=storeService.starList();//평점 리스트
		List<Product> pList =StarMapping.starMapping(service.searchProduct(keywords), starList);//재고있는 상품리스트
		int pCount=service.searchProductCount(keywords);//재고있는 상품리스트 개수
		List<Product> soList=service.searchSoldOutList(keywords);//품절리스트
		int soCount=service.searchSoldOutProductCount(keywords);//품절리스트 개수
		int storeCount=pCount+soCount;//스토어 검색결과
		
		m.addAttribute("pList",pList);
		m.addAttribute("soList",soList);
		m.addAttribute("storeCount",storeCount);
		m.addAttribute("keyword",keyword);
		return "search/searchStore";
	}
}
