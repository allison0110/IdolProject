package com.idol.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileUploadBase.FileSizeLimitExceededException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.idol.model.AdminGroupDAO;
import com.idol.model.CelebDTO;
import com.idol.model.GroupDTO;

@Controller
public class AdminGroupController {
	

	@Autowired
	private AdminGroupDAO dao;
	
	// 그룹 등록 페이지로 이동!
	@RequestMapping("admin_group_insert.do")
	public String insertGroup() {
		
		return "admin/admin_group_insert"; 
	}
	
	// 그룹 등록 완료 !! 후 리스트 페이지로 이동
	@RequestMapping("admin_group_insert_ok.do")
	public void insertGroupOk(GroupDTO dto, HttpServletResponse response, 
			MultipartHttpServletRequest mRequest) throws IOException {
		
		System.out.println("==== gourp insert page =====");
		
		Iterator<String> iterator = mRequest.getFileNames();
		
		String uploadFileName = iterator.next();
		
        List<MultipartFile> fileList = mRequest.getFiles(uploadFileName);

        String path = "C:\\Users\\JUNGHWAN\\Documents\\SourceTree_Final\\IdolProject\\src\\main\\webapp\\resources\\upload\\group\\";

        String dbFileName = "";
        
        long fileSize = 0;
        
        for (MultipartFile mFile : fileList) {
        	
            String originFileName = mFile.getOriginalFilename(); // 원본 파일 명
                  
            fileSize = mFile.getSize(); // 파일 사이즈

            System.out.println("originFileName : " + originFileName);
            
            System.out.println("fileSize : " + fileSize);

            String safeFile = path + System.currentTimeMillis() + originFileName;
            
            dbFileName += System.currentTimeMillis() + originFileName + "|";
            
            try {
            	
            	mFile.transferTo(new File(safeFile));
            	
            	
            	
            } catch (IllegalStateException e) {
                
            }
        }
        
        // 파일 첨부 하지 않을 경우
        if(fileSize == 0) {
        	
       	 	dto.setGroup_image("");

        	 int check = this.dao.insertGroup(dto);
             
             response.setContentType("text/html; charset=UTF-8");
             
             PrintWriter out = response.getWriter();
             
             
             if(check > 0) {
             	out.println("<script>");
             	out.println("alert('그룹 등록 성공 :)')");
             	out.println("location.href='admin_group_list.do'");
             	out.println("</script>");
             }else {
             	out.println("<script>");
             	out.println("alert('실패 :(')");
             	out.println("history.back()");
             	out.println("</script>");
             }
             
        // 파일 첨부 했을 경우 
        }else {
        	
        	 dto.setGroup_image(dbFileName);
             
             int check = this.dao.insertGroup(dto);
             
             response.setContentType("text/html; charset=UTF-8");
             
             PrintWriter out = response.getWriter();
             
             
             if(check > 0) {
             	out.println("<script>");
             	out.println("alert('그룹 등록 성공 :)')");
             	out.println("location.href='admin_group_list.do'");
             	out.println("</script>");
             }else {
             	out.println("<script>");
             	out.println("alert('실패 :(')");
             	out.println("history.back()");
             	out.println("</script>");
             }
        	
        	
        }

	}
	
	// 그룹 리스트 불러오기 
	@RequestMapping("admin_group_list.do")
	public String GroupList(Model model) {
		
		List<GroupDTO> list = this.dao.getGroupList();
		
		model.addAttribute("groupList", list);
		
		return "admin/admin_group_list";
	}
	
	
	//그룹 정보 수정
	@RequestMapping("admin_group_modify")
	public String groupModify(@RequestParam("no") int no, Model model) {
		
		GroupDTO dto = this.dao.getGroupCont(no);
		
		model.addAttribute("groupCont", dto);
		
		return "admin/admin_group_modify";
		
	}
		
		
		

	
	
	
	
	
	
	
	
	
}
