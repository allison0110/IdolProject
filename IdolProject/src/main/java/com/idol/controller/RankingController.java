package com.idol.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.web.bind.annotation.RequestMethod;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.idol.model.CommunityDAO;
import com.idol.model.CommunityDTO;
import com.idol.model.MemberDTO;
import com.idol.model.RankingDAO;
import com.idol.model.RankingDTO;

@Controller
public class RankingController {
	
	@Autowired
	private RankingDAO rankingDao;
	
	@Autowired
	private CommunityDAO communityDao;
	
	@RequestMapping("whole_ranking.do")
	public String whole(HttpServletRequest request, Model model) {
		
		List<RankingDTO> puList = new ArrayList<RankingDTO>();
		List<RankingDTO> meList = new ArrayList<RankingDTO>();
		List<RankingDTO> miList = new ArrayList<RankingDTO>();
		
		String keyword=request.getParameter("keyword");
		
		HashMap<String, String> map = new HashMap<String, String>();
		
		map.put("keyword", keyword);
		map.put("rnum", "5");
		
		//puList 제품구매횟수 meList 글작성 마일리지 miList 누적마일리지 
		puList = this.rankingDao.mostPurchase(map);
		meList = this.rankingDao.mostMessages(map);
		miList = this.rankingDao.mostMileage(map);
		
		
		
		model.addAttribute("pList", puList);
		model.addAttribute("meList", meList);
		model.addAttribute("miList", miList);
		
		
		return "ranking/whole_ranking_list";
	}
	
	@RequestMapping("detail_ranking.do")
	public String list(HttpServletRequest request, Model model) {
		
		List<RankingDTO> rankList = new ArrayList<RankingDTO>();
		String title = "";
		
		String keyword=request.getParameter("keyword");

		String key=request.getParameter("key");
		
		HashMap<String, String> map = new HashMap<String, String>();
		
		 map.put("keyword", keyword); 
		 map.put("rnum", "10");
		
		if(key == null) {
			return "ranking/detail_ranking_list";
		}
		
		if(key.equals("point")) {
			title = "Most Point";
			rankList = this.rankingDao.mostMileage(map);
		}else if(key.equals("message")) {
			title = "Most Message";
			rankList = this.rankingDao.mostMessages(map);
		}else if(key.equals("birth")) {
			title = "Congraturation!!";
			List<MemberDTO> memberList = this.rankingDao.todayBirth(map);
			for(int i=0; i<memberList.size(); i++) {
				RankingDTO rankingDto = new RankingDTO();
				rankingDto.setMember_no(memberList.get(i).getMember_no());
				rankingDto.setMember_image(memberList.get(i).getMember_image());
				rankingDto.setMember_introduction(memberList.get(i).getMember_introduction());
				rankingDto.setMember_nickname(memberList.get(i).getMember_nickname());
				rankingDto.setScore(0);
				
				rankList.add(rankingDto);
			}
		}else if(key.equals("purchase")) {
			title = "Most Purchase";
			rankList = this.rankingDao.mostPurchase(map);
		}else if(key.equals("referrals")) {
			title = "Most Referrals";
			rankList = this.rankingDao.mostReferrals(map);
		}else {
			
		}
		
		model.addAttribute("title", title);
		model.addAttribute("rankList", rankList);
		
		
		return "ranking/detail_ranking_list";
		
	}
	
	@RequestMapping(value = "/chat.do", method = RequestMethod.GET)
	public String view_chat(HttpServletRequest request, HttpServletResponse response, Model model) throws Exception {

		return "ranking/view_chat";
	}


}
