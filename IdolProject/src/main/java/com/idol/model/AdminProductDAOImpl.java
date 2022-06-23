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
		return this.sqlSession.selectList("getProductsList");
	}

	@Override
	public int insertProductCategory(ProductCategoryDTO pCategoryDTO) {
		return this.sqlSession.insert("insertProductCategory", pCategoryDTO);
	}

	@Override
	public List<CelebDTO> getCelebList() {
		return this.sqlSession.selectList("celebList");
	}

	@Override
	public List<ProductCategoryDTO> getProductCategory() {
		return this.sqlSession.selectList("getPCategoryList");
	}

	@Override
	public int insertPorduct(ProductDTO dto) {
		return this.sqlSession.insert("insertProduct", dto);
	}

	@Override
	public ProductDTO getProductCont(int no) {
		return this.sqlSession.selectOne("getProductCont", no);
	}

	@Override
	public int deleteProduct(int no) {
		return this.sqlSession.delete("deleteProduct", no);
	}

	@Override
	public void updateProductSequen(int no) {
		this.sqlSession.update("updateProNoSequen", no);
		
	}

	@Override
	public int updateProduct(ProductDTO dto) {
		return this.sqlSession.update("updateProduct", dto);
	}

	@Override
	public List<OrderDTO> getOrderList() {
		return this.sqlSession.selectList("getOrderList");
	}
	
	
	

}
