package com.idol.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.idol.model.BoardDAO;
import com.idol.model.BoardDTO;

@Controller
public class CommunityController {

	@Autowired
	private BoardDAO Boarddao;
	
	// 커뮤니티 게시물 전체리스트 페이지로 이동
	@RequestMapping("community_boardList.do")
	public String community_boardList(Model model) {
		
		List<BoardDTO> boardlist =  Boarddao.getAllBoardList();
		
		model.addAttribute("boardList", boardlist);
		
		return "community/community_boardList";
	}
	
	
	// 커뮤니티 게시물 작성 페이지로 이동
	@RequestMapping("community_boardwrite.do")
	public String community_boardwrite() {
		
		return "community/community_boardWrite";
		
	}
	
}
