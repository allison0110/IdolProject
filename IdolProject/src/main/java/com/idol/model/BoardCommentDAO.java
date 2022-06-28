package com.idol.model;

import java.util.List;

public interface BoardCommentDAO {
	
	// 댓글등록
	int commentWrite(BoardCommentDTO boardCommentdto);
	
	// 게시물 댓글 리스트
	List<BoardCommentDTO> getCommentList(int bno); 
	
	// 답변글(대댓글) 스텝 증가
	void updateCommentStep(int group,int step);
	
	// 답변글(등록) 
	int replyWrite(BoardCommentDTO boardCommentdto);
	
	// 게시글 댓글 갯수
	int getcommentCount(int bno);
	

}
