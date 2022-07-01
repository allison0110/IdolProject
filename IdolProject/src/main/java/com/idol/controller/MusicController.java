package com.idol.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.StringTokenizer;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.idol.model.CelebDAO;
import com.idol.model.CelebDTO;
import com.idol.model.MusicDAO;
import com.idol.model.MusicDTO;

@Controller
public class MusicController {
	
	@Autowired
	private CelebDAO celebDAO;
	@Autowired
	private MusicDAO musicDAO;
	
	@RequestMapping("artist_list.do")
	public String artist_list(@RequestParam("group") String group, Model model) {
		
		List<CelebDTO> artistList = this.celebDAO.getArtistList(group);
		
		model.addAttribute("artistList", artistList);
		
		return "music/artist_list";
	}
	
	@RequestMapping("artist_content.do")
	public String artist_content(HttpServletRequest request,
			@RequestParam("no") int no, Model model) {
		
		String type;   // 보여줄 화면 ( 상세정보 / 곡 / 앨범 / 포토 )
		
		if(request.getParameter("type") != null) {
			type = request.getParameter("type");
		}else {
			type = "detail";    // 처음으로 들어올 경우
		}
		
		CelebDTO dto = this.celebDAO.getCelebInfo(no);
		
		List<CelebDTO> artistList = this.celebDAO.getArtistList(dto.getCeleb_group());
		
		List<MusicDTO> musicList = new ArrayList<MusicDTO>();
		
		if(dto.getCeleb_group().equalsIgnoreCase("solo")) {
			musicList = this.musicDAO.getMusicList_solo(dto.getCeleb_name());
		}else {
			musicList = this.musicDAO.getMusicList_group(dto.getCeleb_group());
		}
		
		model.addAttribute("dto", dto);
		model.addAttribute("type", type);
		model.addAttribute("artistList", artistList);
		model.addAttribute("musicList", musicList);
		
		return "music/artist_content";
	}
	
	@RequestMapping("music_content.do")
	public String music_content(
			@RequestParam("no") int no, Model model) {
		
		MusicDTO dto = this.musicDAO.getMusicCont(no);
		
		String composer = dto.getMusic_composer();
		StringTokenizer st = new StringTokenizer(composer, ",");
		String[] array = new String[st.countTokens()];
		List<String> composerList = new ArrayList<String>();
		
		for(int j=0; j<array.length; j++){
			array[j] = st.nextToken();
		}
		for(int i=0; i<array.length; i++) {
			composerList.add(array[i].trim());
		}
		
		String lyricst = dto.getMusic_lyricst();
		StringTokenizer st2 = new StringTokenizer(lyricst, ",");
		String[] array2 = new String[st2.countTokens()];
		List<String> lyricstList = new ArrayList<String>();
		
		for(int j=0; j<array2.length; j++){
			array2[j] = st2.nextToken();
		}
		for(int i=0; i<array2.length; i++) {
			lyricstList.add(array2[i].trim());
		}
		
		List<CelebDTO> artistList = this.celebDAO.getCelebList();
		
		System.out.println(composerList.size());
		System.out.println(artistList.size());
		for(int i=0; i<composerList.size();i++) {
			for(int j=0; j<artistList.size(); j++) {
				System.out.println(composerList.get(i).substring(0,2));
				System.out.println(artistList.get(j).getCeleb_name().substring(0,2));
				System.out.println();
			}
		}
		
		model.addAttribute("dto", dto);
		model.addAttribute("composerList", composerList);
		model.addAttribute("lyricstList", lyricstList);
		model.addAttribute("artistList", artistList);
		
		return "music/music_content";
	}
}
