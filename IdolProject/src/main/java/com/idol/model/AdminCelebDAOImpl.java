package com.idol.model;



import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class AdminCelebDAOImpl implements AdminCelebDAO{

	@Autowired
	private SqlSessionTemplate sqlSession;

	// 관리자 정보 불러오기
	@Override
	public AdminDTO getAdminCont(String id) {
		
		return this.sqlSession.selectOne("admin_check", id);		
	}

	// 가수 등록
	@Override
	public int insertCeleb(CelebDTO dto) {
		
		return this.sqlSession.insert("celeb", dto);
		
	}

	// 가수 전체 리스트 불러오기
	@Override
	public List<CelebDTO> selectCelebList() {

		return this.sqlSession.selectList("celebList");
		
	}

	// 그룹 이름 리스트 불러오기
	@Override
	public List<CelebDTO> selectGroupList() {
		return this.sqlSession.selectList("groupList");
	}

	// 이름으로 가수 상세 내역 불러오괴 by name
	@Override
	public CelebDTO getCelebContByName(String celeb_name) {
		
		return this.sqlSession.selectOne("celebCont", celeb_name);
	}
	
	// 가수 등록 후 그룹 일 경우 그룹 이미지 넣기
	@Override
	public int updateGroupImage(CelebDTO dto) {
		
		return this.sqlSession.update("updateGimage", dto);
		
	}
	

	// 가수 전체 리스트 불러오기
	@Override
	public List<CelebDTO> celebList() {
		
		return this.sqlSession.selectList("celectList");
		
	}

	// 가수 상세 정보 불러 오기 by number
	@Override
	public CelebDTO getCelebContByNo(int no) {
		
		return this.sqlSession.selectOne("contentByNO", no);
		
	}

	// 가수 삭제 하는 로직
	@Override
	public int deleteCeleb(int no) {
		
		return this.sqlSession.delete("deleteCeleb", no);
		
		
	}

	// 가수 삭제 후 넘버링 재정의
	@Override
	public void updateSequen(int no) {
		
		this.sqlSession.update("updateSequ", no);
		
	}

	
	
	
	
	
	


	
	
}
