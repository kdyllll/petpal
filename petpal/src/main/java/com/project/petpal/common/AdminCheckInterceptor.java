package com.project.petpal.common;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.project.petpal.member.model.vo.Member;


public class AdminCheckInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session=(HttpSession)request.getSession();
		Member login=(Member)session.getAttribute("loginMember");
		
		if(login==null||!login.getMemberNo().equals("63")) {
			//로그인이 안된 상태
			request.setAttribute("msg", "관리자만 이용 가능합니다.");
			request.setAttribute("loc", "/");
			request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp").forward(request, response);
			return false;			
		}else {	
			return super.preHandle(request, response, handler);
		}
	}
}
