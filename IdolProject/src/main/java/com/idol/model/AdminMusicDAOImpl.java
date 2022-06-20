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
	public MusicDTO getMusicCont(int no) {
		return this.sqlSession.selectOne("musicCont", no);
	}

	@Override
	public int deleteMusic(int no) {

		return this.sqlSession.delete("deleteMusic", no);
	}

	@Override
	public int musicUpdate(MusicDTO dto) {
		
		return this.sqlSession.update("musicUpdate", dto);
		
	}

	@Override
	public List<GroupDTO> getGroupList() {
		return this.sqlSession.selectList("getGList");
	}

	@Override
	public List<CelebDTO> getCelebList() {
		return this.sqlSession.selectList("getCList");
		
	}

	@Override
	public void updateMusicSequen(int no) {
		this.sqlSession.update("updateMusicSequen", no);
		
	}

	@Override
	public List<MusicDTO> getMusicSearchList(String keyword) {
		return this.sqlSession.selectList("searchMusic", keyword);
	}

	@Override
	public List<MusicDTO> getAlbumList() {
		return this.sqlSession.selectList("getAlbumList");
	}

	@Override
	public List<MusicDTO> getMusicInAlbum() {
		return this.sqlSession.selectList("mList");
	}
	
	

}
