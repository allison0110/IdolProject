package com.idol.model;

import java.util.List;

public interface OrderDAO {
	int addOrder(OrderDTO orderdto);

	List<OrderDTO> getOrderList(String member_id);

	String[] getOrderDate(String login_id);

	List<String> getOrderDates(String login_id);
}
