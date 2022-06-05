package com.idol.model;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

public interface AdminDAO {
	
	
	public AdminDTO getAdminCont(String id);
	
	public void insertTest(TestDTO dto);

	public void insertTest2(Map<String, Object> map);
	
	public void insertHappy(HappyDTO dto);
	
	public void jongtest(List<MultipartFile> test);

	void jongtest(TestDTO test);
	
}


