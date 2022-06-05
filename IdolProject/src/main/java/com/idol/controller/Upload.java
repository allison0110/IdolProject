package com.idol.controller;

import java.io.File;
import java.io.IOException;
import java.sql.Savepoint;
import java.util.Calendar;
import java.util.Iterator;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

@Service // 스프링에서 비지니스 로직을 수행할 때 붙이는 애노테이션 
		 // 해당 Uplaod 라는 클래스는 비지니스 로직을 수행하는 클래스.
public class Upload {
	
	public boolean fileUpload(MultipartHttpServletRequest mRequest) {
		
		boolean isUplaod = false;
		
		String uploadPath = "C:\\Users\\JUNGHWAN\\Documents\\SourceTree_Final\\IdolProject\\src\\main\\webapp\\resources\\upload\\celeb\\";
				
		Calendar cal = Calendar.getInstance();
		
		int year = cal.get(Calendar.YEAR);
		
		int month = cal.get(Calendar.MONTH) + 1;
		
		int day =  cal.get(Calendar.DAY_OF_MONTH);
		
		// 업로드된 파일들의 이름 목록을 제공하는 메서드.
		
		Iterator<String> iterator = mRequest.getFileNames();
		
		while(iterator.hasNext()) {
			
			String uploadFileName = iterator.next();
			
			MultipartFile mFile = mRequest.getFile(uploadFileName);
			
			// 업로드한 파일의 이름을 구하는 메서드.
			String originalFileName = mFile.getOriginalFilename();
			
			
			// 실제 폴더를 만들어 보자
			// .......\\resources\\upload\\2022-05-30
			String homedir = uploadPath + year + "-" + month + "-" + day;
			
			File path1 = new File(homedir);
			
			if(!path1.exists()) {
				path1.mkdirs();
				
			}
			
			// 실제 파일을 만들어 보자.
			String saveFileName = originalFileName;
			
			if(saveFileName != null) {
				saveFileName = 
						System.currentTimeMillis() + "_" + saveFileName;
				
				// transferTo() : 파일 데이터를 지정한 폴더로 실제 저장시키는 메서드.
				try {
					
					// .......\\resources\\upload\\2022-05-30\\실제 파일
					File origin = new File(homedir + "/" + saveFileName);
					
					mFile.transferTo(origin);
					
					isUplaod = true;
					
				} catch (Exception e) {
					
				}
				
			}
			
		} // while문 end
		
		return isUplaod;
		
	}// fileUpload() end

}
