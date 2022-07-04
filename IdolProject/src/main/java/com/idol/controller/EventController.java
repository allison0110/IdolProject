package com.idol.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.StringTokenizer;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.HandlerMapping;
import org.springframework.web.util.UrlPathHelper;

import com.idol.model.EventDTO;
import com.idol.model.PageDTO;
import com.idol.model.UserEventDAO;

//희원님
@Controller
public class EventController {

	@Autowired
	private UserEventDAO userEventDao;
	private final int rowsize = 2;
	private int totalRecord = 0;
	
	/* **********************************희원님************************************ */
	
	@RequestMapping("event_list.do")
	public String list(HttpServletRequest request, Model model) {
int page; //현재 페이지 변수
		
		if(request.getParameter("page")!=null) {
			page = Integer.parseInt(request.getParameter("page"));
		}else {
			page = 1;	//처음으로 게시물 전체 목록 태그를 선택한 경우
		}
		
		String bid = request.getParameter("board_id");
		String cid = request.getParameter("category_id");
		
		HashMap<String, String> total = new HashMap<String, String>();
		
		String notice_type = "";
		
		if(bid.equals("1")) {
			notice_type="CELEB";
		}else if(bid.equals("1001")) {
			notice_type="CONCERT";
		}
		
		total.put("notice_type", notice_type);
		total.put("category_type", cid);
		
		totalRecord = this.userEventDao.getListCount(total);
		
		PageDTO pageDto = new PageDTO(page, rowsize, totalRecord);

		List<EventDTO> noticeList = new ArrayList<EventDTO>();
		HashMap<String, Object> map = new HashMap<String, Object>();

		
		map.put("category_type", cid);
		map.put("pageDto", pageDto); 
		
		
		
		if (bid.equals("1")) {
			noticeList.addAll(this.userEventDao.eventList(map));
		} else if (bid.equals("1001")) {
			noticeList.addAll(this.userEventDao.concertList(map));
			
		}
		
		for(int i=0; i<noticeList.size(); i++) {
			StringTokenizer eventTokenizer = new StringTokenizer(noticeList.get(i).getNotice_image(),"|");
			String st = eventTokenizer.nextToken();
			noticeList.get(i).setNotice_image(st);
		}	
		
		model.addAttribute("noticeList", noticeList);
		model.addAttribute("bid", bid);
		model.addAttribute("cid", cid);
		model.addAttribute("Paging", pageDto);
		
		
		return "event/user_event_list";
		
	}
	
	@RequestMapping("event_cont.do")
	
	public String cont(@RequestParam("no")int no, @RequestParam("page")int nowPage, Model model ) {
		
		this.userEventDao.readCount(no);
		
		EventDTO dto = this.userEventDao.eventCont(no);
		
		String image = dto.getNotice_image();
		String[] images = image.split("\\|");
		List<String> temp_images = new ArrayList<String>();
		
		for (int i = 1; i < images.length; i++) {
			temp_images.add(images[i]);
		}
		
		dto.setNotice_images(temp_images);
		
		model.addAttribute("Cont", dto);
		model.addAttribute("Page", nowPage);
		
		return "event/user_event_cont";
	}
	
	
	
}