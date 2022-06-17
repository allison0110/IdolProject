package com.idol.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CelebDAOImpl implements CelebDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public List<CelebDTO> getCelebList() {
		return sqlSession.selectList("CelList");
	}

	@Override
	public CelebDTO getCelebDetail(int cno) {
		
		return sqlSession.selectOne("Cdetail", cno);
		
	}

}
