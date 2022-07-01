package com.idol.model;

import lombok.Data;

@Data
public class UsedDTO {

	private int used_no;
	private String used_userid;
	private String used_title;
	private String used_cont;
	private String used_image;
	private String used_hit;
	private String used_date;
	private String used_update;
	private int category_unofk;
	private int used_size;
	private int used_price;
	private int used_status;		// 중고 상태 : 중고 - 0 / 새상품 -1
	private int used_saltatus;       // 판매상태 : 판매중 - 0 / 판매완료 - 1
	private String used_product;
	
	
}
