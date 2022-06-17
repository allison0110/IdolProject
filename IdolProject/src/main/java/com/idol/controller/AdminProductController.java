package com.idol.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.idol.model.AdminProductDAO;

@Controller
public class AdminProductController {

	@Autowired
	private AdminProductDAO dao;
	
	
	
	
}
