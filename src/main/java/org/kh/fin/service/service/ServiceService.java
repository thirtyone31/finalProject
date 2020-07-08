package org.kh.fin.service.service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.kh.fin.freeboard.domain.Search;
import org.kh.fin.service.domain.ServiceBoard;
import org.springframework.web.multipart.MultipartFile;

public interface ServiceService {

	public ArrayList<ServiceBoard> selectList();
	
	public int insertService(ServiceBoard service,MultipartFile file, HttpServletRequest request);
	
	public ServiceBoard selectOne(int boardNo);
	
	public int updateService(ServiceBoard service);
	
	public int deleteService(int boardNo);
	
	public ArrayList<ServiceBoard> searchList(Search search);
	
	public int getListCount();
}
