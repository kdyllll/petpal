package com.project.petpal;

import java.util.List;
import java.util.Locale;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.project.petpal.community.model.service.DailyService;
import com.project.petpal.store.model.service.StoreService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
    @Autowired
    private DailyService dService;
    
    @Autowired
	private StoreService sService;
	   
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		/*
		 * logger.info("Welcome home! The client locale is {}.", locale);
		 * 
		 * Date date = new Date(); DateFormat dateFormat =
		 * DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		 * 
		 * String formattedDate = dateFormat.format(date);
		 * 
		 * model.addAttribute("serverTime", formattedDate );
		 */
		//판매량 많은 상품 4개(상품 사진/상품 이름/상품 가격/별점)
//		List<Map> productList=sService.selectMainProduct();
//				
//		//별점 높은 리뷰 6개(리뷰사진/리뷰내용/작성일/작성자닉네임/상품명)
//		List<Map> reviewList=sService.selectMainReview();		
//		
//		//좋아요 많은 일상 2개 + 상품태그(일상사진/내용/작성자/상품태그)
//		List<Map> dailyList=sService.selectMainDaily();


		return "index";


	}
	
}
