package org.kh.fin.member.store;

import java.util.Map;

import org.kh.fin.member.domain.Member;

public interface MemberStore {
	
	public Member selectMember(Member mem);
	
	public int insertMember(Member mem);
	
	public int checkIdDup(String userId);
	
	public int update(Member mem);
	
	public int deleteMember(String userId);

	public int checkNick(String nickName);

	public String findId(Map<String, String> params);
}
