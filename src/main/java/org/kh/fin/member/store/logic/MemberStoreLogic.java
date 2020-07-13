package org.kh.fin.member.store.logic;

import org.kh.fin.member.domain.Member;
import org.kh.fin.member.store.MemberStore;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MemberStoreLogic implements MemberStore{

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public Member selectMember(Member mem) {
		
		return sqlSession.selectOne("memberMapper.loginUser", mem);
	}

	@Override
	public int insertMember(Member mem) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int checkIdDup(String userId) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int update(Member mem) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteMember(String userId) {
		// TODO Auto-generated method stub
		return 0;
	}

}
