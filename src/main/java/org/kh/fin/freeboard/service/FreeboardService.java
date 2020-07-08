package org.kh.fin.freeboard.service;

import java.io.File;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.kh.fin.freeboard.domain.FreeBoard;
import org.kh.fin.freeboard.domain.Search;
import org.springframework.web.multipart.MultipartFile;

public interface FreeboardService {

	public ArrayList<FreeBoard> freeBoardList();
	
	public int insertFreeBoard(FreeBoard freeBoard,MultipartFile file,HttpServletRequest request);
	
	public int updateFreeBoard(FreeBoard freeBoard);
	
	public int deleteFreeBoard(int boardNo);
	
	public FreeBoard detailFreeBoard(int boardNo);
	
	public ArrayList<FreeBoard> searchList(Search search);
	
}
