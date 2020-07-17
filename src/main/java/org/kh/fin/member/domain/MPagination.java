package org.kh.fin.member.domain;


public class MPagination {
	
	public static MPageInfo getPageInfo(int currentPage,int listCount) {
		
		MPageInfo pi = null;
		
		int pageLimit =10;	//한페이지에서 보여질 페이징 수
		int maxPage;		//전체페이징 수 중 가장 마지막 페이지
		int startPage;		//현재 페이지에서 보여질 페이징 버튼의 시작페이지
		int endPage;		//현재 페이지에서 보여질 페이징 버튼의 끝페이지
		
		int memberLimit = 5;	//한 페이지에서 보여질 게시글 갯수
		
		maxPage= (int)((double)listCount / memberLimit + 0.9);
		startPage = (((int)((double)currentPage/pageLimit + 0.9))-1) * pageLimit + 1;
		endPage = startPage + pageLimit - 1;
		
		if(maxPage < endPage ) {
			endPage = maxPage;
		}
		pi = new MPageInfo(currentPage, listCount, pageLimit,
				maxPage, startPage, endPage, memberLimit);
		return pi;
	}
}
