package com.idol.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.idol.model.BoardCategoryDAO;
import com.idol.model.BoardCategoryDTO;
import com.idol.model.BoardDAO;
import com.idol.model.BoardDTO;
import com.idol.model.MemberDAO;
import com.idol.model.MemberDTO;

@Controller
public class CommunityController {

	@Autowired
	private BoardDAO Boarddao;
	
	@Autowired
	private MemberDAO Memberdao;
	
	@Autowired
	private BoardCategoryDAO BoardCategorydao;
	
	// 커뮤니티 게시물 전체리스트 페이지로 이동
	@RequestMapping("community_boardList.do")
	public String community_boardList(Model model) {
		
		
		// 게시글의 추천수가 10개 이상인 게시글의 리스트를 가져오는 메서드
		List<BoardDTO> bestlist = Boarddao.getBestList();
		
		// 전체 게시글 출력 리스트를 가져옴
		List<BoardDTO> baordlist = Boarddao.getAllBoardList();
		
		// 게시글 카테고리 리스트를 가져옴
		List<BoardCategoryDTO> categorylist = BoardCategorydao.getCategoryList();
		
		model.addAttribute("categoryList", categorylist);
		model.addAttribute("bestList", bestlist);
		model.addAttribute("baordList", baordlist);
		
		System.out.println(baordlist.size());
		
		
		return "community/community_boardList";
	}
	
	
	// 커뮤니티 게시물 작성 페이지로 이동
	@RequestMapping("community_boardwrite.do")
	public String community_boardwrite(HttpServletRequest request) {

		return "community/community_boardWrite";
		
	}
	
	@RequestMapping("community_boardwrite_ok.do")
	public void community_boardwrite(MultipartHttpServletRequest mrequest,BoardDTO boarddto) {
		
		List<MultipartFile> fileList = mrequest.getFiles("file");

        String path = "C:\\NCS\\IdolProject\\IdolProject\\src\\main\\webapp\\resources\\upload\\community";
        
        // 등록된 이미지수만큼의 이미지가 반복적으로 저장될 String 변수
        String images = " ";
        System.out.println("size:"+fileList.size());
        
        if(fileList.size() >1) {
        for (MultipartFile mf : fileList) {
            String originFileName = mf.getOriginalFilename(); // 원본 파일 명
            long fileSize = mf.getSize(); // 파일 사이즈
            images += originFileName+"|";
            System.out.println("originFileName : " + originFileName);
            System.out.println("fileSize : " + fileSize);

            String safeFile = path + "\\" + originFileName;
            try {
                mf.transferTo(new File(safeFile));
            } catch (Exception e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            } 
        }
        }
        
        // 업로드된 이미지를 dto에 저장

        boarddto.setCommunity_image(images);
        System.out.println(boarddto.getCommunity_userid());
        System.out.println(boarddto.getCommunity_title());
        System.out.println(boarddto.getCommunity_cont());
        System.out.println(boarddto.getCommunity_image());

        
        int result = Boarddao.boardWrite(boarddto);
        
        if(result>0) {
        	System.out.println("게시물 등록 성공");
        }else {
        	System.out.println("게시물 등록 실패");
        }
     

        


		
		
	}
	
	
	
	
}
