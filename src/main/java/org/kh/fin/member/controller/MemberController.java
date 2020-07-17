package org.kh.fin.member.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import org.kh.fin.member.domain.Member;
import org.kh.fin.member.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

@SessionAttributes({ "loginInfo" })
@Controller
public class MemberController {

	@Autowired
	private MemberService mService;

	@RequestMapping(value = "callback.me")
	public String loginSuccess() {
		return "callback";
	}

	// 로그인 창 띄우기
	@RequestMapping(value = "loginMain.me")
	public String MemberNaverLogin() {
		return "loginMain";
	}

	// 약관 동의 페이지
	@RequestMapping(value = "agree.me")
	public String agreeFormView() {
		return "agreeForm";
	}

	// 회원가입 페이지
	@RequestMapping(value = "resister.me")
	public String ResisterView() {
		return "resisterMember";
	}

	// 내 정보 수정 페이지
	@RequestMapping(value = "myPage.me")
	public String myPageView() {
		return "modifyMyMain";
	}
	// 내 정보 수정 페이지
	@RequestMapping(value = "findIdPwd.me")
	public String findIdPwd() {
		return "find/findMain";
	}

	// 회원가입하기
	@RequestMapping(value = "newRegister.me", method = RequestMethod.POST)
	public String memberInsert(Member mem) {
		System.out.println(mem.toString());
		int result = mService.insertMember(mem);
		if (result > 0) {
			return "redirect:index.jsp";
		} else {
			return "망";
		}
	}
	
	/**
	 * checkId.me parameter request return JsonObject
	 */
	@ResponseBody
	@RequestMapping(value = "checkId.me", method = RequestMethod.POST)
	public String checkId(HttpServletRequest request) {
		String result;
		String userId = request.getParameter("id");
		System.out.println("id : " + userId);

		result = this.mService.checkIdDup(userId);
		System.out.println(result.toString());
		return result;
	}
	
	/**
	 * findId.me
	 */
	@ResponseBody
	@RequestMapping(value = "findId.me", method = RequestMethod.POST)
	public String findId(HttpServletRequest request) {
		String result;
		String key = request.getParameter("key");
		String findType = request.getParameter("findType");
		
		Map<String, String> params = new HashMap<String, String>();
		params.put("key", key);
		params.put("findType", findType);
		
		result = this.mService.findId(params);
		System.out.println(result.toString());
		return result;
	}

	@ResponseBody
	@RequestMapping(value = "chekNickName.me", method = RequestMethod.POST)
	public String checkNickName(HttpServletRequest request) {
		String result;
		String nick = request.getParameter("nick");
		System.out.println("nick : " + nick);

		result = this.mService.checkNickDup(nick);
		System.out.println(result.toString());
		return result;
	}

	// 로그인 !
	@RequestMapping(value = "login.me", method = RequestMethod.POST)
	public ModelAndView MemberLogin(Member mem, ModelAndView mv) {
		Member loginInfo = mService.loginMember(mem);

		if (loginInfo != null) {
			mv.addObject("loginInfo", loginInfo);
			mv.setViewName("loginSuccess");
		} else {
			mv.addObject("실패");
			mv.setViewName("http://www.naver.com");
		}

		return mv;
	}

	// 로그아웃
	@RequestMapping("logout.me")
	public String MemberLogout(SessionStatus status) {
		status.setComplete();
		return "redirect:index.jsp";
	}
}
