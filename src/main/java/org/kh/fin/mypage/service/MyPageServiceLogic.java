package org.kh.fin.mypage.service;

import java.util.ArrayList;

import org.kh.fin.common.PageInfo;
import org.kh.fin.mypage.domain.Favorite;
import org.kh.fin.mypage.domain.OrderInfo;
import org.kh.fin.mypage.domain.WriteBoard;
import org.kh.fin.mypage.store.MyPageStore;
import org.kh.fin.product.domain.Product;
import org.kh.fin.product.domain.ProductInCart;
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

	@Override
	public ArrayList<Product> selectFavoriteList(String memberId, PageInfo pi) {
		// TODO Auto-generated method stub
		return mypageStore.selectFavoriteList(memberId, pi);
	}

	@Override
	public ArrayList<Integer> insertFavorite(Favorite favorite) {
		// TODO Auto-generated method stub
		return mypageStore.insertFavorite(favorite);
	}

	@Override
	public ArrayList<Integer> deleteFavorite(Favorite favorite) {
		// TODO Auto-generated method stub
		return mypageStore.deleteFavorite(favorite);
	}

	@Override
	public ProductInCart selectOneProduct(int productNum) {
		// TODO Auto-generated method stub
		return mypageStore.selectOneProduct(productNum);
	}

	@Override
	public int getdcRate(String memberId) {
		// TODO Auto-generated method stub
		return mypageStore.getdcRate(memberId);
	}
}
