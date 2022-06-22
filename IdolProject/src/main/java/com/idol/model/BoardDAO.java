package com.idol.model;

import java.util.List;

public interface BoardDAO {
	
	//게시물 전체 리스트를 출력하는 메서드
	List<BoardDTO> getAllBoardList();
}
