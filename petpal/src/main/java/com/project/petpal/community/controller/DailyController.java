package com.project.petpal.community.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.project.petpal.admin.model.vo.Product;
import com.project.petpal.admin.model.vo.ProductImg;
import com.project.petpal.community.model.service.DailyService;
import com.project.petpal.community.model.vo.Daily;
import com.project.petpal.community.model.vo.DailyCoord;
import com.project.petpal.community.model.vo.DailyImg;
import com.project.petpal.community.model.vo.Hashtag;
import com.project.petpal.member.model.vo.Member;



@Controller
public class DailyController {
	
	@Autowired
	private DailyService service;
	
	//글 입력으로 이동
	@RequestMapping("/daily/moveWrite.do")
	public String moveDailyWrite(Model m) {
		return "community/dailyWrite";
	}
	
	//글 목록으로 이동
	@RequestMapping("/daily/moveList.do")
	public String moveDailyList(Model m) {
		List<Map> dailyList=service.selectDailyAll();
		List<DailyImg> imgList=service.selectMainImg();
		List<Hashtag> hashList=service.selectHashAll();
		for(Map map:dailyList) {
			for(Object o:map.keySet()) {
				System.out.println(o);
				System.out.println(map.get(o));
			}
		}
		
		//좋아요 수
		//댓글 수 보내야 함
		m.addAttribute("dailyList",dailyList);
		m.addAttribute("imgList",imgList);
		m.addAttribute("hashList",hashList);
		return "community/dailyList";
	}
	
	//글입력
	@RequestMapping("/daily/dailyWriteEnd.do")
	public String insertDaily(HttpSession session,Model m,String content,
			@RequestParam(value="pic", required=false) MultipartFile[] pic,
			@RequestParam(value="coord", required=false) String[] productNo,
			@RequestParam(value="coord", required=false) String[] percentX,
			@RequestParam(value="coord", required=false) String[] percentY,
			@RequestParam(value="coord", required=false) String[] index,
			@RequestParam(value="hashtag", required=false) String[] hashtag
			) {
		//받아야 하는것
		//1.글내용 2.작성자(접속자) 3.사진(최대5개) 4.사진 당 상품좌표 5.해시태그
		//DB 
		//글 : 글번호, 작성자번호, 내용, 작성일
		//사진 : 사진번호, 글번호, 파일 이름
		//좌표 : 사진번호, 상품번호, x좌표, y좌표
		
		//글
		Member login=(Member)session.getAttribute("loginMember");
		Daily d=Daily.builder().memberNo(login.getMemberNo()).content(content).build();
		
		//사진
		String path=session.getServletContext().getRealPath("/resources/upload/community/daily");
		File dir=new File(path);
		if(!dir.exists()) dir.mkdirs(); 
		List<DailyImg> files=new ArrayList<DailyImg>();
		int cnt=0;
		for(MultipartFile f:pic) {
			if(!f.isEmpty()) {
				String originalName=f.getOriginalFilename();
				String ext=originalName.substring(originalName.lastIndexOf(".")+1);
				
				SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMdd_HHmmssSSS");
				int rndValue=(int)(Math.random()*10000);
				String reName=sdf.format(System.currentTimeMillis())+"_"+rndValue+"."+ext;
				try {
					f.transferTo(new File(path+"/"+reName));
				}catch(IOException e) {
					e.printStackTrace();
				}
				if(cnt==0) {
					DailyImg img=DailyImg.builder().dailyImgName(reName).status("M").build();
					files.add(img);
				}else {
					DailyImg img=DailyImg.builder().dailyImgName(reName).status("S").build();
					files.add(img);
				}
				
			}
		}
		
		//좌표
		//사진번호, 상품번호, x좌표, y좌표
		//tag0~tag4까지 배열에 하나씩 들어있는데 음 사진번호는 사진 넣고나서 생기니까 트렌젝션을 해야해
		//하고나서 이 네개를 한번에 묶어서 하나로 보내야 하는건데, 그러면 객체가 들어있는 list인게 편하겠따
		//순서가 글 인서트 → 글번호 가져오기(객체필요) → 사진 인서트 → 사진번호 가져오기(객체필요) → 좌표들을 사진번호에 맞게 객체에 넣고(객체 필요) → 좌표 인서트
		List<DailyCoord> coords=new ArrayList<DailyCoord>();
		if(productNo!=null&&percentX!=null&&percentY!=null&&index!=null) {
//			for(String s:coord) {
//				String[] code=s.split(",");
//				System.out.println(s);
//				System.out.println(code[0]);
//				System.out.println(code[1]);
//				System.out.println(code[2]);
//				System.out.println(code[3]);
//				DailyCoord dc=DailyCoord.builder().productNo(code[0]).xxCode(Double.parseDouble(code[1])).yyCode(Double.parseDouble(code[2])).index(code[3]).build();
//				coords.add(dc);
//				System.out.println(dc);
//			};
			for(int i=0;i<productNo.length;i++) {
				DailyCoord dc=DailyCoord.builder().productNo(productNo[i]).xxCode(Double.parseDouble(percentX[i])).
						yyCode(Double.parseDouble(percentY[i])).index(index[i]).build();
				coords.add(dc);
			}
		};
		for(DailyCoord dc2:coords) {
			System.out.println(dc2);
		}
		
		//해시태그
		List<Hashtag> hashList=new ArrayList();
		for(String hash:hashtag) {
			Hashtag h=new Hashtag();
			h.setHashContent(hash);
			hashList.add(h);
		};
		
		//보내기
		int result=service.insertDaily(d,files,coords,hashList);

		
		
		m.addAttribute("msg",result>0?"게시글이 작성되었습니다.":"게시글 작성에 실패했습니다.");
		m.addAttribute("loc","/daily/moveList.do");
		return "common/msg";
	}
	
	//글 디테일로 이동
	@RequestMapping("/daily/moveDetail.do")
	public String moveDetail(String dailyNo,Model m) {
		//글사진, 글내용, 글좋아요, 
		return "community/dailyDetail";
	}
	
	
	
	
	//AJAX
	
	//상품이름 자동완성
	@RequestMapping("/daily/autoCompleteAjax.do")
	@ResponseBody
	public List<Product> autoCompleteAjax(HttpServletResponse response, String key) throws IOException{
	
		List<Product> list=service.selectProductName(key);
		return list;
	}
	
	//+버튼에 호버하면 상품정보 뜰 수 있도록
	@RequestMapping("/daily/dailyProduct.do")
	@ResponseBody
	public ProductImg dailyProductAjax(String name) {
		//받아오는건 상품이름 
		String productNo=service.selectProductNo(name);
		ProductImg p=service.selectDailyProduct(productNo); //서비스에서 상품이름으로 상품번호 조회한다음에 상품 사진 테이블에서 가져와야함
		//이미지번호, 상품번호, 이미지이름, 타입(메인M)	
		return p;		
	}
	
	

}
