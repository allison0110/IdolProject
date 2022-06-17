package com.idol.model;

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
}
