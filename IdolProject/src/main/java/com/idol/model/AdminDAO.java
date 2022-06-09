package com.idol.model;

import java.util.List;

public interface AdminDAO {
	
	// 관리자 상세 정보
	public AdminDTO getAdminCont(String id);
	// 가수 등록 
	public int insertCeleb(CelebDTO dto);
	// 가수 전체 리스트
	public List<CelebDTO> selectCelebList();
	// 그룹 이름 리스트
	public List<CelebDTO> selectGroupList();
	// 가수 상세 정보 by name
	public CelebDTO getCelebContByName(String celeb_name);
	// 가수 등록 후 그룹이면 그룹 이미지 등록
	public int updateGroupImage(CelebDTO dto);
	// 가수 전체 리스트 불러오기 
	public List<CelebDTO> celebList();
	// 가수 상세 정보 by number
	public CelebDTO getCelebContByNo(int no);
	// 가수 삭제 하기 
	public int deleteCeleb(int no);
	// 가수 삭제시 셀럽 넘버 재정의
	public void updateSequen(int no);
	
	
	// 테스트
	public void insertTest(TestDTO dto);


	
	
}


