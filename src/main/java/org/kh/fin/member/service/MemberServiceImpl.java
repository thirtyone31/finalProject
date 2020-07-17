package org.kh.fin.member.service;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.kh.fin.member.domain.MPageInfo;
import org.kh.fin.member.domain.Member;
import org.kh.fin.member.domain.Msearch;
import org.kh.fin.member.store.MemberStoreLogic;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;



@Service("mService")
public class MemberServiceImpl {
	
	@Autowired
	//@Qualifier("mStore")
	private MemberStoreLogic mStore;
	
	/*private Log4jAdvice log4j;
	
	public MemberServiceImpl() {
		log4j = new Log4jAdvice();
	}*/
	/*private LogAdvice log;
	
	public MemberServiceImpl() {
		log = new LogAdvice();
	}*/

	
	@Transactional
	public Member loginMember(Member mem) {
		/*log4j.printLogging();*/
		/*log.printLog();*/
		System.out.println("loginMember 메소드 동작");
		return mStore.selectMember(mem);
	}

	
	@Transactional
	public int checkIdDup(String id) {
		/*log.printLog();*/
		return mStore.checkIdDup(id);
	}

	
	@Transactional
	public int insertMember(Member mem) {
		/*log.printLog();*/
		return mStore.insertMember(mem);
	}

	
	@Transactional
	public int updateMember(Member mem) {
		/*log.printLog();*/
		return mStore.updateMember(mem);
	}

	
	@Transactional
	public int deleteMember(String id) {
		/*log.printLog();*/
		return mStore.deleteMember(id);
	}

	

	
	public  List<Member> listMember() {
		return mStore.listMember();
	}


	public int blackMember(String userId) {
		return mStore.blackMember(userId);
	}

	
	public int outMember(String userId) {
		return mStore.outMember(userId);
	}

	
	public ArrayList<Member> searchList(Msearch search) {
		return mStore.searchList(search);
	}

	
	public int getListCount() {
		return mStore.getListCount();
	}

	
	public ArrayList<Member> selectList(MPageInfo pi) {
		return mStore.selectList(pi);
	}
	//아이디 찾기
	public String find_id(HttpServletResponse response,String email)throws Exception{
		response.setContentType("text/html);charset=utf-8");
		PrintWriter out = response.getWriter();
		String id= mStore.find_id(email);
		
		if(id ==null) {
			out.println("<script>");
			out.println("alert('가입된 아이디가 없습니다.)';");
			out.println("history.go(-1);");
			out.println("</script>");
			out.close();
			return null;
		}else {
			return id;
		}
	}

}

