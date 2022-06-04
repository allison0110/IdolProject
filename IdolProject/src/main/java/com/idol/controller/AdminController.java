package com.idol.controller;

import java.awt.BufferCapabilities.FlipContents;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.logging.Logger;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

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
	
	@RequestMapping("test1.do")
	public void insertTest(Map<String, Object> map, MultipartHttpServletRequest mRequest, 
			HttpServletRequest request) {
				
		String uplaodPath = "C:\\Users\\JUNGHWAN\\Documents\\SourceTree_Final\\IdolProject\\src\\main\\webapp\\resources\\upload\\celeb\\";
		
		Iterator<String> iterator =  mRequest.getFileNames();
		
		MultipartFile multipartFile = null;
		
		while(iterator.hasNext()) {
		
			multipartFile = mRequest.getFile(iterator.next());
			
			if(multipartFile.isEmpty() == false) {
			
				System.out.println("name : " + multipartFile.getName()); 
				System.out.println("fileName : " + multipartFile.getOriginalFilename()); 
				System.out.println("size : " + multipartFile.getSize()); 
			}
			
			String originFileName = multipartFile.getOriginalFilename();
			
			
			
			if(originFileName != null) {
				
				
				try {
					
					File origin = new File(uplaodPath + "/" + originFileName);

					multipartFile.transferTo(origin);
					
				} catch (IllegalStateException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			
		}
	
	}
	
	@RequestMapping("test2.do")
	public String test2(MultipartHttpServletRequest mRequest, Model mode) {
		
		
		String uploadPath = "C:\\Users\\JUNGHWAN\\Documents\\SourceTree_Final\\IdolProject\\src\\main\\webapp\\resources\\upload\\celeb";
		
		Iterator<String> iterator = mRequest.getFileNames();
		
		while(iterator.hasNext()) {
			
			String uploadFileName = iterator.next();
			
			MultipartFile mFile = mRequest.getFile(uploadFileName);
			
			String originalFileName = mFile.getOriginalFilename();
			
			String homedir = uploadPath;
			
			File path1 = new File(homedir);
			
			if(!path1.exists()) {
				path1.mkdirs();
			}
			
			String saveFileName = originalFileName;
			
			if(saveFileName != null) {
				
				
				try {
					File origin = new File(homedir + "/" + saveFileName);

					mFile.transferTo(origin);
					
				} catch (IllegalStateException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			
			
		} // while end
		
		return "admin/admin_main";
	}
		
		
	@RequestMapping(value = "test3.do")
    public String test3(MultipartHttpServletRequest mRequest) {
		
		
		Iterator<String> iterator = mRequest.getFileNames();
		
		String uploadFileName = iterator.next();
		
        List<MultipartFile> fileList = mRequest.getFiles(uploadFileName);
        
        String src = mRequest.getParameter("src");
        
        System.out.println("src value : " + src);

        String path = "C:\\Users\\JUNGHWAN\\Documents\\SourceTree_Final\\IdolProject\\src\\main\\webapp\\resources\\upload\\celeb\\";

        for (MultipartFile mFile : fileList) {
        	
            String originFileName = mFile.getOriginalFilename(); // 원본 파일 명
                  
            long fileSize = mFile.getSize(); // 파일 사이즈

            System.out.println("originFileName : " + originFileName);
            
            System.out.println("fileSize : " + fileSize);

            String safeFile = path + System.currentTimeMillis() + originFileName;
            
            try {
            	mFile.transferTo(new File(safeFile));
            } catch (IllegalStateException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            } catch (IOException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
        }

        return "admin/admin_main";
    }
	
	
	
	
	
	
	
} // AdminController end
