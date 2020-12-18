package com.project.petpal.store.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;
import com.project.petpal.member.model.vo.Member;
import com.project.petpal.store.model.service.StoreService;
import com.project.petpal.store.model.vo.Product;
import com.project.petpal.store.model.vo.ProductImg;
import com.project.petpal.store.model.vo.Review;
import com.project.petpal.store.model.vo.Stock;

@Controller
public class StoreController {
	
	@Autowired
	private StoreService service;
	
	@RequestMapping("/store/moveStoreHome.do")//스토어 홈으로 이동하는 서블릿
	public String moveStoreHome(Model m) {
		
		 List<Product> dList=service.dogList(); //강아지 상품리스트
		 List<Product> cList=service.catList(); //고양이 상품리스트
		 List<Product> sList=service.smallList(); //소동물 상품리스트
		 m.addAttribute("dList",dList);
		 m.addAttribute("cList",cList);
		 m.addAttribute("sList",sList);
		return "store/storeHome";
	}

	@RequestMapping("/store/moveDetail.do")
	public String moveDetail(String productNo,Model m) {
		//상품번호로 상품 받기
		Product p=service.selectProduct(productNo);
		//상품 사진 받기
		List<ProductImg> pImg=service.selectImg(productNo);
		//재고리스트받기
		List<Stock> list=service.selectStockList(productNo);
		//색상리스트, 크기리스트 받기
		HashSet<String> colorSet=new HashSet<String>();
		HashSet<String> sizeSet=new HashSet<String>();
		for(Stock s:list) {
			if(s.getColor()!=null) {
				colorSet.add(s.getColor());
			}
			if(s.getProductSize()!=null) {
				sizeSet.add(s.getProductSize());
			}
		}
		List<String> colors=new ArrayList(colorSet);
		List<String> sizes=new ArrayList(sizeSet);
		//일상글 가져오기
		
		//리뷰 가져오기
		List<Review> reviews=service.selectReview(productNo);
		
		//문의 가져오기
		
		m.addAttribute("product",p);
		m.addAttribute("imgs",pImg);
		m.addAttribute("stockList",list);
		m.addAttribute("jsonStock",new Gson().toJson(list));
		m.addAttribute("colors",colors);
		m.addAttribute("sizes",sizes);
		m.addAttribute("reviewList",reviews);
		
		return "store/productDetail";
	}
	@RequestMapping("/store/moveCategory.do")
	public String moveCategory(String cNo,Model m) {
		if(cNo.equals("S")) {//소동물 더보기
			cNo="S1','S2','S3','S4";
		}else if(!cNo.contains("S")){//소동물 누른게 아니면
			List<Map> scList=service.subCateList(cNo);//소분류 리스트
			m.addAttribute("scList",scList);
		}
		List<Product> soList=service.soldOutList(cNo);
		if(soList.size()!=0) {//품절리스트가 0일수도 있음
			m.addAttribute("soList",soList);
		}
		List<Product> list=service.categoryList(cNo);
		m.addAttribute("list",list);
		return "store/categoryStore";
	}
	
	@RequestMapping("/store/reviewEnd.do") 
	public String insertReview(HttpSession session, Model m, String star, String content, String productNo, String detailNo,
			@RequestParam(value="reviewImg", required=false) MultipartFile reviewImg) {
		Member loginMember=(Member)session.getAttribute("loginMember");
		
		Review r=new Review();
		r.setDetailNo(detailNo);
		r.setMemberNo(loginMember.getMemberNo());
		r.setContent(content);
		r.setStar(Integer.parseInt(star));
		String path=session.getServletContext().getRealPath("/resources/upload/store/review");		
		File dir=new File(path);
		if(!dir.exists()) dir.mkdirs();//폴더를 생성
		if(!reviewImg.isEmpty()) {
			  //파일명생성하기
			  String originalName=reviewImg.getOriginalFilename();
			  String ext=originalName.substring(originalName.lastIndexOf(".")+1);
			  //리네임규칙
			  SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMdd_HHmmssSSS");
			  int rndValue=(int)(Math.random()*10000);
			  String reName=sdf.format(System.currentTimeMillis())+"_"+rndValue+"."+ext;
			  try {
				  reviewImg.transferTo(new File(path+"/"+reName));
			  }catch(IOException e) {
				  e.printStackTrace();
				  m.addAttribute("msg","오류가 발생하였습니다.다시 시도해주세요.");
			  }
			  r.setFileName(reName);
		}
		
		int result=service.insertReview(r);
		m.addAttribute("loc","/store/moveDetail.do?productNo="+productNo);
		m.addAttribute("msg",result>0?"리뷰를 등록했습니다.":"리뷰 등록을 실패했습니다.");
		
		return "common/msg";
	}
	
	@RequestMapping("/store/deleteReview.do")
	public String deleteReview(String reviewNo,String productNo,Model m) {
		int result=service.deleteReview(reviewNo);
		if(result>0) {
			m.addAttribute("msg","리뷰를 삭제했습니다.");
		}else {
			m.addAttribute("msg","리뷰 삭제에 실패했습니다.");
		}
		m.addAttribute("loc","/store/moveDetail.do?productNo="+productNo);
		return "common/msg";
	};
	
	@RequestMapping("/store/reviewEditEnd.do")
	public String updateReview(HttpSession session, String reviewNo,String star,
			@RequestParam(value="reviewImg", required=false) MultipartFile reviewImg,
			@RequestParam(value="content", required=false) String content,
			String productNo, Model m) {
		//리뷰 수정하기 (리뷰 별점, 사진, 내용)
		
		Review r=new Review();
		r.setReviewNo(reviewNo); //리뷰번호
		r.setStar(Integer.parseInt(star)); //별점
		if(content!=null) r.setContent(content); //내용
		//사진
		String path=session.getServletContext().getRealPath("/resources/upload/store/review");		
		File dir=new File(path);
		if(!dir.exists()) dir.mkdirs();//폴더를 생성
		if(reviewImg!=null&&!reviewImg.isEmpty()) {
			  //파일명생성하기
			  String originalName=reviewImg.getOriginalFilename();
			  String ext=originalName.substring(originalName.lastIndexOf(".")+1);
			  //리네임규칙
			  SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMdd_HHmmssSSS");
			  int rndValue=(int)(Math.random()*10000);
			  String reName=sdf.format(System.currentTimeMillis())+"_"+rndValue+"."+ext;
			  try {
				  reviewImg.transferTo(new File(path+"/"+reName));
			  }catch(IOException e) {
				  e.printStackTrace();
				  m.addAttribute("msg","오류가 발생하였습니다.다시 시도해주세요.");
			  }
			  r.setFileName(reName);
		}
		
		int result=service.updateReview(r);
		m.addAttribute("loc","/store/moveDetail.do?productNo="+productNo);
		m.addAttribute("msg",result>0?"리뷰를 수정했습니다.":"리뷰 수정을 실패했습니다.");
		
		return "common/msg";
	};
	
	//리뷰 답변 업데이트
	@RequestMapping("/store/reviewComment.do")
	public String reviewComment(String reviewComment,String productNo,String reviewNo,Model m) {
		Map map=new HashMap();
		map.put("reviewComment", reviewComment);
		map.put("reviewNo", reviewNo);
		int result=service.reviewComment(map);
		m.addAttribute("loc","/store/moveDetail.do?productNo="+productNo);
		m.addAttribute("msg",result>0?"답변을 작성했습니다.":"답변 작성을 실패했습니다.");
		return "common/msg";
	}

}
