package org.kh.fin.mypage.store;


import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.kh.fin.common.PageInfo;
import org.kh.fin.mypage.domain.OrderInfo;
import org.kh.fin.mypage.domain.WriteBoard;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;



@Repository
public class MyPageStore {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public int getListCount(String memberId, String type) {
		int result;
		if(type.equals("write")) {
			result = sqlSession.selectOne("mypageMapper.writeCount", memberId);
		}else if(type.equals("order")){
			result = sqlSession.selectOne("mypageMapper.orderCount", memberId);
		}else if(type.equals("favorite")) {
			result = sqlSession.selectOne("mypageMapper.favoriteCount", memberId);
		}else {
			result = 0;
		}
		return result;
	}
	
	public ArrayList<WriteBoard> selectWriteList(String memberId, PageInfo pi){
 	 	int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		// mybatis의 RowBounds 클래스 사용
		// off : 10, boardLimit : 10
		// 10건의 0건만큼 건너뛰고 결과값을 가져옴
		// 15건의 5건만큼 건너뛰고 결과값을 가져옴
		// 20건의 10건만큼 건너뛰고 결과값을 가져옴
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("mypageMapper.selectWriteList", memberId, rowBounds);
	}
	
	public ArrayList<OrderInfo> selectOrderList(String memberId, PageInfo pi){
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		// mybatis의 RowBounds 클래스 사용
		// off : 10, boardLimit : 10
		// 10건의 0건만큼 건너뛰고 결과값을 가져옴
		// 15건의 5건만큼 건너뛰고 결과값을 가져옴
		// 20건의 10건만큼 건너뛰고 결과값을 가져옴
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("mypageMapper.selectOrderList", memberId, rowBounds);
	}
}
