package org.kh.fin.order.store;

import java.util.ArrayList;

import org.kh.fin.order.domain.Order;
import org.kh.fin.order.domain.OrderDetail;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("oStore")
public class OrderStoreLogic {

	@Autowired SqlSessionTemplate sqlSession;

	public int insertOrderDetail(OrderDetail orderDetail) {
		return sqlSession.insert("orderMapper.insertOrderDetail",orderDetail);
	
		
	}
	public int insertOrder(Order order) {
		return sqlSession.insert("orderMapper.insertOrder",order);
	}
	
	public String getOrderNum() {
		return sqlSession.selectOne("orderMapper.getOrderNum");
	}
	public int updateProductCnt(OrderDetail orderDetail) {
		
		return sqlSession.update("orderMapper.updateProductCnt",orderDetail);
	}

	

	


}
