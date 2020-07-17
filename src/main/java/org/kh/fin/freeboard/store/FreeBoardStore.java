package org.kh.fin.freeboard.store;

import java.util.ArrayList;


import org.kh.fin.common.PageInfo;
import org.kh.fin.freeboard.domain.FreeBoard;
import org.kh.fin.freeboard.domain.FreeComment;
import org.kh.fin.freeboard.domain.Search;

public interface FreeBoardStore {
	
	public ArrayList<FreeBoard> freeBoardList(PageInfo pi);
	
	public int insertFreeBoard(FreeBoard freeboard);
	
	public int updateFreeBoard(FreeBoard freeboard);
	
	public int deleteFreeBoard(int boardNo);
	
	public ArrayList<FreeBoard> searchList(Search search);

	public int getListCount();
	
	public ArrayList<FreeComment> selectFreeCommentList(int boardNo);
	
	public int insertFreeComment(FreeComment freecomment);

	public int deleteFreeComment(int commentNum);
	
}
