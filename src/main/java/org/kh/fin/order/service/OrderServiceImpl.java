package org.kh.fin.order.service;

import java.util.ArrayList;

import org.kh.fin.order.domain.Order;
import org.kh.fin.order.domain.OrderDetail;
import org.kh.fin.order.store.OrderStoreLogic;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

@Service
public class OrderServiceImpl implements OrderService {

	@Autowired OrderStoreLogic oStore;
	@Override
	public String getOrderNum() {
		// TODO Auto-generated method stub
		return oStore.getOrderNum();
	}
	
	@Override
	public int insertOrderDetail(OrderDetail orderDetail) {

		return oStore.insertOrderDetail(orderDetail);
	}
	@Override
	public int insertOrder(Order order) {
		return oStore.insertOrder(order);
	}

	@Override
	public int updateProductCnt(OrderDetail orderDetail) {
	
		return oStore.updateProductCnt(orderDetail);
	}



}
