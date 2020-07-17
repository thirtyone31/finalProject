package org.kh.fin.order.controller;
import java.util.ArrayList;

import org.kh.fin.order.domain.Order;
import org.kh.fin.order.domain.OrderDetail;
import org.kh.fin.order.service.OrderService;
import org.kh.fin.product.domain.Product;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;


@Controller
public class OrderController {

@Autowired OrderService oService;


@RequestMapping(value="orderDetailInsertInfo.do", method=RequestMethod.POST)
public ModelAndView orderFinish(OrderDetail orderDetail, Order order, ModelAndView mv) {
	
	
	String orderNum = oService.getOrderNum();
	System.out.println(orderNum);
	
	order.setOrderNum(orderNum);
	orderDetail.setOrderNum(orderNum);
	int result1 = oService.insertOrder(order);
	int result2 = oService.insertOrderDetail(orderDetail);
	
	if(result1>0 && result2>0) {
	mv.addObject("order",order);
	mv.addObject("orderDetail",orderDetail);
	mv.setViewName("order/finishOrder");
	}else {
		mv.setViewName("error");
	}
	return mv;
	

	
}

	
	



}
