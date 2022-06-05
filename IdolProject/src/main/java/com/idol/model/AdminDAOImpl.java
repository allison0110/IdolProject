package com.idol.model;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;

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


	@Override
	public void insertHappy(HappyDTO dto) {

		this.sqlSession.insert("happy", dto);
		
	}


	@Override
	public void jongtest(TestDTO test) {
		this.sqlSession.insert("jong", test);
		
	}

	

	
	
}
