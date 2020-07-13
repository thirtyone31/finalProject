package org.kh.fin.member.controller;

import org.kh.fin.member.domain.Member;
import org.kh.fin.member.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

@SessionAttributes({"loginInfo"})
@Controller
public class MemberController {
	
	@Autowired
	private MemberService mService;
	
	//네이버 로그인하기
	@RequestMapping(value="callback.me")
	public String loginSuccess() {
		return "callback";
	}
	
	//로그인 창 띄우기
	@RequestMapping(value="loginMain.me")
	public String MemberNaverLogin() {
		return "loginMain";
	}
	
	@RequestMapping(value="resister.me")
	public String MemberResister() {
		return "resisterMember";
	}
	
	
	//로그인 !
	@RequestMapping(value="login.me", method=RequestMethod.POST)
	public ModelAndView MemberLogin(Member mem, ModelAndView mv) {
		Member loginInfo = mService.loginMember(mem);
		
		if(loginInfo != null) {
			mv.addObject("loginInfo", loginInfo);
			mv.setViewName("callback");
		} else {
			mv.addObject("실패");
			mv.setViewName("http://www.naver.com");
		}
				
		return mv;
	}
	//로그아웃
	@RequestMapping("logout.me")
	public String MemberLogout(SessionStatus status) {
		status.setComplete();
		return "redirect:index.jsp";
	}
}
