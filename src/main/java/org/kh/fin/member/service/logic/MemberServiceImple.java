package org.kh.fin.member.service.logic;

import java.util.Map;

import org.kh.fin.member.domain.Member;
import org.kh.fin.member.service.MemberService;
import org.kh.fin.member.store.MemberStore;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.google.gson.JsonObject;

@Service("mService")
public class MemberServiceImple implements MemberService {

	@Autowired
	private MemberStore mStore;
	
	@Override
	public Member loginMember(Member mem) {
		
		return mStore.selectMember(mem);
	}

	@Override
	public String checkIdDup(String userId) {
		String resultCode = "00";	// 아이디 중복 없음
		if(this.mStore.checkIdDup(userId)>0) {
			resultCode = "99";		// 아이디 중복
		}
		
		return resultCode;
	}

	@Override
	public int insertMember(Member mem) {
		return mStore.insertMember(mem);
	}

	@Override
	public int updateMember(Member mem) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteMember(String id) {
		// TODO Auto-generated method stub
		return 0;
	}
	@Override
	public String findId(Map<String, String> params) {
		return this.mStore.findId(params);
	}

	@Override
	public String checkNickDup(String nick) {
		String resultCode = "00"; //아이디 중복 없음
		if(this.mStore.checkNick(nick)>0) {
			resultCode = "99";
		}
		return resultCode;
	}

}
