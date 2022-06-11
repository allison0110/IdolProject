package com.idol.model;

import java.util.List;

public interface AdminMusicDAO {

	// 음원 등록 
	public int insertMusic(MusicDTO dto);
	// 음원 전체 리스트 불러오기
	public List<MusicDTO> getMusicList();
	// 음원 상세 정보 가져오기 by music_name
	public MusicDTO getMusicCont(String name);
	// 음원 삭제
	public int deleteMusic(String name);
	// 음원 수정하기 
	public int musicUpdate(MusicDTO dto);
	
	
	
}
