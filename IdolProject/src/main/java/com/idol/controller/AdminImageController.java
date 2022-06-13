package com.idol.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

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
			out.println("location.href='admin_images_list.do'");
			out.println("</script>");
			
		}else {
			
			out.println("<script>");
			out.println("alert('등록 실패 :(')");
			out.println("history.back()");
			out.println("</script>");
		}
		
		
	}
	
	// 이미지 전체리스트 불러오기 to 메인
	@RequestMapping("admin_images_list.do")
	public String imagesList(Model model) {
		
		List<ImagesDTO> list = this.dao.imagesList();
		
		model.addAttribute("imagesList", list);
		
		return "admin/admin_image_main";
		
	}
	
	// 이미지 상세 정보 가져오기
	@RequestMapping("admin_images_content.do")
	public String imagesCont(@RequestParam("no") int no, Model model) {
		
		ImagesDTO dto = this.dao.imagesCont(no);
		
		model.addAttribute("imageCont", dto);
		
		return "admin/admin_images_cont";
		
	}
	
	// 이미지 삭제 후 넘버링 재정의 
	@RequestMapping("admin_images_delete.do")
	public void imagesDelete(@RequestParam("no") int no, HttpServletResponse response) throws IOException {
		
		int check = this.dao.imageDelete(no);
		
		response.setContentType("text/html; charset=UTF-8");
		
		PrintWriter out = response.getWriter();
		
		if(check > 0) {
			
			this.dao.imageNoSequen(no);
			
			out.println("<script>");
			out.println("alert('이미지 삭제 성공 :)')");
			out.println("location.href='admin_images_list.do'");
			out.println("</script>");
		}else {
			
			out.println("<script>");
			out.println("alert('이미지 삭제 실패 :(')");
			out.println("history.back()");
			out.println("</script>");
			
		}
		
	}
	
	
	// 이미지 상세 정보 불러오기
	@RequestMapping("admin_images_modify.do")
	public String imageModify(Model model, @RequestParam("no") int no) {
		
		ImagesDTO dto = this.dao.imagesCont(no);
		
		model.addAttribute("imagesModify", dto);
		
		return "admin/admin_images_modify";
	}
	
	
	@RequestMapping("admin_images_modify_ok.do")
	public void imageModifyOk(ImagesDTO dto, HttpServletResponse response) throws IOException {
		
		System.out.println("no:" + dto.getImage_no());

		int check = this.dao.imageModifyOk(dto);
		
		response.setContentType("text/html; charset=UTF-8");
		
		PrintWriter out = response.getWriter();
		
		System.out.println("path:" + dto.getImage_path());
		System.out.println("link:" + dto.getImage_link());
		System.out.println("priorority:" + dto.getImage_priority());
		System.out.println("visible:" + dto.getImage_visible());
		System.out.println("check : " + check);
		if(check >0) {
			
			out.println("<script>");
			out.println("alert('수정 성공 :)')");
			out.println("location.href='admin_images_content.do?no="+dto.getImage_no()+"'");
			out.println("</script>");
		
		}else {
			
			out.println("<script>");
			out.println("alert('수정 실패 :(')");
			out.println("history.back()");
			out.println("</script>");
			
		}
	}
	
	
	
	
	
	
	
}
