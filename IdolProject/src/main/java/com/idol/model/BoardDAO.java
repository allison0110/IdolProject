package com.idol.model;

import java.util.List;

public interface BoardDAO {
	
	//게시물 전체 리스트를 출력하는 메서드
	List<BoardDTO> getAllBoardList();
	
	// 추천수가 10개 이상인 리스트를 출력
	List<BoardDTO> getBestList();
	
	// 일반주제 리스트 출력
	List<BoardDTO> getTopicList(int cno);
	
	// 검색 게시물 리스트 출력
	List<BoardDTO> getSearchList(String keyword);
	
	// 마지막 게시물 번호를 획득
	int getMaxBoardNo();
	
	// 게시물 등록
	int boardWrite(BoardDTO boarddto);
	
	// 게시물 상세정보
	BoardDTO getboardDetail(int bno);
	
	// 게시물 조회수 업데이트
	void boardHitUp(int bno);
	
	// 게시물 삭제
	int deleteBoard(int bno);
	
	// 게시물 업데이트
	int boardUpdate(BoardDTO boarddto);
	
	
}
