package com.idol.model;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class CelebDTO {
	
	private int celeb_no;
	private String celeb_name;
	private String celeb_realname;
	private String celeb_agency;
	private String celeb_dateofbirth;
	private String debutdate;
	private List<MultipartFile> celeb_pimage;
	private String celeb_group;
	private List<MultipartFile> celeb_gimage;
	
	
	
}
