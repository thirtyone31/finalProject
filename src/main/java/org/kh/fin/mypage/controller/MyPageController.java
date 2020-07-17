package org.kh.fin.mypage.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.kh.fin.common.PageInfo;
import org.kh.fin.common.Pagination;
import org.kh.fin.member.domain.Member;
import org.kh.fin.mypage.domain.OrderInfo;
import org.kh.fin.mypage.domain.WriteBoard;
import org.kh.fin.mypage.service.MyPageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MyPageController {
	
	@Autowired
	private MyPageService mypageService;
	
	@RequestMapping(value="myWriteList.do")
	public ModelAndView writeList(ModelAndView mv,
			@RequestParam(value="page", required = false) Integer page, HttpSession session) {
		Member member = (Member)session.getAttribute("loginInfo");
		int currentPage = (page != null) ? page : 1;
		int listCount = mypageService.getListCount(member.getMemberId(), "write");
		int pageLimit = 5; // 한 페이지에서 보여질 페이징 수
		int boardLimit = 4; // 한 페이지에 보여질 게시글 갯수
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, pageLimit, boardLimit);
		ArrayList<WriteBoard> wList = mypageService.selectWriteList(member.getMemberId(), pi);
		if(!wList.isEmpty()) {
			mv.addObject("wList", wList);
			mv.addObject("pi", pi);
			mv.setViewName("mypage/myWriteList");
		}else {
			mv.addObject("msg", "내가 쓴 게시글 조회 실패");
			mv.setViewName("common/errorPage");
		}
		return mv;
	}
	
	@RequestMapping(value="myOrderList.do")
	public ModelAndView orderList(ModelAndView mv,
			@RequestParam(value="page", required = false) Integer page, HttpSession session) {
		Member member = (Member)session.getAttribute("loginInfo");
		int currentPage = (page != null) ? page : 1;
		int listCount = mypageService.getListCount(member.getMemberId(), "order");
		int pageLimit = 5; // 한 페이지에서 보여질 페이징 수
		int boardLimit = 6; // 한 페이지에 보여질 게시글 갯수
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, pageLimit, boardLimit);
		ArrayList<OrderInfo> oList = mypageService.selectOrderList(member.getMemberId(), pi);
		if(!oList.isEmpty()) {
			mv.addObject("oList", oList);
			mv.addObject("pi", pi);
			mv.setViewName("mypage/myOrderList");
		}else {
			mv.addObject("msg", "내가 쓴 게시글 조회 실패");
			mv.setViewName("common/errorPage");
		}
		return mv;
	}
}
