package com.idol.model;

public interface MileageDAO {
	int getreamining(int mno);
	MileageDTO getMileageDetail(int mno);
	int insertMileageInfo(MileageDTO mdto);
}