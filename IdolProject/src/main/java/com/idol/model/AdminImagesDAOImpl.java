package com.idol.model;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class AdminImagesDAOImpl implements AdminImagesDAO{

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int insertImage(ImagesDTO dto) {

		return this.sqlSession.insert("insertImage", dto);
	}
	
	
	

}
