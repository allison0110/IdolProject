package com.idol.model;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MusicDAOImpl implements MusicDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;

	//곡 정보 가져오기
	@Override
	public MusicDTO getMusicCont(int no) {
		
		return this.sqlSession.selectOne("musicCont", no);
	}
	
	
	
}
