package com.idol.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.idol.model.AdminImagesDAO;
import com.idol.model.ImagesDTO;

@Controller
public class AdminImageController {

	@Autowired
	private AdminImagesDAO dao;
	
	// 메인페이지로 이동
	@RequestMapping("admin_main_image.do")
	public String ImageMainPage() {
		return "admin/admin_image_main";
	}
	
	// 등록 페이지로 이동
	@RequestMapping("admin_image_insert.do")
	public String insertImagePage() {
		return "admin/admin_image_insert";
	}
	
	// 등록 성공 
	@RequestMapping("admin_insert_image_ok.do")
	public void insertImageOk(ImagesDTO dto, HttpServletResponse response) throws IOException {
		
		int check = this.dao.insertImage(dto);
		
		System.out.println("check : " + check );
		
		response.setContentType("text/html; charset=UTF-8");
		
		PrintWriter out = response.getWriter();
		
		if(check > 0) {
			
			out.println("<script>");
			out.println("alert('등록 성공 :)')");
			out.println("location.href='admin_main_image.do'");
			out.println("</script>");
			
		}else {
			
			out.println("<script>");
			out.println("alert('등록 실패 :(')");
			out.println("history.back()");
			out.println("</script>");
		}
		
		
	}
	
	
	
	
}
