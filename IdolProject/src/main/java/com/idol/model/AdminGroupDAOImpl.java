package com.idol.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class AdminGroupDAOImpl implements AdminGroupDAO{

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	// 그룹 등록
	@Override
	public int insertGroup(GroupDTO dto) {
		
		return this.sqlSession.insert("groupInsert", dto);
	}

	@Override
	public List<GroupDTO> getGroupList() {
		
		return this.sqlSession.selectList("groupList");
	}

	@Override
	public GroupDTO getGroupCont(int no) {
		return this.sqlSession.selectOne("groupContforUpdate", no);
	}

	@Override
	public int updateGroup(GroupDTO dto) {
		return this.sqlSession.update("updateGroup", dto);
	}

	@Override
	public int deleteGroup(int no) {
		return this.sqlSession.delete("deleteGroup", no);
		
	}

	@Override
	public void updateGroupSeque(int no) {
		this.sqlSession.update("updateGroupSequen", no);
		
	}

	
	
}
