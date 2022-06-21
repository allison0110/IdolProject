package com.idol.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.idol.model.EventDTO;
import com.idol.model.PageDTO;
import com.idol.model.UserEventDAO;

@Controller
public class EventController {

	@Autowired
	private UserEventDAO userEventDao;
	private final int rowsize = 4;
	private int totalRecord = 0;
	
	@RequestMapping("event_list.do")
	public String list(HttpServletRequest request, Model model) {
		int page; //현재 페이지 변수
		
		if(request.getParameter("page")!=null) {
			page = Integer.parseInt(request.getParameter("page"));
		}else {
			page = 1;	//처음으로 게시물 전체 목록 태그를 선택한 경우
		}
		
		
		totalRecord = this.userEventDao.getListCount();
				
		PageDTO pageDto = new PageDTO(page, rowsize, totalRecord);
		
		String bid = request.getParameter("board_id");
		String cid = request.getParameter("category_id");

		
		List<EventDTO> noticeList = new ArrayList<EventDTO>();
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("category_type", cid);
		
		if (bid.equals("1")) {
			noticeList.addAll(this.userEventDao.eventList(map));
		} else if (bid.equals("1001")) {
			noticeList.addAll(this.userEventDao.concertList(map));
		}
		
		//셀럽이벤트 - 진행중 이벤트
		//select * from notice where notice_type='celeb' and notice_enddate is null;
		//(null이 아닐 때 is not null)
		
		model.addAttribute("noticeList", noticeList);
		model.addAttribute("Paging", pageDto);
		
		return "event/user_event_list";
	}
	@RequestMapping("event_cont.do")
	public String cont(@RequestParam("no") int no, @RequestParam("page") int nowPage, Model model) {
		
		this.userEventDao.readCount(no);
		
		EventDTO dto = this.userEventDao.eventCont(no);

		model.addAttribute("Cont", dto);
		model.addAttribute("Page", nowPage);
		
		return "event/user_event_cont";
	}
}
