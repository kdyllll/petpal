package com.project.petpal.community.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
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

import com.project.petpal.common.PageBarFactory;
import com.project.petpal.community.model.service.PlaceService;
import com.project.petpal.community.model.vo.Hashtag;
import com.project.petpal.community.model.vo.Place;
import com.project.petpal.community.model.vo.PlaceComment;
import com.project.petpal.community.model.vo.PlaceImg;
import com.project.petpal.member.model.service.MemberService;
import com.project.petpal.member.model.vo.Member;

@Controller
public class PlaceController {

	@Autowired
	private PlaceService service;
	
	@RequestMapping("/place/movePlaceWrite.do")//글쓰기창 이동 서블릿
	public String movePlacePostWrite(HttpSession session,Model m) {
		if(session.getAttribute("loginMember")==null){
			m.addAttribute("msg","로그인 후 사용 가능합니다.");
			m.addAttribute("loc","/member/moveLogin.do");
			return "common/msg";
		}
		return "community/placeWrite";
	}
	@RequestMapping("/place/placeWriteEnd.do")//글쓰기 작성후 서블릿
	public String placePostWriteEnd(Place p,@RequestParam(value="content",required=false, defaultValue=" ")String[] content,String[] hashtag,Model m,@RequestParam(value="pic", required=false)MultipartFile[] files,HttpSession session) {
		p.setMemberNo(((Member)session.getAttribute("loginMember")).getMemberNo());//회원번호 글객체에 저장
		String path=session.getServletContext().getRealPath("/resources/upload/place");
		File dir=new File(path);
		if(!dir.exists()) dir.mkdirs();//폴더를 생성
		List<PlaceImg> list = new ArrayList();
		for(int i=0;i<content.length;i++) {
		if(!files[i].isEmpty()) {
			  //파일명생성하기
			  String originalName=files[i].getOriginalFilename();
			  String ext=originalName.substring(originalName.lastIndexOf(".")+1);
			  //리네임규칙
			  SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMdd_HHmmssSSS");
			  int rndValue=(int)(Math.random()*10000);
			  String reName=sdf.format(System.currentTimeMillis())+"_"+rndValue+"."+ext;
			  try {
				  files[i].transferTo(new File(path+"/"+reName));
			  }catch(IOException e) {//작성실패시
				  e.printStackTrace();
				  m.addAttribute("msg","오류가 발생하였습니다.다시 시도해주세요.");
			  }
			  PlaceImg pi=new PlaceImg();
			  pi.setContent(content[i]);
			  pi.setFileName(reName);
			  list.add(pi);
		}
		
	}
		try {
			int result=service.insertPlace(p, list, hashtag);
			m.addAttribute("msg","작성에 성공하였습니다.");
			m.addAttribute("loc","/place/movePlaceList.do");
		}catch(Exception e) {
			e.printStackTrace();
			m.addAttribute("msg","작성에 실패하였습니다.");
		}
		
		
		return "common/msg";
	}
	@RequestMapping("/place/movePlaceList.do")//장소후기 리스트 이동 서블릿
	public String placeList(Model m,String category,
			@RequestParam(value="hashtag", required=false) String hashtag,
			@RequestParam(value="cPage",defaultValue="1") int cPage) {
		//해시태그 검색어로 검색됐을 경우 구분
		Map<String,String> keyword=new HashMap<String,String>();
		keyword.put("hashtag", hashtag);
		keyword.put("category", category);
		String search="";
		//검색어를 통해 들어오는 거면 search도 보내서 정렬버튼 없앰
		if(hashtag!=null) {
			search="search";
		}
				
				
		int numPerpage=7;//한페이지의 출력할 개수
		List<Place> list=service.placeList(cPage,numPerpage,keyword);//페이징된 리스트
		int totalData=service.selectCount(keyword);//장소후기 총개수
		long curTime=System.currentTimeMillis();//현재날짜
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		for(Place p:list) {
			try {
			Date pd=sdf.parse(p.getPlaceDate());
			long pTime=pd.getTime();//작성날짜
			long cha=(curTime-pTime)/(1000*60);//분단위
			String status="";
			if(cha<60) {//1시간보단 적을경우
				status=cha+"분 전";
				p.setPlaceDate(status);
			}else if(cha>=60&&cha<1440) {//1시간~23시간
				status=cha/60+"시간 전";
				p.setPlaceDate(status);
			}else if(cha>=1440&&cha<43200) {//1일~29일
				status=cha/60/24+"일 전";
				p.setPlaceDate(status);
			}else {//1달이상은 기본 날짜 출력
				Date d=sdf.parse(p.getPlaceDate());
				p.setPlaceDate(sdf.format(d));
			}
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		m.addAttribute("search",search);
		m.addAttribute("pageBar",PageBarFactory.getPageBar(totalData, cPage, numPerpage,category,null, "movePlaceList.do"));
		m.addAttribute("list",list);
		return "community/placeList";
	}
	@Autowired
	private MemberService mService;
	@RequestMapping("/place/movePlaceDetail.do")
	public String selectPlace(String placeNo,Model m,@RequestParam(value="cPage",defaultValue="1") int cPage) {
		int numPerpage=5;
		List<Place> list = service.selectPlace(placeNo);//장소후기리스트 (사진과내용이 여러개라서 리스트)
		List<PlaceComment> cList=service.commentList(placeNo,cPage,numPerpage);//댓글리스트
		int count=service.commentCount(placeNo);//댓글개수
		List<Hashtag> hList=service.hashList(placeNo);//해쉬태그리스트
		m.addAttribute("pageBar",PageBarFactory.getPageBar(count, cPage, numPerpage,null,placeNo, "movePlaceDetail.do"));
		m.addAttribute("count", count);
		m.addAttribute("hList",hList);
		m.addAttribute("cList",cList);
		m.addAttribute("list", list);
		return "community/placeDetail";
	}
	@RequestMapping("/place/movePlaceUpdate.do")
	public String movePlaceUpdate(String placeNo,Model m) {
		List<Place> list=service.selectPlace(placeNo);
		List<Hashtag> hList=service.hashList(placeNo);
		m.addAttribute("list",list);
		m.addAttribute("hList",hList);
		return "community/placeUpdate";
	}
	@RequestMapping("/place/placeUpdateEnd.do")
	public String updatePlace(Place p,String[] hashtag,String[] f,@RequestParam(value="content",required=false, defaultValue=" ")String[] content,@RequestParam(value="pic", required=false)MultipartFile[] files,Model m,HttpSession session) {
		List<PlaceImg> list = new ArrayList();
		int j=0;//content인덱스
		if(f!=null) {//기존사진이 있다면
			for(int i=0;i<f.length;i++) {
				PlaceImg pi=new PlaceImg();
				System.out.println("기존사진"+f[i]);
				pi.setFileName(f[i]);
				pi.setContent(content[j]);
				j++;
				list.add(pi);
			}
		}
		String path=session.getServletContext().getRealPath("/resources/upload/place");
		File dir=new File(path);
		
		for(int i=0;i<files.length;i++) {
			if(!files[i].isEmpty()) {
				 //파일명생성하기
				  String originalName=files[i].getOriginalFilename();
				  System.out.println("사진추가"+originalName);
				  String ext=originalName.substring(originalName.lastIndexOf(".")+1);
				  //리네임규칙
				  SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMdd_HHmmssSSS");
				  int rndValue=(int)(Math.random()*10000);
				  String reName=sdf.format(System.currentTimeMillis())+"_"+rndValue+"."+ext;
				  try {
					  files[i].transferTo(new File(path+"/"+reName));
				  }catch(IOException e) {//작성실패시
					  e.printStackTrace();
					  m.addAttribute("msg","오류가 발생하였습니다.다시 시도해주세요.");
				  }
				  PlaceImg pi=new PlaceImg();
				  pi.setContent(content[j]);
				  j++;
				  pi.setFileName(reName);
				  list.add(pi);
			}
		}
		try {
			int result=service.updatePlace(p, list, hashtag);
			m.addAttribute("msg","수정에 성공하였습니다.");
			m.addAttribute("loc","/place/movePlaceList.do");
		}catch(Exception e) {
			e.printStackTrace();
			m.addAttribute("msg","수정에 실패하였습니다.");
		}
		
		
		return "common/msg";
	}
	
}
