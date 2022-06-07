package com.idol.model;

import java.util.List;

public interface AdminDAO {
	
	
	public AdminDTO getAdminCont(String id);
	
	public void insertCeleb(CelebDTO dto);
	
	public void insertTest(TestDTO dto);

	public List<CelebDTO> selectCelebList();
	
	public List<CelebDTO> selectGroupList();
	
	public void selectCelebCont(int no);
	

	
	
}


