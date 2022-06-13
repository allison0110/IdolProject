package com.idol.model;

import java.util.List;

public interface AdminGroupDAO {
	
	// 그룹 등록
	public int insertGroup(GroupDTO dto);
	
	//그룹 리스트
	public List<GroupDTO> getGroupList();

	
}
