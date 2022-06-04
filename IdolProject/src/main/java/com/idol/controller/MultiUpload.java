package com.idol.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

@Service
public class MultiUpload {
	
	public boolean mUpload(MultipartHttpServletRequest mRequest) {
		
		boolean isMultiUplaod = false;
		
        List<MultipartFile> fileList = mRequest.getFiles("file");
        
        String src = mRequest.getParameter("src");
        
        System.out.println("src value : " + src);
        
        String path = "C:\\Users\\JUNGHWAN\\Documents\\SourceTree_Final\\IdolProject\\src\\main\\webapp\\resources\\upload\\celeb\\";

        for (MultipartFile mf : fileList) {
        	
            String originFileName = mf.getOriginalFilename(); // 원본 파일 명
            
            long fileSize = mf.getSize(); // 파일 사이즈

            System.out.println("originFileName : " + originFileName);
            
            System.out.println("fileSize : " + fileSize);

            String safeFile = path + originFileName;
            
            try {
                mf.transferTo(new File(safeFile));
                
            } catch (Exception e) {
                e.printStackTrace();
            } 
        }

        return isMultiUplaod;
    }

}
