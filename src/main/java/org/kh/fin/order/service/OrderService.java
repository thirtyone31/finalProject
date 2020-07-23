package org.kh.fin.order.service;

import java.util.ArrayList;

import org.kh.fin.order.domain.Order;
import org.kh.fin.order.domain.OrderDetail;
import org.springframework.ui.Model;

public interface OrderService {
	public String getOrderNum();
	public int insertOrderDetail(OrderDetail orderDetail);
	public int insertOrder(Order order);
	public int updateProductCnt(OrderDetail orderDetail);

}
