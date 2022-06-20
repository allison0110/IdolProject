package com.idol.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class OrderDAOImpl implements OrderDAO{
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	// 새로운 주문그룹을 반환하는 메서드
	@Override
	public int newGroupNo() {
		return sqlSession.selectOne("newGroupno");
	}

	@Override
	public int addOrder(OrderDTO orderdto) {
		return sqlSession.insert("addOrder", orderdto);
	}

	@Override
	public List<OrderDTO> getLastOrderList(String memid) {
		return sqlSession.selectList("lastorder", memid);
	}

	
}
