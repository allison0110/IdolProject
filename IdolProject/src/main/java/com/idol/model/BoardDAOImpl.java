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

	// 게시물 작성
	@Override
	public int boardWrite(BoardDTO boarddto) {
		return sqlSession.insert("boardWrite", boarddto);
	}

	// 베스트게시물 리스트 출력
	@Override
	public List<BoardDTO> getBestList() {
		return sqlSession.selectList("BestList");
	}

}
