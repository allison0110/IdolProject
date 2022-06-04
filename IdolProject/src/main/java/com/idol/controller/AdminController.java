package com.idol.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.idol.model.AdminDAO;
import com.idol.model.AdminDTO;

@Controller
public class AdminController {

	@Autowired
	private AdminDAO dao;
	
	@RequestMapping("admin_login.do")
	public String adminLogin() {
		
		return "admin/admin_login";
		
	}
	
	@RequestMapping("admin_login_ok.do")
	public void adminLoginOk(@RequestParam("admin_id") String id, 
			@RequestParam("admin_pwd") String pwd, HttpServletResponse response, 
				HttpServletRequest request) throws IOException {
		
		
		AdminDTO dto = this.dao.getAdminCont(id);
		
		response.setContentType("text/html; charset=UTF-8");
		
		PrintWriter out = response.getWriter();
		
		HttpSession session = request.getSession();
		
		if(dto.getAdmin_id().equals(id)) {   // id가 존재한 경우
			
			if(dto.getAdmin_pwd().equals(pwd)) {
					
				session.setAttribute("admin_id", dto.getAdmin_id());
				session.setAttribute("admin_pwd", dto.getAdmin_pwd());
				session.setAttribute("admin_name", dto.getAdmin_name());
				session.setAttribute("admin_email", dto.getAdmin_email());
				session.setAttribute("admin_date", dto.getAdmin_date());
							
				out.println("<script>");
				out.println("alert('로그인 성공 :)')");
				out.println("location.href='admin_main.do'");
				out.println("</script>");
				
			}else {                             // 비밀번호가 틀렸을 경우
				
				out.println("<script>");
				out.println("alert('비밀 번호가 틀립니다 :(')");
				out.println("history.back()");
				out.println("</script>");
				
			}
						
		}else {                               // id가 존재하지 않는 경우 (불일치)
			
			out.println("<script>");
			out.println("alert('아이디가 존재하지 않거나 일치 하지 않습니다 :(')");
			out.println("history.back()");
			out.println("</script>");
		}
		
	} //adminLoginOk() end 
	
	@RequestMapping("admin_main.do")
	public String adminMain() {
		return "admin/admin_main";
	}
	
	@RequestMapping("admin_celeb_insert.do")
	public String adminCelebInsert() {
		return "admin/admin_celeb_insert";
	}
	
	
	@RequestMapping("test.do")
	public String test() {
		return "admin/test_insert";
	}
	
	
	
	
	
	
	
	
	
	
	
	
} // AdminController end
