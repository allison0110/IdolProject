package com.idol.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.idol.model.AdminDAO;

@Controller
public class AdminController {

	@Autowired
	private AdminDAO dao;
}
