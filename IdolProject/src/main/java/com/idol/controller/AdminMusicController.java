package com.idol.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.idol.model.AdminMusicDAO;
import com.idol.model.MusicDTO;

@Controller
public class AdminMusicController {

	@Autowired
	private AdminMusicDAO dao;
	
	// 음원 등록 페이지로 가기
	@RequestMapping("admin_music_insert.do")
	public String musicInsert() {
		return "admin/admin_music_insert";
	}
	
	// 음원 등록 okay
	@RequestMapping("admin_music_insertOk.do")
	public void musicInsertOk(MusicDTO dto, 
			HttpServletResponse response, MultipartHttpServletRequest mRequest) throws IOException {
		
		Iterator<String> iterator = mRequest.getFileNames();
		
		String uploadFileName = iterator.next();
		
        List<MultipartFile> fileList = mRequest.getFiles(uploadFileName);
        
        //String src = mRequest.getParameter("src");
        
        //System.out.println("src value : " + src);

        String path = "C:\\Users\\JUNGHWAN\\Documents\\SourceTree_Final\\IdolProject\\src\\main\\webapp\\resources\\upload\\music\\";

        String dbFilesName = "";
        
        System.out.println("===========================");
        
        for (MultipartFile mFile : fileList) {
        	
            String originFileName = mFile.getOriginalFilename(); // 원본 파일 명
                  
            long fileSize = mFile.getSize(); // 파일 사이즈
            
           

            System.out.println("originFileName : " + originFileName);
            
            System.out.println("fileSize : " + fileSize);

            String saveFile = path + System.currentTimeMillis() + originFileName;
            
            dbFilesName += System.currentTimeMillis() + originFileName + "|";
            
            try {
            	
            	mFile.transferTo(new File(saveFile));
       	
            } catch (Exception e) {
               
            } 
        } // for() end 
		
		dto.setMusic_coverimage(dbFilesName);
		
		int check = this.dao.insertMusic(dto);
		
		response.setContentType("text/html; charset=UTF-8");
		
		PrintWriter out = response.getWriter();
		
		if(check > 0) {
			out.println("<script>");
			out.println("alert('등록 성공 :)')");
			out.println("location.href='admin_music_list.do'");
			out.println("</script>");
		}else {
			out.println("<script>");
			out.println("alert('등록 실패 :(')");
			out.println("history.back()");
			out.println("</script>");
		}
		
		
	}
	
	// 음원 전체리스트 페이지
	@RequestMapping("admin_music_list.do")
	public String adminMusicList(Model model) {
		
		List<MusicDTO> list = this.dao.getMusicList();
		
		model.addAttribute("musicList", list);
		
		return "admin/admin_music_list";
		
	}
	
	// 음원 상세 정보 페이지 이동
	@RequestMapping("admin_music_content.do")
	public String adminMusicCont(@RequestParam("name") String name, 
			Model model) {
		
		MusicDTO dto = this.dao.getMusicCont(name);
		
		model.addAttribute("musicCont", dto);
		
		return "admin/admin_music_cont";
	}
	
	
	
	
	
}
