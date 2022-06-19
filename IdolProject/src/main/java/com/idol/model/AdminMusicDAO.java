package com.idol.model;

import java.util.List;

public interface AdminMusicDAO {

	// 음원 등록 
	public int insertMusic(MusicDTO dto);
	// 음원 전체 리스트 불러오기
	public List<MusicDTO> getMusicList();
	// 음원 상세 정보 가져오기 by music_name
	public MusicDTO getMusicCont(int no);
	// 음원 삭제
	public int deleteMusic(int no);
	// 음원 삭제 후 넘버링 재정의
	public void updateMusicSequen(int no);
	// 음원 수정하기 
	public int musicUpdate(MusicDTO dto);
	
	
	//그룹 리스트 가져오기
	public List<GroupDTO> getGroupList();
	//셀럽 리스트 가져오기
	public List<CelebDTO> getCelebList();
	
	// 뮤직 검색 
	public List<MusicDTO> getMusicSearchList(String keyword);
	
	
	
	
	
}
