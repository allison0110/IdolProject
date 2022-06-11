package com.idol.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class AdminMusicDAOImpl implements AdminMusicDAO{

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int insertMusic(MusicDTO dto) {
		return this.sqlSession.insert("musicInsert", dto);
	}

	@Override
	public List<MusicDTO> getMusicList() {
		return this.sqlSession.selectList("musicList");
	}

	@Override
	public MusicDTO getMusicCont(String name) {
		return this.sqlSession.selectOne("musicCont", name);
	}

	@Override
	public int deleteMusic(String name) {

		return this.sqlSession.delete("deleteMusic", name);
	}

	@Override
	public int musicUpdate(MusicDTO dto) {
		
		return this.sqlSession.update("musicUpdate", dto);
		
	}
	
	

}
