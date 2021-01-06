package com.project.petpal.member.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;

import com.project.petpal.community.model.service.DailyService;
import com.project.petpal.community.model.service.FindService;
import com.project.petpal.community.model.service.PlaceService;
import com.project.petpal.community.model.service.TipService;
import com.project.petpal.member.model.service.MemberService;
import com.project.petpal.member.model.vo.GoogleEnrollApi;
import com.project.petpal.member.model.vo.GoogleLoginApi;
import com.project.petpal.member.model.vo.KakaoEnrollApi;
import com.project.petpal.member.model.vo.KakaoLoginApi;
import com.project.petpal.member.model.vo.Member;
import com.project.petpal.member.model.vo.NaverEnrollBo;
import com.project.petpal.member.model.vo.NaverLoginBO;
import com.project.petpal.store.model.service.StoreService;
import com.project.petpal.store.model.vo.Product;

@Controller
@SessionAttributes("loginMember")
public class MemberController {

   @Autowired
   private MemberService service;
   @Autowired
   private BCryptPasswordEncoder pwEncoder;
   @Autowired
   private FindService fService;
   @Autowired
   private TipService tService;
   @Autowired
   private PlaceService pService;
   @Autowired
   private DailyService dService;
   @Autowired
   private StoreService storeService;

   private NaverLoginBO naverLoginBO;

   private NaverEnrollBo naverEnrollBO;
   private KakaoLoginApi kakaoLoginApi;
   private KakaoEnrollApi kakaoEnrollApi;
   private GoogleEnrollApi googleEnrollApi;
   private GoogleLoginApi googleLoginApi;
   
	@Autowired
	private void setNaverLoginBO(NaverLoginBO naverLoginBO,NaverEnrollBo naverEnrollBO) {
		this.naverLoginBO = naverLoginBO;
		this.naverEnrollBO = naverEnrollBO;
	}

   @RequestMapping("/member/moveMyPage.do")
   public String moveMyPage(HttpSession session, Model m) {
	 
      Member memNo = (Member)session.getAttribute("loginMember");
      String memberNo = memNo.getMemberNo();
      Map member = service.selectMemberOnee(memberNo);
      int followCnt = service.followCnt(memberNo);
      int favCnt = service.favCnt(memberNo);
      List<Map> findList = fService.selectFindListOne(memberNo);
      int findCnt = fService.findCnt(memberNo);
      List<Map> dList = dService.selectDailyListOne(memberNo);
      int dailyCnt = dService.dailyCnt(memberNo);
      List<Map> tList = tService.selectTipListOne(memberNo);
      int tipCnt = tService.tipCnt(memberNo);
      List<Map> pList = pService.selectPlaceListOne(memberNo);
      int placeCnt = pService.placeCnt(memberNo);
      m.addAttribute("follow",followCnt);
      m.addAttribute("fav",favCnt);   
      m.addAttribute("member", member);
      m.addAttribute("findCnt" ,findCnt);
      m.addAttribute("fList", findList);
      m.addAttribute("dList", dList);
      m.addAttribute("dailyCnt", dailyCnt);
      m.addAttribute("tList",tList);
      m.addAttribute("tipCnt",tipCnt);
      m.addAttribute("pList",pList);
      m.addAttribute("placeCnt",placeCnt);
      return "member/myPageProfile";
   }

   @RequestMapping("/member/myPageShop.do")
   public String myPageShop(Model m,HttpSession session, HttpServletRequest request) {
	  String status = request.getParameter("orderStatus"); 
	  String payStatus = request.getParameter("payStatus");
	  String deliveryStatus = request.getParameter("deliveryStatus");
	  Member mem = (Member)session.getAttribute("loginMember");
	  Member member = service.selectMemberOne(mem.getMemberNo());
	  Map list = new HashMap();
	  list.put("memberNo", mem.getMemberNo());
	  list.put("status", status);
	  list.put("payStatus",payStatus);
	  list.put("deliveryStatus",deliveryStatus);
	  List<Map> shop = service.selectPaymentList(list);
//	  취소,교환중,교환,반품중,결제 갯수 구하기
	  Map map = new HashMap();
	  String n = "";
	  n="반품중";
	  map.put("memberNo", mem.getMemberNo());
	  map.put("n",n);
	  int refundIngCnt = service.selectCnt(map);
	  n="취소";
	  map.put("n",n);
	  int refundCnt = service.selectCnt(map);
	  n="교환중";
	  map.put("n",n);
	  int changeIngCnt = service.selectCnt(map);
	  n="교환";
	  map.put("n",n);
	  int changeCnt = service.selectCnt(map);
	  n="결제";
	  map.put("n",n);
	  int payCnt = service.selectCnt(map);
//	  결제완료, 배송준비중, 배송중, 배송완료 ... 갯수 구하기
	  Map p = new HashMap();
	  p.put("memberNo", mem.getMemberNo());
	  p.put("deliveryStatus", "배송준비중");
	  int payDelCnt = service.selectDeliveryCnt(p);
	  p.put("deliveryStatus", "배송시작");
	  int deliveryStartCnt = service.selectDeliveryCnt(p);
	  p.put("deliveryStatus", "배송완료");
	  int deliveryEndCnt = service.selectDeliveryCnt(p);
	  p.put("deliveryStatus", "구매확정");
	  int pay = service.selectDeliveryCnt(p);
	  System.out.println(payDelCnt+"."+deliveryEndCnt+"."+deliveryStartCnt+"."+pay);
	  
	  List<Map> point = service.selectPointList(mem.getMemberNo());
	  m.addAttribute("riCnt",refundIngCnt);
	  m.addAttribute("rCnt",refundCnt);
	  m.addAttribute("ciCnt",changeIngCnt);
	  m.addAttribute("cCnt",changeCnt);
	  m.addAttribute("payCnt",payCnt);
	  m.addAttribute("member",member);
	  m.addAttribute("shop", shop);
	  m.addAttribute("payDelCnt",payDelCnt);
	  m.addAttribute("deCnt",deliveryEndCnt);
	  m.addAttribute("dsCnt",deliveryStartCnt);
	  m.addAttribute("pay",pay);
	  m.addAttribute("point", point);
      return "member/myPageShop";
   }

   @RequestMapping("/member/myPageModify.do")
   public String myPageModify(HttpSession session, Model model) {
      Member m = (Member)session.getAttribute("loginMember");
      Member member = service.selectMember(m.getEmail());
      model.addAttribute("member", member);
      return "member/myPageModify";
   }

   @RequestMapping("/member/moveJoin.do")//회원가입페이지로 가는 서블릿
   public String moveJoin(Model m,HttpSession session) {
	  String naverAuthUrl = naverEnrollBO.getAuthorizationUrl(session);
	  m.addAttribute("naverUrl", naverAuthUrl);
	  String kakaoUrl = kakaoEnrollApi.getAuthorizationUrl(session);
	  m.addAttribute("kakaoUrl",kakaoUrl);
	  String googleUrl=googleEnrollApi.getAuthorizationUrl(session);
	  m.addAttribute("googleUrl",googleUrl);
      return "member/join";
   }

   @RequestMapping("/member/myPageFav.do")
   public String myPageFav(String memberNo,Model m) {
	  List<Product> list=storeService.favList(memberNo);
	  m.addAttribute("list",list);
      return "member/myPageFav";
   }

   @RequestMapping("/member/insertMember.do")//회원가입창에서 가입버튼눌렀을때 회원가입 요청하는 서블릿

   public String insertMember(Model m,Member member,@RequestParam(value="f", required=false)MultipartFile f, HttpSession session) {
	   String snsNo=member.getSnsNo();
	  if(snsNo==null) {//그냥회원가입이면
		  String oriPw=member.getPassword();
	      member.setPassword(pwEncoder.encode(oriPw));
	  }
      
      String path=session.getServletContext().getRealPath("/resources/upload/member/profile");
      
      File dir=new File(path);
      if(!dir.exists()) dir.mkdirs();//폴더가 없다면 폴더를 생성
      if(!f.isEmpty()) {
           //파일명생성하기
           String originalName=f.getOriginalFilename();
           String ext=originalName.substring(originalName.lastIndexOf(".")+1);//확장자 가져오기
           //리네임규칙
           SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMdd_HHmmssSSS");
           int rndValue=(int)(Math.random()*10000);
           String reName=sdf.format(System.currentTimeMillis())+"_"+rndValue+"."+ext;
           try {
              System.out.println(path+"/"+reName);
              f.transferTo(new File(path+"/"+reName));
           }catch(IOException e) {
              e.printStackTrace();
              m.addAttribute("msg","오류가 발생하였습니다.다시 시도해주세요.");
           }
           member.setImg(reName);

      }
      int result=service.insertMember(member);
      if(result>0) {
         m.addAttribute("msg","가입에 성공하였습니다!");
         if(snsNo!=null) {
        	 Member loginMember=service.selectSnsMember(snsNo);
        	 m.addAttribute("loginMember",loginMember);
         }
      }else {
         m.addAttribute("msg","가입에 실패하였습니다!");
         m.addAttribute("loc","/member/moveJoin.do");
         }

      return "common/msg";
   }

   @RequestMapping("/member/moveLogin.do")
   public String moveLogin(@CookieValue(value="saveId", required = false) Cookie saveId,
		   Model m, HttpSession session) {
	   if(saveId!=null) {
		   System.out.println(saveId.getValue());
		   m.addAttribute("saveId",saveId.getValue());
	   }	   
	   String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);
	   m.addAttribute("naverUrl", naverAuthUrl);
	   String kakaoUrl = kakaoLoginApi.getAuthorizationUrl(session);
	   m.addAttribute("kakaoUrl",kakaoUrl);
      return "member/login";
   }

   @RequestMapping("/member/memberLogin.do")
   public String memberLogin(String email, String password,  Model m, HttpServletResponse response,
		   @RequestParam(value = "saveId", required = false) String saveId) {
      Member login = service.selectMember(email);
      if (login != null && pwEncoder.matches(password, login.getPassword())) {
//      if(login!=null) {
         m.addAttribute("loginMember", login);
         
         //아이디 기억하기
	      if(saveId!=null) {
	    	Cookie c=new Cookie("saveId",email);
	  		c.setMaxAge(60 * 60 * 24 * 30 ); //쿠키 한달 유지
	  		c.setPath("/");
	  		response.addCookie(c); //쿠키 추가
	      }else {
	    	Cookie c=new Cookie("saveId",null);
	  		c.setMaxAge(0); //쿠키 삭제
	  		c.setPath("/");
	  		response.addCookie(c); //쿠키 추가
	      }
         return "redirect:/";
      } else {
         // 로그인실패
         m.addAttribute("msg", "로그인에 실패했습니다.");
         m.addAttribute("loc", "/member/moveLogin.do");
         return "common/msg";
      }
      
      
   }

   @RequestMapping("/member/passwordUpdateEnd.do")
   public String passwordUpdateEnd(Member m, Model model) {
      String loc = "/member/myPageModify.do";
      String msg = "비밀번호 변경에 실패하였습니다.";
      Member member = Member.builder().memberNo(m.getMemberNo()).password(pwEncoder.encode(m.getPassword())).build();
      int result = service.updatePassword(member);
      if (result > 0) {
         msg = "비밀번호가 변경되었습니다.";
      }
      model.addAttribute("msg", msg);
      model.addAttribute("loc", loc);
      return "common/msg";
   }

   @RequestMapping("/member/updateMemberEnd.do")
   public String updateMemberEnd(Member member, HttpSession session, Model model,
         @RequestParam(value = "fileImg", required = false) MultipartFile fileImg) {
      
      String path = session.getServletContext().getRealPath("/resources/upload/member/profile");
      Member file = (Member)session.getAttribute("loginMember");
      File dir = new File(path);
      if (!dir.exists())
         dir.mkdirs();
      String reName = "";
         if (!fileImg.isEmpty()) {
            // 파일명 생성
            String originalName = fileImg.getOriginalFilename();
            String ext = originalName.substring(originalName.lastIndexOf(".") + 1);

            // 리네임 규칙
            SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd_HHmmssSSS");
            int rndValue = (int) (Math.random() * 10000);
            reName = sdf.format(System.currentTimeMillis()) + "_" + rndValue + "." + ext;
            try {
               fileImg.transferTo(new File(path + "/" + reName));
            } catch (IOException e) {
               e.printStackTrace();
            }
         }
      Member m = null;
      if(!fileImg.getOriginalFilename().equals("")) {
         m = Member.builder().nickName(member.getNickName()).address(member.getAddress())
               .memberName(member.getMemberName()).phone(member.getPhone()).memberNo(member.getMemberNo()).img(reName).info(member.getInfo())
               .build();
      } else {
         m = Member.builder().nickName(member.getNickName()).address(member.getAddress())
               .memberName(member.getMemberName()).phone(member.getPhone()).memberNo(member.getMemberNo()).img(file.getImg()).info(member.getInfo())
               .build();
      }
      
      int result = service.updateMemberEnd(m);
      String loc="/member/myPageModify.do";
      String msg="회원정보수정에 실패하였습니다. 다시시도해주세요.";
      if(result>0) {
         msg="회원정보 수정이 완료되었습니다.";
      }
      
      model.addAttribute("loc", loc);
      model.addAttribute("msg", msg);
      return "common/msg";
   }
   
   @RequestMapping("/member/logout.do")
   public String logout(HttpSession session,SessionStatus ss) {
      if(!ss.isComplete()) {
         ss.setComplete();
      }
      return "redirect:/";
   }
   
   @RequestMapping("/user/moveUserInfo.do")
   public String moveUserInfo(String memberNo,Model m) {
      //닉네임, 팔로잉팔로워 수, 설명
      Member member=service.selectMemberOne(memberNo);      
      //팔로잉
      int following=service.countFollowing(memberNo);
      //팔로워
      int follower=service.countFollower(memberNo);
      
      m.addAttribute("member",member);
      m.addAttribute("following",following);
      m.addAttribute("follower",follower);
      return "member/userInfo";
   }
   
   @RequestMapping("/member/refundApply.do")
   public String refundApply(String detailNum,String refundReason, String refundTextArea, Model model) {
	   Map m = new HashMap();
	   String reason = "";
	   if(refundReason.equals("bad")) {
		   reason = "불량";
	   }else if(refundReason.equals("delivery")) {
		   reason="배송지연";
	   }else if(refundReason.equals("simple")) {
		   reason="단순변심";
	   } else if(refundReason.equals("other")) {
		   reason = refundTextArea;
	   }
	   
	   m.put("detailNo", detailNum);
	   m.put("reason", reason);
		int result = service.productRefund(m);
	   String loc = "/member/myPageShop.do";
	   String msg = "반품신청에 실패하였습니다.";
	
		if(result>0) { msg= "반품접수 되었습니다."; }
		
	   model.addAttribute("loc", loc);
	   model.addAttribute("msg", msg);
	   return "common/msg";
   }
   
   @RequestMapping("/member/changeApply.do")
   public String changeApply(String detailNum,String changeReason, String changeTextArea, Model model) {
	   Map m = new HashMap();
	   String reason = "";
	   if(changeReason.equals("bad")) {
		   reason = "불량/"+changeTextArea;
	   }else if(changeReason.equals("delivery")) {
		   reason="배송지연/"+changeTextArea;
	   }else if(changeReason.equals("color")) {
		   reason="색상변경/"+changeTextArea;
	   } else if(changeReason.equals("other")) {
		   reason = changeTextArea;
	   }
	   
	   m.put("detailNo", detailNum);
	   m.put("reason", reason);
	   int result = service.productChange(m);
	   String loc = "/member/myPageShop.do";
	   String msg = "교환신청에 실패하였습니다.";
	
	   if(result>0) { msg= "교환접수 되었습니다."; } 
		
	   model.addAttribute("loc", loc);
	   model.addAttribute("msg", msg);
	   return "common/msg";
   }

   @RequestMapping("/nonMemberShop.do")
   public String moveNonMemberShop(Model m,HttpSession session, HttpServletRequest request,String orderNo) {
		  String status = request.getParameter("orderStatus"); 
		  String payStatus = request.getParameter("payStatus");
		  String deliveryStatus = request.getParameter("deliveryStatus");

		  Map list = new HashMap();
		  list.put("orderNo",orderNo);
		  list.put("status", status);
		  list.put("payStatus",payStatus);
		  list.put("deliveryStatus",deliveryStatus);
		  List<Map> shop = service.selectPaymentListNon(list);
//		  취소,교환중,교환,반품중,결제 갯수 구하기
		  Map map = new HashMap();
		  map.put("orderNo",orderNo);
		  String n = "";
		  n="반품중";
		  map.put("n",n);
		  int refundIngCnt = service.selectCntNon(map);
		  n="취소";
		  map.put("n",n);
		  int refundCnt = service.selectCntNon(map);
		  n="교환중";
		  map.put("n",n);
		  int changeIngCnt = service.selectCntNon(map);
		  n="교환";
		  map.put("n",n);
		  int changeCnt = service.selectCntNon(map);
		  n="결제";
		  map.put("n",n);
		  int payCnt = service.selectCntNon(map);
//		  결제완료, 배송준비중, 배송중, 배송완료 ... 갯수 구하기
		  Map p = new HashMap();
		  p.put("orderNo",orderNo);
		  p.put("deliveryStatus", "배송준비중");
		  int payDelCnt = service.selectDeliveryCntNon(p);
		  p.put("deliveryStatus", "배송시작");
		  int deliveryStartCnt = service.selectDeliveryCntNon(p);
		  p.put("deliveryStatus", "배송완료");
		  int deliveryEndCnt = service.selectDeliveryCntNon(p);
		  p.put("deliveryStatus", "구매확정");
		  int pay = service.selectDeliveryCntNon(p);
		  System.out.println(payDelCnt+"."+deliveryEndCnt+"."+deliveryStartCnt+"."+pay);
		  
		  m.addAttribute("riCnt",refundIngCnt);
		  m.addAttribute("rCnt",refundCnt);
		  m.addAttribute("ciCnt",changeIngCnt);
		  m.addAttribute("cCnt",changeCnt);
		  m.addAttribute("payCnt",payCnt);
		  m.addAttribute("shop", shop);
		  m.addAttribute("payDelCnt",payDelCnt);
		  m.addAttribute("deCnt",deliveryEndCnt);
		  m.addAttribute("dsCnt",deliveryStartCnt);
		  m.addAttribute("pay",pay);
	   return "member/nonMemberShop";
   }
   
   @RequestMapping("/orderCheck.do")
   @ResponseBody
   public Boolean orderCheck(String orderNo) {
	   int result=service.selectOrderCheck(orderNo);
	   return result>0?true:false;
   }
   
   //팔로우
   @RequestMapping("/member/memberFollow.do")
   public String follow(HttpSession session, Model m) {
		 
	      Member memNo = (Member)session.getAttribute("loginMember");
	      String memberNo = memNo.getMemberNo();
	      Map member = service.selectMemberOnee(memberNo);
	      int followCnt = service.followCnt(memberNo);
	      int favCnt = service.favCnt(memberNo);
	      m.addAttribute("follow",followCnt);
	      m.addAttribute("fav",favCnt);   
	      m.addAttribute("member", member);
	      
	   return "member/memberFollow";
   }

}
