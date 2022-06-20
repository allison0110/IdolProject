package com.idol.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MileageDAOImpl implements MileageDAO{

	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public List<MileageDTO> mostMessages() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<MileageDTO> mostMileage() {
		// TODO Auto-generated method stub
		return null;
	}

	
	
	
}
