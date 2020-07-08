package org.kh.fin.order.service;

import org.kh.fin.order.domain.Order;
import org.springframework.ui.Model;

public interface OrderService {
	public Model orderPurchaseProduct(Order order,Model model);
}
