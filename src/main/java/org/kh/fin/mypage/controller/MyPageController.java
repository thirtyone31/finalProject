package org.kh.fin.mypage.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.kh.fin.common.PageInfo;
import org.kh.fin.common.Pagination;
import org.kh.fin.member.domain.Member;
import org.kh.fin.mypage.domain.Bucket;
import org.kh.fin.mypage.domain.Favorite;
import org.kh.fin.mypage.domain.OrderInfo;
import org.kh.fin.mypage.domain.WriteBoard;
import org.kh.fin.mypage.service.MyPageService;
import org.kh.fin.order.domain.Order;
import org.kh.fin.product.domain.Product;
import org.kh.fin.product.domain.ProductInCart;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import sun.net.www.content.text.plain;

@Controller
@SessionAttributes({"pList"})
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
		int boardLimit = 10; // 한 페이지에 보여질 게시글 갯수
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, pageLimit, boardLimit);
		ArrayList<WriteBoard> wList = mypageService.selectWriteList(member.getMemberId(), pi);
		mv.addObject("wList", wList);
		mv.addObject("pi", pi);
		mv.setViewName("mypage/myWriteList");
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
		mv.addObject("oList", oList);
		mv.addObject("pi", pi);
		mv.setViewName("mypage/myOrderList");
		return mv;
	}
	
	@RequestMapping(value="myFavoriteList.do")
	public ModelAndView favoriteList(ModelAndView mv,
			@RequestParam(value="page", required = false) Integer page, HttpSession session) {
		Member member = (Member)session.getAttribute("loginInfo");
		int currentPage = (page != null) ? page : 1;
		int listCount = mypageService.getListCount(member.getMemberId(), "favorite");
		int pageLimit = 5; // 한 페이지에서 보여질 페이징 수
		int boardLimit = 5; // 한 페이지에 보여질 게시글 갯수
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, pageLimit, boardLimit);
		ArrayList<Product> pList = mypageService.selectFavoriteList(member.getMemberId(), pi);
		mv.addObject("pList", pList);
		mv.addObject("pi", pi);
		mv.setViewName("mypage/myFavorite");
		return mv;
	}
	
	@RequestMapping(value="myCartList.do")
	public ModelAndView cartList(ModelAndView mv, HttpSession session) {
		ArrayList<Bucket> cart = (ArrayList<Bucket>) session.getAttribute("cart");
		ArrayList<ProductInCart> pList = new ArrayList<ProductInCart>();
		if(cart != null) {
			for (Bucket bucket : cart) {
				ProductInCart product = mypageService.selectOneProduct(bucket.getProductNum());
				product.setOrderQty(bucket.getCnt());
				pList.add(product);
			}	
		}
		
		Member mem = (Member)session.getAttribute("loginInfo");
		int dcRate = mypageService.getdcRate(mem.getMemberId());
		mv.addObject("pList", pList);
		mv.addObject("dcRate", dcRate);
		mv.setViewName("mypage/myBucket");
		return mv;
	}
	@ResponseBody
	@RequestMapping(value="deleteFavorite.do")
	public void deleteFavorite(HttpServletRequest request, HttpServletResponse response, @RequestParam(value="page", required = false) Integer page) {
		int pNum = Integer.parseInt(request.getParameter("pNum"));
		HttpSession session = request.getSession();
		String memberId = ((Member)session.getAttribute("loginInfo")).getMemberId();
		Favorite favorite = new Favorite(memberId, pNum);
		int currentPage = (page != null) ? page : 1;
		
		ArrayList<Integer> list = mypageService.deleteFavorite(favorite);
		try {
			if(list.get(0) > 0) {
				PrintWriter out;
				out = response.getWriter();
				JSONObject jResult = new JSONObject();
			      
				jResult.put("src","far fa-star");
				jResult.put("cnt", list.get(1));
			    response.setContentType("application/json"); //핵중요
			     
			    out.print(jResult);
			      
			    out.flush();// 버퍼링되어서 아직 기록되지않은 데이터를 출력스트림에 모두 출력
			    out.close();// 출력되지않은데이터가 있으면 먼저 출력하고 스트림 종료
				
			}else {
				response.sendRedirect("/myFavoriteList.do?page="+currentPage);
			}
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	@ResponseBody
	@RequestMapping(value="insertFavorite.do")
	public void insertFavorite(HttpServletRequest request, HttpServletResponse response, @RequestParam(value="page", required = false) Integer page) {
		int pNum = Integer.parseInt(request.getParameter("pNum"));
		HttpSession session = request.getSession();
		String memberId = ((Member)session.getAttribute("loginInfo")).getMemberId();
		Favorite favorite = new Favorite(memberId, pNum);
		int currentPage = (page != null) ? page : 1;
		
		ArrayList<Integer> list = mypageService.insertFavorite(favorite);
		try {
			if(list.get(0) > 0) {
				PrintWriter out;
				out = response.getWriter();
				JSONObject jResult = new JSONObject();
			      
				jResult.put("src","fas fa-star");
				jResult.put("cnt", list.get(1));
			    response.setContentType("application/json"); //핵중요
			     
			    out.print(jResult);
			      
			    out.flush();// 버퍼링되어서 아직 기록되지않은 데이터를 출력스트림에 모두 출력
			    out.close();// 출력되지않은데이터가 있으면 먼저 출력하고 스트림 종료
				
			}else {
				response.sendRedirect("/myFavoriteList.do?page="+currentPage);
			}
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	@ResponseBody
	@RequestMapping(value="delCart.do")
	public void delCart(HttpServletRequest request, HttpServletResponse response, int[] pNumList){
		HttpSession session = request.getSession();
		
		ArrayList<ProductInCart> pList = (ArrayList<ProductInCart>) session.getAttribute("pList");
		ArrayList<Bucket> cart = (ArrayList<Bucket>) session.getAttribute("cart");
				
		for(int i=pList.size()-1; i>=0; i--) {
			for (Integer pNum : pNumList) {
				if(((ProductInCart)pList.get(i)).getProductNum() == pNum) {
					pList.remove(pList.indexOf(((ProductInCart)pList.get(i))));
					break;
				}
			}
		}
		
		for(int i=cart.size()-1; i>=0; i--) {
			for (Integer pNum : pNumList) {
				if(((Bucket)cart.get(i)).getProductNum() == pNum) {
					cart.remove(cart.indexOf(((Bucket)cart.get(i))));
					break;
				}
			}
		}
		
		session.setAttribute("pList", pList);
		session.setAttribute("cart", cart);
	}
}
