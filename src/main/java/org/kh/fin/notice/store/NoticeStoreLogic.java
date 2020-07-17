package org.kh.fin.notice.store;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.apache.ibatis.session.RowBounds;
import org.kh.fin.common.PageInfo;
import org.kh.fin.notice.domain.NoticeBoard;
import org.kh.fin.notice.domain.NoticeCategory;
import org.kh.fin.notice.domain.Search;

@Repository
public class NoticeStoreLogic {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public ArrayList<NoticeCategory> getCategory(){
		return (ArrayList)sqlSession.selectList("noticeMapper.getCategory");
	}
	
	public ArrayList<NoticeBoard> selectList(PageInfo pi){
		  int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		   //mybatis의 RowBounds 클래스 사용
		   //off : 5, boardLimit :10
		   //off: 얼마나 건너 뛸것인가, 증가값
		   //limit : 고정된 값, 내가 가져오고 싶은 갯수
		   //단점 : 데이터가 많아지면 느려질 수 있음"
		   //10건의 0건 만큼 건너뛰고 결과값을 가져옴 => 10개
		   // 15건의 5건 만큼 건너뛰고 결과값을 가져옴
		   //20건의 10건 만큼 건너뛰고 결과값을 가져옴
		   RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		   return (ArrayList)sqlSession.selectList("noticeMapper.selectList",null, rowBounds);

	}
	
	public ArrayList<NoticeBoard> searchList(Search search){
		return(ArrayList)sqlSession.selectList("noticeMapper.searchList",search);
	}
	
	public NoticeBoard selectOne(int boardNo) {
		return sqlSession.selectOne("noticeMapper.selectOne", boardNo);
	}
	
	public int insertNotice(NoticeBoard notice) {
		return sqlSession.insert("noticeMapper.insertNotice", notice);
	}

	public int updateNotice(NoticeBoard notice) {
		return sqlSession.update("noticeMapper.updateNotice",notice);
	}
	
	public int deleteNotice(int boardNo) {
		return sqlSession.delete("noticeMapper.deleteNotice",boardNo);
	}
	public int getListCount() {
		return sqlSession.selectOne("noticeMapper.getListCount");
	}
	
}









