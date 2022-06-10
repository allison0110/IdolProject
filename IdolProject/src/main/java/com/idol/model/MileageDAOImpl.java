package com.idol.model;


import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MileageDAOImpl implements MileageDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public MileageDTO memMileage(MemberDTO dto) {

		return this.sqlSession.selectOne("memMileage", dto);
	}

	
}
