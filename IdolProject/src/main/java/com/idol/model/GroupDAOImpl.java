package com.idol.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class GroupDAOImpl implements GroupDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	//solo제외 group 리스트
	@Override
	public List<GroupDTO> representGList() {
		return this.sqlSession.selectList("groupList"); 
	}

}
