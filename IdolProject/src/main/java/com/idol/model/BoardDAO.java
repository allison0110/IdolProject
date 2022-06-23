package com.idol.model;

import java.util.List;

public interface BoardDAO {
	
	//게시물 전체 리스트를 출력하는 메서드
	List<BoardDTO> getAllBoardList();
	
	// 추천수가 10개 이상인 리스트를 출력
	List<BoardDTO> getBestList();
	
	// 게시물 등록
	int boardWrite(BoardDTO boarddto);
}
