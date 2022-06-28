package com.idol.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class BoardCommentDAOImpl implements BoardCommentDAO {
	@Autowired
	private SqlSession sqlSession;

	// 게시글 댓글등록
	@Override
	public int commentWrite(BoardCommentDTO boardCommentdto) {
		return sqlSession.insert("commentWrite", boardCommentdto);
	}

	// 게시물 댓글리스트
	@Override
	public List<BoardCommentDTO> getCommentList(int bno) {
		return sqlSession.selectList("boardCommentList", bno);
	}
	
	// 댓글에 대한 답변글(대댓글) 스텝 증가
	@Override
	public void updateCommentStep(int group, int step) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("group", group);
		map.put("step", step);
		sqlSession.update("updateStep", map);
		
	}
	// 대댓글 작성
	@Override
	public int replyWrite(BoardCommentDTO boardCommentdto) {
		return sqlSession.insert("replyWrite", boardCommentdto);
	}
	
	// 게시글 댓글 갯수
	@Override
	public int getcommentCount(int bno) {
		return sqlSession.selectOne("commentCount", bno);
	} 
}
