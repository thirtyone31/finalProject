package org.kh.fin.mypage.service;

import java.util.ArrayList;

import org.kh.fin.common.PageInfo;
import org.kh.fin.mypage.domain.OrderInfo;
import org.kh.fin.mypage.domain.WriteBoard;

public interface MyPageService {
	public int getListCount(String memberId, String type);
	public ArrayList<WriteBoard> selectWriteList(String memberId, PageInfo pi);
	public ArrayList<OrderInfo> selectOrderList(String memberId, PageInfo pi);
}
