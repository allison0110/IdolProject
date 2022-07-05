package com.idol.model;

import java.util.List;

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

	@Override

	public List<MusicDTO> getAllList() {
		return this.sqlSession.selectList("mainAllList");
	}
	
	
	public List<MusicDTO> getMusicList_group(String group) {
		
		return sqlSession.selectList("musicList_group", group);
	}

	@Override
	public List<MusicDTO> getMusicList_solo(String name) {
		
		return sqlSession.selectList("musicList_solo", name);
	}

	@Override
	public List<MusicDTO> musicSearch(String name) {
		
		return sqlSession.selectList("musicSearch", name);
	}
	
	
	
}
