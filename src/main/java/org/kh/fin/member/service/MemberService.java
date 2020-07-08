package org.kh.fin.member.service;

import org.kh.fin.member.domain.Member;

public interface MemberService {

		public Member loginMember(Member mem);
		
		public int checkIdDup(String userId);
		
		public int insertMember(Member mem);
		
		public int updateMember(Member mem);
		
		public int deleteMember(String id);
}
