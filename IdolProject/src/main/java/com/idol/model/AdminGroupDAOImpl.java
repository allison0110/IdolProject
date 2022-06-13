package com.idol.model;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class AdminGroupDAOImpl implements AdminGroupDAO{

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int insertGroup(GroupDTO dto) {
		
		return this.sqlSession.insert("groupInsert", dto);
	}

	
	
}
