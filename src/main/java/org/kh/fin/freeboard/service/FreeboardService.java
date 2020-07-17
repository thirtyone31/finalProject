package org.kh.fin.freeboard.service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.kh.fin.common.PageInfo;
import org.kh.fin.freeboard.domain.FreeBoard;
import org.kh.fin.freeboard.domain.FreeComment;
import org.kh.fin.freeboard.domain.Search;

public interface FreeboardService {

	/** 자유게시판 전체 조회서비스
	 * @return list
	 */
	public int getListCount();
	
	public ArrayList<FreeBoard> freeBoardList(PageInfo pi);
	/** 자유게시판 등록 서비스
	 * 
	 * @param freeboard
	 * @return result
	 */
	public int insertFreeBoard(FreeBoard freeboard, HttpServletRequest request);
	/** 자유게시판 수정 서비스
	 * 
	 * @param freeboard
	 * @return result
	 */
	public int updateFreeBoard(FreeBoard freeboard);
	/** 자유게시판 삭제 서비스
	 * 
	 * @param boardNo
	 * @return result
	 */
	public int deleteFreeBoard(int boardNo);
	/** 자유게시판 검색 서비스
	 * 
	 * @param search
	 * @return searchList
	 */
	public ArrayList<FreeBoard> searchList(Search search);
	/** 자유게시판 댓글 조회
	 * 
	 * @param boardNo
	 * @return list
	 */
	public ArrayList<FreeComment> selectFreeCommentList(int boardNo);
	/** 자유게시판 댓글 등록 서비스
	 * 
	 * @param freeComment
	 * @return result
	 */
	public int insertFreeComment(FreeComment freeComment);
	/** 자유게시판 댓글 삭제 서비스
	 * 
	 * @param commentNum
	 * @return result
	 */
	public int deleteFreeComment(int commentNum);
	
}
