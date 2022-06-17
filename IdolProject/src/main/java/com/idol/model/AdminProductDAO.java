package com.idol.model;

import java.util.List;

public interface AdminProductDAO {
	
	// 상품 리스트 불러오기
	public List<ProductDTO> getProductList();
	

}
