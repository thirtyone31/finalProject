package org.kh.fin.order.controller;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.kh.fin.member.domain.Member;
import org.kh.fin.mypage.domain.Bucket;
import org.kh.fin.order.domain.Order;
import org.kh.fin.order.domain.OrderDetail;
import org.kh.fin.order.service.OrderService;
import org.kh.fin.product.domain.Product;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class OrderController {

	@Autowired
	OrderService oService;

	@RequestMapping(value = "orderDetailInsertInfo.do", method = RequestMethod.POST)
	public ModelAndView orderFinish(OrderDetail orderDetail, Order order, ModelAndView mv, HttpSession session) {

		Member member = (Member) session.getAttribute("loginInfo");
		order.setMemberId(member.getMemberId());
		String orderNum = oService.getOrderNum();
		System.out.println(orderNum);

		order.setOrderNum(orderNum);
		orderDetail.setOrderNum(orderNum);

		System.out.println("오더디테일" + orderDetail);
		System.out.println("오더" + order);

		int resultOrder = oService.insertOrder(order);
		int resultOrderDetail = oService.insertOrderDetail(orderDetail);
		int resultProductCnt = oService.updateProductCnt(orderDetail);

		if (resultOrder > 0 && resultOrderDetail > 0 && resultProductCnt > 0) {
			mv.addObject("order", order);
			mv.addObject("orderDetail", orderDetail);
			mv.setViewName("order/finishOrder");
		} else {
			mv.setViewName("error");
		}
		return mv;

	}
	
	@ResponseBody
	@RequestMapping(value="bucketToOrder.do", method = RequestMethod.POST)
	public void bucketToOrder(HttpServletRequest request, HttpServletResponse response, 
			@RequestBody Map<String, Object> map) {
		try {
			PrintWriter out;
			JSONObject jResult = new JSONObject();
			out = response.getWriter();
		
			response.setContentType("application/json"); //핵중요

			Order order = new Order();
			Map<String, String> orderInfo = (Map)map.get("receiverData");
			String orderNum = oService.getOrderNum();
			order.setOrderNum(orderNum);
			String memberId = orderInfo.get("memberId").toString();
			order.setMemberId(memberId);
			String orderName = orderInfo.get("name").toString();
			order.setorderName(orderName);
			String orderPhone = orderInfo.get("phone").toString();
			order.setOrderPhone(orderPhone);
			String orderPost = orderInfo.get("postcode").toString();
			order.setOrderPost(orderPost);
			String address = orderInfo.get("address").toString();
			order.setOrderAddress(address);
			String detailAddress = orderInfo.get("detailAddress").toString();
			order.setOrderAddressDetail(detailAddress);
			String purchaseType = orderInfo.get("type").toString();
			order.setPurchaseType(purchaseType);
			System.out.println(order.toString());
					
			oService.insertOrder(order);
			ArrayList<Object> list = (ArrayList)map.get("multiParam");
			for (Object object : list) {
				Map<String, String> data = (Map)object;
				OrderDetail orderDetail = new OrderDetail(Integer.parseInt(data.get("productNum")), orderNum, Integer.parseInt(data.get("cnt")), 0);
				oService.insertOrderDetail(orderDetail);
				oService.updateProductCnt(orderDetail);
			}
			HttpSession session = request.getSession();
			session.removeAttribute("pList");
			session.removeAttribute("cart");
			jResult.put("result","success");
		    out.print(jResult);
		      
		    out.flush();// 버퍼링되어서 아직 기록되지않은 데이터를 출력스트림에 모두 출력
		    out.close();
		} catch (Exception e) {
			// TODO: handle exception
		}
	}

}
