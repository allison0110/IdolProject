package com.idol.controller;

import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		
		//List<ImageDTO> list = this.dao.getImagesList();
		
		
		//for(int i=0; i<10; i++) {
		//	ImagesDTO imagesDTO = new ImagesDTO();
		//	int visible = i%1;
		//	if(visible == 1) {
		//		String imagePath = "C:\Users\82102\Documents\IdolProject1\IdolProject\src\main\webapp\resources\\upload\images\";
		//		String imageLink = "#idol_" + i;
				
	//			int priority = i;
				
		//		imageDTO.setImage_path(imagePath);
		//		imageDTO.setImage_link(imageLink);
		//		imageDTO.setImage_priority(priority);
		//		imageDTO.setImage_visible(visible);
				
		//		list.add(imageDTO);
				
		//	}

	//	}
	//	model.addAttribute("images",list);
		
		
		return "main";
	}
	
}
