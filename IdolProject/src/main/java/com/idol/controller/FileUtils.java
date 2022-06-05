package com.idol.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.logging.Logger;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

@Service
public class FileUtils {

	String filePath = "C:\\Users\\JUNGHWAN\\Documents\\SourceTree_Final\\IdolProject\\src\\main\\webapp\\resources\\upload\\celeb\\";
	
	
	public List<Map<String, Object>> fileUpload(Map<String, Object> map, HttpServletRequest request){
		
		MultipartHttpServletRequest mRequest = (MultipartHttpServletRequest) request;
		
		String originalName = null;
		String originalExtension = null;
		String storedName = null;
		
		MultipartFile mulFile = null;
		
		Iterator<String> iterator = mRequest.getFileNames();
		
		List<Map<String, Object>> fileList = new ArrayList<Map<String,Object>>();
		
		Map<String, Object> fileMap = null;
		
		String board_IDX = map.get("IDX").toString();
		
		File file = new File(filePath);
		
		if(file.exists() == false) {
			file.mkdirs();
		}
		
		while(iterator.hasNext()) {
			mulFile = mRequest.getFile(iterator.next());
			
			if(mulFile.isEmpty()==false) {
				originalName = mulFile.getOriginalFilename();
				originalExtension = mulFile.getOriginalFilename().substring(originalName.lastIndexOf("."));
				
				try {
					mulFile.transferTo(file);
				} catch (IllegalStateException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
				fileMap = new HashMap<String, Object>();
				
				fileMap.put(board_IDX, board_IDX);
				fileMap.put(originalName, originalName);
				fileList.add(fileMap);
						
						
			}
		}
		return fileList;
	}
	
}
