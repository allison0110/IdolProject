package com.idol.model;

import java.util.List;

public interface OrderDAO {
	int addOrder(OrderDTO orderdto);
	int newGroupNo();
	List<OrderDTO> getLastOrderList(String memid);
}
