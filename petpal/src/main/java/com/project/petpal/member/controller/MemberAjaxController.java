package com.project.petpal.member.controller;


import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Properties;
import java.util.Random;

import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.project.petpal.admin.model.service.AdminService;
import com.project.petpal.common.AjaxPageBarFactory;
import com.project.petpal.community.model.vo.Daily;
import com.project.petpal.community.model.vo.DailyImg;
import com.project.petpal.community.model.vo.Hashtag;
import com.project.petpal.member.model.service.MemberService;
import com.project.petpal.member.model.vo.KakaoLoginApi;
import com.project.petpal.member.model.vo.Member;
import com.project.petpal.member.model.vo.NaverLoginBO;

@Controller
@SessionAttributes("loginMember")
public class MemberAjaxController {
	@Autowired
	private MemberService service;
	@Autowired
	private BCryptPasswordEncoder pwEncoder;

    private NaverLoginBO naverLoginBO;
    private KakaoLoginApi kakaoLoginApi;
   
	@Autowired
	private void setNaverLoginBO(NaverLoginBO naverLoginBO) {
		this.naverLoginBO = naverLoginBO;
	}
	@Autowired
	private AdminService aService;

	
	@RequestMapping("/member/passwordUpdate.do")
	@ResponseBody
	public int passwordUpdate(String password,HttpSession session) throws Exception {

		Member m = (Member)session.getAttribute("loginMember");
		Member memberOne = service.selectMemberOne(m.getMemberNo());
		int flag = 0;
		if(pwEncoder.matches(password, memberOne.getPassword())) {
			flag=1;
		} 	 
		return flag;
	}
	
	//로그인모달Ajax
	@RequestMapping("/login/loginModal.do")
	@ResponseBody
	public Boolean loginModal(String email,String password,Model m) {
		//로그인 하기
		Member login = service.selectMember(email);
		if (login != null && pwEncoder.matches(password, login.getPassword())) {	
			m.addAttribute("loginMember", login);
			return true;
		} else {
			// 로그인실패
			return false;
		}
	};
	
	//로그인 모달 호출
	@RequestMapping("/login/moveLogin.do")
	public String moveLogin(HttpSession session,Model m) {
		String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);
		m.addAttribute("naverUrl", naverAuthUrl);
		String kakaoUrl = kakaoLoginApi.getAuthorizationUrl(session);
		m.addAttribute("kakaoUrl",kakaoUrl);
		return "common/commonAjax/loginModal";
	}
	
	//유저인포-모든 글 조회(메인)
	@RequestMapping("/user/moveAll.do")
	public String moveAll(String memberNo,Model m) {	 
      //일상 메인 사진
      List<DailyImg> dailyList=service.selectDailyMain(memberNo);
      //노하우 작성 글+메인 사진
      List<Map> tipList=service.selectTipMain(memberNo,1,6);
      //장소후기 작성 글+메인사진
      List<Map> placeList=service.selectPlaceMain(memberNo,1,6);
      //찾아주세요 작성 글+메인 사진
      List<Map> findList=service.selectFindMain(memberNo,1,6);
      
      m.addAttribute("dailyList",dailyList);
      m.addAttribute("tipList",tipList);
      m.addAttribute("placeList",placeList);
      m.addAttribute("findList",findList);
	  return "member/memberAjax/userInfoAjax";
	}
	
	
	//유저인포-일상 글 조회
	@RequestMapping("/user/moveDaily.do")
	public String moveDaily(String memberNo,Model m,
			@RequestParam(value="cPage",defaultValue="1") int cPage,
			@RequestParam(value="numPerPage",defaultValue="12") int numPerPage) {
		List<Daily> dailyList=service.selectDailyList(memberNo,cPage,numPerPage);
		List<DailyImg> imgList=service.selectDailyMain(memberNo);
		List<Hashtag> hashList=service.selectDailyHash(memberNo);
		int totalData=service.dailyCount(memberNo);
		String pageBar=new AjaxPageBarFactory().getPageBar(totalData, cPage, numPerPage, "moveDaily.do", null, ".postCon", memberNo,"dailyPaging",null, null,null);
		
		m.addAttribute("dailyList",dailyList);
		m.addAttribute("imgList",imgList);
		m.addAttribute("hashList",hashList);		
		m.addAttribute("pageBar",pageBar);
		return "member/memberAjax/userDaily";
	}
	
	//유저인포-노하우 글 조회
	@RequestMapping("/user/moveTip.do")
	public String moveTip(String memberNo,Model m,
			@RequestParam(value="cPage",defaultValue="1") int cPage,
			@RequestParam(value="numPerPage",defaultValue="12") int numPerPage) {
		//노하우 작성 글+메인 사진
	    List<Map> tipList=service.selectTipMain(memberNo,cPage,numPerPage);
	    int totalData=service.tipCount(memberNo);
	    String pageBar=new AjaxPageBarFactory().getPageBar(totalData, cPage, numPerPage, "moveTip.do", null, ".postCon", memberNo,"tipPaging",null, null,null);
	    
	    m.addAttribute("tipList",tipList);
	    m.addAttribute("pageBar",pageBar);
		return "member/memberAjax/userTip";
	}
	
	//유저인포-장소후기 글 조회
	@RequestMapping("/user/movePlace.do")
	public String movePlace(String memberNo,Model m,
			@RequestParam(value="cPage",defaultValue="1") int cPage,
			@RequestParam(value="numPerPage",defaultValue="8") int numPerPage) {
		//장소후기 작성 글+메인사진
	    List<Map> placeList=service.selectPlaceMain(memberNo,cPage,numPerPage);
	    int totalData=service.placeCount(memberNo);
	    String pageBar=new AjaxPageBarFactory().getPageBar(totalData, cPage, numPerPage, "movePlace.do", null, ".postCon", memberNo,"placePaging",null, null,null);
	    
	    m.addAttribute("placeList",placeList);
	    m.addAttribute("pageBar",pageBar);
		return "member/memberAjax/userPlace";
	}
	
	//유저인포-찾아주세요 글 조회
	@RequestMapping("/user/moveFind.do")
	public String moveFind(String memberNo,Model m,
			@RequestParam(value="cPage",defaultValue="1") int cPage,
			@RequestParam(value="numPerPage",defaultValue="12") int numPerPage) {
		//찾아주세요 작성 글+메인 사진
	    List<Map> findList=service.selectFindMain(memberNo,cPage,numPerPage);
	    int totalData=service.findCount(memberNo);	
	    String pageBar=new AjaxPageBarFactory().getPageBar(totalData, cPage, numPerPage, "moveFind.do", null, ".postCon", memberNo,"findPaging",null, null,null);
	    
	    m.addAttribute("findList",findList);
	    m.addAttribute("pageBar",pageBar);
		return "member/memberAjax/userFind";
	}
	
	//회원마이페이지(주문조회) - 상품 디테일보기
	@RequestMapping("/member/shopDetailAjax.do")
	public String shopDetail(String detailNo, Model model) {
		Map shop = service.selectShopDetail(detailNo);
		model.addAttribute("shop", shop);
		return "member/memberAjax/shopDetail";
	}
	
	//회원마이페이지(주문조회 - 교환하기) 
	@RequestMapping("/member/moveProductChangePage.do")
	public String moveProductChangePage(String detailNo, Model model) {

		model.addAttribute("detailNo", detailNo);
		return "member/memberAjax/changeProduct";
	}
	
	//회원마이페이지(주문조회-교환/반품 정보 상세보기)
	@RequestMapping("/member/infoDetail.do")
	public String infoDetail(Model model, String detailNo) {
		Map detail = service.selectPayDetail(detailNo);
		model.addAttribute("detail",detail);
		return "member/memberAjax/infoDetail";
	}
	//닉네임 중복확인
	 @RequestMapping("/member/checkNickName.do")
	 @ResponseBody
	   public boolean checkNickName(String nickName,Model m) {
		   	Member member=service.checkNickName(nickName);
		   return(member==null?true:false);
	   }
	 @RequestMapping("/sendEmail.do")//이메일 인증
	 public void sendEmail(HttpServletRequest request,HttpServletResponse response) throws Exception{
		 String email = request.getParameter("email");
	      
	      JSONObject emailConfirm= new JSONObject();
	      
	      int result=0;
	      String mesg="";
	      String loc="";

	         String host="smtp.gmail.com";
	         String user="cjfdn4646@gmail.com";
	         String password="Qkrcjfdn123";
	         
	         //smtp 서버 설정
	         Properties props = new Properties();
	           props.put("mail.smtp.host",host);
	           props.put("mail.smtp.port",587);
	           props.put("mail.smtp.auth","true");
	           props.put("mail.smtp.starttls.enable","true");
	           props.put("mail.smtp.ssl.trust",host); 
	           
	           Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
	               protected PasswordAuthentication getPasswordAuthentication() {
	                   return new PasswordAuthentication(user,password);
	               }
	           });
	           
	           try {
	               MimeMessage msg = new MimeMessage(session);
	               msg.setFrom(new InternetAddress(user, "PETPAL"));
	               msg.addRecipient(Message.RecipientType.TO, new InternetAddress(email));
	               
	               //메일 제목
	               msg.setSubject("PETPAL 인증 메일입니다.");
	               //메일 내용
	               String content="<h1>[이메일 인증]</h1><br><p>아래 링크를 클릭하시면 이메일 인증이 완료됩니다.</p>";
	               content+="<a href='http://localhost:9090/petpal/authEmail?auth=1'>이메일 인증 확인</a>";
	               msg.setText(content,"utf-8","html");
	               
	               Transport.send(msg);
	               
	           }catch (Exception e) {
	               e.printStackTrace();
	           }
	           
	           System.out.println("인증번호 발송");
	         result=1;
	         
	        
	      emailConfirm.put("msg",mesg);
	      emailConfirm.put("result",result);
	      response.getWriter().print(emailConfirm);
//	      response.setContentType("application/json;charset=utf-8");
//	      new Gson().toJson(emailConfirm,response.getWriter());
		 
	 }
	 @RequestMapping("/authEmail")
	 @ResponseBody
	 public int authEmail(String auth) {
		 int result=0;
		 if(auth!=null) {
			 result=1;
		 }
		 return result;
	 }
	 
	 @RequestMapping("/member/likeList.do")
	 public String likeList(String memberNo, Model model) {
		 System.out.println(memberNo);
		 List<Map> dList = service.selectDailyLikeList(memberNo);
		 List<Map> fList = service.selectFindLikeList(memberNo);
		 List<Map> pList = service.selectPlaceLikeList(memberNo);
		 List<Map> tList = service.selectTipLikeList(memberNo);
		 List<Map> allList = new ArrayList();
		 allList.addAll(dList);
		 allList.addAll(fList);
		 allList.addAll(pList);
		 allList.addAll(tList);
		 for(Map m : allList) {
			 System.out.println(m);
		 }
		 model.addAttribute("allList", allList);
		 return "member/memberAjax/likeList";
	 }
}
