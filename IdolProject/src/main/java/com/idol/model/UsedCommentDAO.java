package com.idol.model;

import java.util.List;

public interface UsedCommentDAO {

	public int insertUsedComment(UsedCommentDTO dto);

	public List<UsedCommentDTO> getUsedCommentList(int no);

	public int usedCommentDelete(int no);

	
}
