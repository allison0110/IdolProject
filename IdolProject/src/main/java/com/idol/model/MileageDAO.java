package com.idol.model;

import java.util.List;

public interface MileageDAO {
	
	/* **********************원석님 *************************/
	int getreamining(int mno);
	MileageDTO getMileageDetail(int mno);
	int insertMileageInfo(MileageDTO mdto);
	
	/* **********************희원님 *************************/
	public List<MileageDTO> mostMessages();

	public List<MileageDTO> mostMileage();
	List<MileageDTO> getMileageList(int member_no);
	
}