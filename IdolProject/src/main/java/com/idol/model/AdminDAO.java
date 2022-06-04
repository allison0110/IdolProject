package com.idol.model;

import java.util.Map;

public interface AdminDAO {
	
	
	public AdminDTO getAdminCont(String id);
	
	public int insertTest(TestDTO dto);

	public void insertTest2(Map<String, Object> map);
}
