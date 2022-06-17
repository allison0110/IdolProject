package com.idol.model;

import java.util.List;

public interface ProductDAO {
	
	List<ProductDTO> getProductListAll();
	List<ProductDTO> getProductList(int cno,String kind);
	ProductDTO getProductDetail(int pno);

}
