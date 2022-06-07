package com.idol.model;



import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class AdminDAOImpl implements AdminDAO{

	@Autowired
	private SqlSessionTemplate sqlSession;


	@Override
	public AdminDTO getAdminCont(String id) {
		
		return this.sqlSession.selectOne("admin_check", id);		
	}


	@Override
	public void insertTest(TestDTO dto) {
		this.sqlSession.insert("test", dto);
	}


	@Override
	public void insertCeleb(CelebDTO dto) {
		
		this.sqlSession.insert("celeb", dto);
		
	}


	@Override
	public List<CelebDTO> selectCelebList() {

		return this.sqlSession.selectList("celebList");
		
	}


	@Override
	public void selectCelebCont(int no) {
		// TODO Auto-generated method stub
		
	}


	@Override
	public List<CelebDTO> selectGroupList() {
		return this.sqlSession.selectList("groupList");
	}

	

	
	
}
