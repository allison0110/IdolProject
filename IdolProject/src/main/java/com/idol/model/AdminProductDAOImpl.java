package com.idol.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class AdminProductDAOImpl implements AdminProductDAO{

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public List<ProductDTO> getProductList() {
		// TODO Auto-generated method stub
		return null;
	}
	

}
