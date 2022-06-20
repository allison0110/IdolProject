package com.idol.model;

import java.util.HashMap;
import java.util.List;

public interface OrderDAO {
	int addOrder(OrderDTO orderdto);

	List<OrderDTO> getOrderList(String member_id);

	List<String> getOrderDates(String login_id);

	List getOrderDateList(HashMap<String, String> params);
}
