package com.idol.model;

import java.util.List;

public interface CelebDAO {
	
	List<CelebDTO> getCelebList();
	CelebDTO getCelebDetail(int cno);
}
