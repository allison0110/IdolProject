package com.idol.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.idol.model.MileageDAO;
import com.idol.model.MileageDTO;

@Controller
public class MileageController {

	@Autowired
	private MileageDAO mileageDao;
	
	/* **********************************희원님************************************ */
	@RequestMapping("member_ranking_list.do")
	public String list(HttpServletRequest request, Model model) {
		
		List<MileageDTO> mostMileageList = this.mileageDao.mostMileage();
		
		
		model.addAttribute("mostMileList", mostMileageList);
		
		return "ranking/member_ranking_list";
	}
}