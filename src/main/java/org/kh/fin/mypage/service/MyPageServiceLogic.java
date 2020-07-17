package org.kh.fin.mypage.service;

import java.util.ArrayList;

import org.kh.fin.common.PageInfo;
import org.kh.fin.mypage.domain.OrderInfo;
import org.kh.fin.mypage.domain.WriteBoard;
import org.kh.fin.mypage.store.MyPageStore;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MyPageServiceLogic implements MyPageService{
	
	@Autowired
	private MyPageStore mypageStore;
	
	@Override
	public int getListCount(String memberId, String type) {
		// TODO Auto-generated method stub
		return mypageStore.getListCount(memberId, type);
	}

	@Override
	public ArrayList<WriteBoard> selectWriteList(String memberId, PageInfo pi) {
		// TODO Auto-generated method stub
		return mypageStore.selectWriteList(memberId, pi);
	}

	@Override
	public ArrayList<OrderInfo> selectOrderList(String memberId, PageInfo pi) {
		// TODO Auto-generated method stub
		return mypageStore.selectOrderList(memberId, pi);
	}

}
