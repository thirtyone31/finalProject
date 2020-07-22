package org.kh.fin.mypage.service;

import java.util.ArrayList;

import org.kh.fin.common.PageInfo;
import org.kh.fin.mypage.domain.Favorite;
import org.kh.fin.mypage.domain.OrderInfo;
import org.kh.fin.mypage.domain.WriteBoard;
import org.kh.fin.product.domain.Product;
import org.kh.fin.product.domain.ProductInCart;

public interface MyPageService {
	public int getListCount(String memberId, String type);
	public ArrayList<WriteBoard> selectWriteList(String memberId, PageInfo pi);
	public ArrayList<OrderInfo> selectOrderList(String memberId, PageInfo pi);
	public ArrayList<Product> selectFavoriteList(String memberId, PageInfo pi);
	public ArrayList<Integer> insertFavorite(Favorite favorite);
	public ArrayList<Integer> deleteFavorite(Favorite favorite);
	public ProductInCart selectOneProduct(int productNum);
	public int getdcRate(String memberId);
}
