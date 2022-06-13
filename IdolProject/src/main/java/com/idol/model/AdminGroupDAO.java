package com.idol.model;

import java.util.List;

public interface AdminGroupDAO {
	
	// 그룹 등록
	public int insertGroup(GroupDTO dto);
	
	//그룹 리스트
	public List<GroupDTO> getGroupList();
	
	//그룹 정보 가져오기
	public GroupDTO getGroupCont(int no);
	
	// 그룹 정보 수정하기
	public int updateGroup(GroupDTO dto);

	
}
