package com.idol.model;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class AdminDAOImpl implements AdminDAO{

	@Autowired
	private SqlSessionTemplate sqlSession;


	@Override
	public AdminDTO getAdminCont(String id) {
		
		return this.sqlSession.selectOne("admin_check", id);		
	}


	@Override
	public void insertTest(TestDTO dto) {
		this.sqlSession.insert("test", dto);
	}


	@Override
	public void insertTest2(Map<String, Object> map) {

		this.sqlSession.insert("test2", map);
		
	}

	

	
	
}
