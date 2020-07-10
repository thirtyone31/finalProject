package org.kh.fin.member.service.logic;

import org.kh.fin.member.domain.Member;
import org.kh.fin.member.service.MemberService;
import org.kh.fin.member.store.MemberStore;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("mService")
public class MemberServiceImple implements MemberService {

	@Autowired
	private MemberStore mStore;
	
	@Override
	public Member loginMember(Member mem) {
		
		return mStore.selectMember(mem);
	}

	@Override
	public int checkIdDup(String userId) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insertMember(Member mem) {
		// TODO Auto-generated method stub
		return 0;
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

}
