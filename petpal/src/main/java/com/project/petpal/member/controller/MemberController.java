package com.project.petpal.member.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;

import com.project.petpal.community.model.service.DailyService;
import com.project.petpal.community.model.service.FindService;
import com.project.petpal.community.model.service.PlaceService;
import com.project.petpal.community.model.service.TipService;
import com.project.petpal.member.model.service.MemberService;
import com.project.petpal.member.model.vo.Member;
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
   
	@Autowired
	private void setNaverLoginBO(NaverLoginBO naverLoginBO) {
		this.naverLoginBO = naverLoginBO;
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
   public String myPageShop(Model m,HttpSession session) {
	  Member mem = (Member)session.getAttribute("loginMember");
	  Member member = service.selectMemberOne(mem.getMemberNo());
	  m.addAttribute("member",member);
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
   public String moveJoin() {
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
      
      String oriPw=member.getPassword();

      member.setPassword(pwEncoder.encode(oriPw));

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

}
