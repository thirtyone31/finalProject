package org.kh.fin.member.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletResponse;

import org.kh.fin.member.domain.MPageInfo;
import org.kh.fin.member.domain.MPagination;
import org.kh.fin.member.domain.Member;
import org.kh.fin.member.domain.Msearch;
import org.kh.fin.member.service.MemberServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@SessionAttributes({"loginUser"})
@Controller
public class MemberController {
	
	@Autowired
	private MemberServiceImpl mService;

	@RequestMapping(value="login.do", method=RequestMethod.POST)
	public ModelAndView memberLogin(Member mem,
							ModelAndView mv) {
		Member loginUser = mService.loginMember(mem);
		if(loginUser != null) {
			mv.addObject("loginUser", loginUser);
			//model.addAttribute("loginUser", loginUser);
			mv.setViewName("home");
			//return "home";
		}else {
			mv.addObject("msg", "로그인 실패!");
			mv.setViewName("common/errorPage");
		}
		return mv;
	}
	
	@RequestMapping("logout.do")
	public String memberLogout(SessionStatus status) {
		// @SessionAttributes 를 사용하였을 때
		// Session을 만료시키기 위해서는 
		// status.setComplete()를 호출해야 함.
		status.setComplete();
		return "redirect:home.do";
	}
	
	@RequestMapping("enrollView.do")
	public String enrollView() {
		return "member/memberJoin";
	}
	
	@RequestMapping(value="minsert.do", method=RequestMethod.POST)
	public String memberInsert(Member mem, Model model,
						String post, String address1,
						String address2) {
		mem.setAddress(post+","+address1+","+address2);
		int result = mService.insertMember(mem);
		if ( result > 0 ) {
			return "redirect:home.do";
		}else {
			model.addAttribute("msg", "회원 가입 실패");
			//addAttribute사용 가능한 이유는 위에 @SessionAttributes({"loginUser"})
			//로 정의 했기 때문에 가능함
			return "common/errorPage";
		}
	}
	
	@ResponseBody
	@RequestMapping("dupid.do")
	public String idDuplicateCheck(String userId) {
		boolean isUsable
			= mService
				.checkIdDup(userId) == 0 ? true : false;
		return isUsable+""; // /WEB-INF/views/true.jsp
	}
	//마이페이지로 이동
	@RequestMapping("mypageView.do")
	public String myPageView() {
		return "member/memberMyPage";
	}
	
	//마이페이지로 이동
	@RequestMapping("myinfoView.do")
	public String myInfoView() {
		return "member/memberMyInfo";
	}
	
	//회원정보 수정
	@RequestMapping(value="mupdate.do", method=RequestMethod.POST)
	public String memberUpdate(Member mem, Model model, 
							/*String post,
							String address1,
							String address2,*/
							RedirectAttributes rd) {
		//mem.setAddress(post+","+address1+","+address2);
		int result = mService.updateMember(mem);
		if ( result > 0 ) {
			model.addAttribute("loginUser", mem);
			rd.addFlashAttribute("msg", "정보 수정 성공");
			return "member/memberMyPage";
		}else {
			model.addAttribute("msg", "정보 수정 실패");
			return "common/errorPage";
		}
	}
	
	@RequestMapping("mdelete.do")
	public String memberDelete(String userId, 
			SessionStatus status,Model model, 
							RedirectAttributes rd) {
		int result = mService.deleteMember(userId);
		if ( result > 0 ) {
			rd.addFlashAttribute("msg", "회원 탈퇴 성공");
			status.setComplete();
			return "redirect:home.do";
		}else {
			model.addAttribute("msg", "회원 탈퇴 실패");
			return "common/errorPage";
		}
	}
	
	/*@RequestMapping("mlistView.kh")
	public String mListView() {
		return "member/memberList";
	}*/
	/*@RequestMapping("mlistView.kh")
	public String memberList(Model model) {
		List<Member> list = mService.listMember();
		model.addAttribute("list",list);
		return "member/memberList";
		
	}*/
	@RequestMapping("black.do")
	public String memberBlack(String userId,Model model,
			RedirectAttributes rd) {
		System.out.println(userId);
		int result= mService.blackMember(userId);
		System.out.println(result);
		if(result>0) {
			rd.addFlashAttribute("msg","등록성공");
			return "redirect:mlistView.do";
		}else {
			model.addAttribute("msg","등록 실패");
			return "common/errorPage";
		}
	}
	@RequestMapping("out.do")
	public String outMember(String userId,Model model,
			RedirectAttributes rd) {
		int result=mService.outMember(userId);
		if(result>0) {
			rd.addFlashAttribute("msg","등록성공");
			return "redirect:mlistView.do";
		}else {
			model.addAttribute("msg","등록실패");
			return "common/errorPage";
		}
	
	}
	@RequestMapping("msearch.do")
	public String memberSearch(Msearch search,Model model,Integer page) {
		ArrayList<Member> searchList= mService.searchList(search);
		model.addAttribute("list", searchList);
		System.out.println(searchList);
		model.addAttribute("search", search);
		System.out.println(search);
		return "member/memberList";
	}
	@RequestMapping("mlistView.do")
	public ModelAndView memberList(ModelAndView mv,@RequestParam(value="page",required=false)Integer page) {
		int currentPage = (page != null) ? page : 1;
		System.out.println(currentPage);
		int listCount = mService.getListCount();
		System.out.println(listCount);
		MPageInfo pi = MPagination.getPageInfo(currentPage, listCount);
		System.out.println(pi);
		ArrayList<Member> list =mService.selectList(pi);
		
		
		if(!list.isEmpty()) {
			mv.addObject("list",list );
			mv.addObject("pi",pi);
			mv.setViewName("member/memberList");
		}else {
			mv.addObject("msg","게시글 전체조회 실패");
			mv.setViewName("common/errorPage");
		}
		return mv;
	}
	//아이디 찾기 폼
	@RequestMapping("find_id_form.do")
	public String find_id_from() throws Exception{
		return "member/find_id_form";
	}
	//아이디 찾기 
	@RequestMapping("find_id.do")
	public String find_id(HttpServletResponse response, @RequestParam("email")String email, Model md) throws Exception{
		md.addAttribute("id",mService.find_id(response,email));
		return "member/find_id";
	}
	
}
