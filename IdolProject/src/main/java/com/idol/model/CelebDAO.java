package com.idol.model;

import java.util.List;

public interface CelebDAO {

	List<CelebDTO> soloList();
	List<CelebDTO> representList();
	CelebDTO getCelebInfo(int no);
}
