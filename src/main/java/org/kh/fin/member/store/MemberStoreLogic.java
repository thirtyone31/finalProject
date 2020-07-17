package org.kh.fin.member.store;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.kh.fin.member.domain.MPageInfo;
import org.kh.fin.member.domain.Member;
import org.kh.fin.member.domain.Msearch;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("mStore")
public class MemberStoreLogic {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	
	public Member selectMember(Member mem) {
		Member loginUser 
		= sqlSession.selectOne("memberMapper.selectOne", mem);
		return loginUser;
	}
	
	public int insertMember(Member mem) {
		int result 
		= sqlSession.insert("memberMapper.insertMember", mem);
		sqlSession.insert("memberMapper.insertMember", mem);
		return result;
	}
	
	public int checkIdDup(String userId) {
		int result 
		= sqlSession
			.selectOne("memberMapper.checkIdDup", userId);
		return result;
	}
	
	public int updateMember(Member mem) {
		return sqlSession
					.update("memberMapper.updateMember", mem);
	}
	
	public int deleteMember(String userId) {
		return sqlSession
				.update("memberMapper.deleteMember",userId);
	}
	public List<Member> listMember(){
		return sqlSession.selectList("memberMapper.memberList");
	}
	public int blackMember(String userId) {
		return sqlSession.update("memberMapper.blackMember",userId);
	}
	public int outMember(String userId) {
		return sqlSession.update("memberMapper.outMember",userId);
	}
	public ArrayList<Member> searchList(Msearch search){
		return (ArrayList)sqlSession.selectList("memberMapper.searchList",search);
	}
	public int getListCount() {
		return sqlSession.selectOne("memberMapper.getListCount");
	}
	public ArrayList<Member> selectList(MPageInfo pi){
		int offset = (pi.getCurrentPage() -1) * pi.getMemberLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getMemberLimit());
		return (ArrayList)sqlSession.selectList("memberMapper.selectList",null,rowBounds);
	}
	//아이디 찾기 
	public String find_id(String email)throws Exception{
		return sqlSession.selectOne("memberMapper.find_id",email);
	}
}
