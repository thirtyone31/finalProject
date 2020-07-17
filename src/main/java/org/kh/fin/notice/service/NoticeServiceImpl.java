package org.kh.fin.notice.service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import org.kh.fin.notice.domain.Notice;
import org.kh.fin.notice.domain.PageInfo;
import org.kh.fin.notice.domain.Search;
import org.kh.fin.notice.store.NoticeStoreLogic;

@Service("nService")
public class NoticeServiceImpl {
	@Autowired
	private NoticeStoreLogic nStore;
	
	

	public ArrayList<Notice> selectList(PageInfo pi) {
		
		return nStore.selectList(pi);
	}

	public int insertNotice(Notice notice,HttpServletRequest request) {
		// textarea의 개행문자를 <br>로 변경
		//notice.setnContent(notice.getnContent().replace("\n", "<br>"));
		return nStore.insertNotice(notice);
	}

	public Notice selectOne(int nId) {
		return nStore.selectOne(nId);
	}

	public int updateNotice(Notice notice) {
		
		return nStore.updateNotice(notice);
	}

	public int deleteNotice(int nId) {
		
		return nStore.deleteNotice(nId);
	}

	public ArrayList<Notice> searchList(Search search) {
		
		return nStore.searchList(search);
	}

	public int getListCount() {
		return nStore.getListCount();
	}

}
