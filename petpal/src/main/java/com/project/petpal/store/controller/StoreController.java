package com.project.petpal.store.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
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
import com.project.petpal.common.StarMapping;
import com.project.petpal.community.model.vo.DailyImg;
import com.project.petpal.member.model.vo.Member;
import com.project.petpal.store.model.service.StoreService;
import com.project.petpal.store.model.vo.Product;
import com.project.petpal.store.model.vo.ProductImg;
import com.project.petpal.store.model.vo.Qna;
import com.project.petpal.store.model.vo.Review;
import com.project.petpal.store.model.vo.Stock;

@Controller
public class StoreController {
	
	@Autowired
	private StoreService service;
	
	@RequestMapping("/store/moveStoreHome.do")//스토어 홈으로 이동하는 서블릿
	public String moveStoreHome(Model m) {
		 List<Product> starList=service.starList();//평균별점 리스트
		 
		 List<Product> dList=StarMapping.starMapping(service.dogList(),starList);//강아지 상품리스트
		 List<Product> cList=StarMapping.starMapping(service.catList(),starList); //고양이 상품리스트
		 List<Product> sList=StarMapping.starMapping(service.smallList(),starList); //소동물 상품리스트
		 
		 m.addAttribute("dList",dList);
		 m.addAttribute("cList",cList);
		 m.addAttribute("sList",sList);	
		return "store/storeHome";
	}

	@RequestMapping("/store/moveDetail.do")
	public String moveDetail(String productNo,Model m,HttpSession session) {
		//상품번호로 상품 받기
		Product p=service.selectProduct(productNo);
		//상품 사진 받기
		List<ProductImg> pImg=service.selectImg(productNo);
		//재고리스트받기
		List<Stock> list=service.selectStockList(productNo);
		List<Stock> stockList=new ArrayList<Stock>();
		for(Stock s:list) {
			if(s.getPrice()>0) {
				stockList.add(s);
			}
		}

		//일상글 가져오기
		List<DailyImg> dailyList=service.selectDailyImg(productNo);
		
		//리뷰, 문의 갯수, 총 별점
		int reviewCount=service.totalReviewCount(productNo);
		int qnaCount=service.totalQnaCount(productNo);
		
		//리뷰 평균 점수
		double reviewAvg=0.0;
		if(reviewCount!=0) {
			reviewAvg=service.selectAvgReview(productNo);
		}
		//관심상품 여부
		Member loginMember=(Member)session.getAttribute("loginMember");
		String fav="";
		if(loginMember!=null) {
			List<Product> favList=service.favList(loginMember.getMemberNo());
			for(Product pl:favList) {
				if(p.getProductNo().equals(productNo)) {//상품이 등록되어있으면 삭제
					fav="fav";
				}
			}
		}
		
		m.addAttribute("product",p);
		m.addAttribute("imgs",pImg);
		m.addAttribute("stockList",stockList);
		m.addAttribute("jsonStock",new Gson().toJson(stockList));
		m.addAttribute("dailyList",dailyList);
		m.addAttribute("reviewCount",reviewCount);
		m.addAttribute("qnaCount",qnaCount);
		m.addAttribute("reviewAvg",reviewAvg);
		m.addAttribute("fav",fav);
		return "store/productDetail";
	}
	@RequestMapping("/store/moveCategory.do")//카테고리별 상품리스트로 이동하는 서블릿
	public String moveCategory(String cNo,Model m) {
		String first="";
		String second="";
		switch(cNo.charAt(0)) {
			case 'D':first="강아지";
			break;
			case 'C':first="고양이";
			break;
			case 'S':first="소동물";
			break;
		}
		switch(cNo.charAt(1)) {
			case '1':second=first.equals("소동물")?"햄스터":"홈/리빙";
			break;
			case '2':second=first.equals("소동물")?"토끼":"식품";
			break;
			case '3':second=first.equals("소동물")?"물고기":"옷";
			break;
			case '4':second=first.equals("소동물")?"새":"용품";
			break;
			case '5':second="목욕/미용";
			break;
		}
		m.addAttribute("first",first);
		m.addAttribute("second",second);
		List<Product> starList=service.starList();//평균별점 리스트
		
		if(!cNo.contains("S")){//소동물 누른게 아니면
			List<Map> scList=service.subCateList(cNo);//소분류 리스트
			m.addAttribute("scList",scList);
		}
		List<Product> soList=StarMapping.starMapping(service.soldOutList(cNo),starList);//품절리스트
		if(soList.size()!=0) {//품절리스트가 0일수도 있음
			m.addAttribute("soList",soList);
		}
		List<Product> list=StarMapping.starMapping(service.categoryList(cNo),starList);
		m.addAttribute("list",list);//상품리스트
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
	public String updateReview(HttpSession session, String reviewNo,String star,String deleteStatus,
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
		}else {//사진파일이 없으면
			if(deleteStatus.equals("delete")) {//삭제된 상태라면
				//리뷰의 사진 지우기
				r.setDeleteStatus(deleteStatus);
			}
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
	
	//문의 작성
	@RequestMapping("/store/qnaEnd.do")
	public String insertQna(HttpSession session,String productNo,String category,String content,
			@RequestParam(value="secret", required=false) String secret,
			Model m) {
		//문의 : 문의 번호, 상품 번호, 작성자 번호, 내용, 댓글, 작성일, 댓글작성일, 카테고리, 비밀글여부(Y/N)
		Member loginMember=(Member)session.getAttribute("loginMember");
		Qna q=new Qna();
		q.setProductNo(productNo);
		q.setMemberNo(loginMember.getMemberNo());
		q.setContent(content);
		q.setCategory(category);
		q.setSecret(secret);
		
		int result=service.insertQna(q);
		m.addAttribute("msg",result>0?"문의가 작성되었습니다.":"문의 작성에 실패했습니다.");
		m.addAttribute("loc","/store/moveDetail.do?productNo="+productNo);		
		return "common/msg";
	}
	
	//문의 삭제
	@RequestMapping("/store/deleteQna.do")
	public String deleteQna(String productNo,String qnaNo,Model m) {
		int result=service.deleteQna(qnaNo);
		m.addAttribute("msg",result>0?"문의가 삭제되었습니다.":"문의 삭제에 실패했습니다.");
		m.addAttribute("loc","/store/moveDetail.do?productNo="+productNo);
		return "common/msg";
	}
	
	//문의 수정
	@RequestMapping("/store/qnaEditEnd.do")
	public String updateQna(String productNo,String qnaNo,String category,String content,
			@RequestParam(value="secret", required=false) String secret,
			Model m) {
		Qna qna=new Qna();
		qna.setCategory(category);
		qna.setContent(content);
		qna.setSecret(secret);
		qna.setQnaNo(qnaNo);
		int result=service.updateQna(qna);

		m.addAttribute("msg",result>0?"문의가 수정되었습니다.":"문의 수정에 실패했습니다.");
		m.addAttribute("loc","/store/moveDetail.do?productNo="+productNo);
		return "common/msg";
		
	}
	
	//문의 답변 작성
	@RequestMapping("/store/writeQnaComment.do")
	public String writeQnaComment(String productNo,String qnaNo,String qnaComment,Model m) {
		Qna qna=new Qna();
		qna.setQnaNo(qnaNo);
		qna.setQnaComment(qnaComment);
		int result=service.writeQnaComment(qna);
		
		m.addAttribute("msg",result>0?"답변이 작성되었습니다.":"답변 작성에 실패했습니다.");
		m.addAttribute("loc","/store/moveDetail.do?productNo="+productNo);
		return "common/msg";
	}
	
	//문의 답변 수정
	@RequestMapping("/store/editQnaComment.do")
	public String editQnaComment(String productNo,String qnaNo,String qnaComment,Model m) {
		Qna qna=new Qna();
		qna.setQnaNo(qnaNo);
		qna.setQnaComment(qnaComment);
		int result=service.editQnaComment(qna);
		
		m.addAttribute("msg",result>0?"답변이 수정되었습니다.":"답변 수정에 실패했습니다.");
		m.addAttribute("loc","/store/moveDetail.do?productNo="+productNo);
		return "common/msg";
	}
	
	//문의 삭제
	@RequestMapping("/store/deleteQnaComment.do")
	public String deleteQnaComment(String productNo,String qnaNo,Model m) {
		int result=service.deleteQnaComment(qnaNo);
		
		m.addAttribute("msg",result>0?"답변이 삭제되었습니다.":"답변 삭제에 실패했습니다.");
		m.addAttribute("loc","/store/moveDetail.do?productNo="+productNo);
		return "common/msg";
	}

}
