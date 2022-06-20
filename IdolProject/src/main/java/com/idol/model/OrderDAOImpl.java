package com.idol.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class OrderDAOImpl implements OrderDAO{
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int addOrder(OrderDTO orderdto) {
		return sqlSession.insert("addOrder", orderdto);
	}

	//회원의 구매내역 전체리스트 불러오기
	@Override
	public List<OrderDTO> getOrderList(String id) {
		return this.sqlSession.selectList("orderAllList", id);
	}
}
