package com.idol.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class BoardDAOImpl implements BoardDAO {
	
	@Autowired
	private SqlSession sqlSession;

	
	//게시물 전체 리스트를 출력하는 메서드
	@Override
	public List<BoardDTO> getAllBoardList() {
		return sqlSession.selectList("allBoardList");
	}

}
