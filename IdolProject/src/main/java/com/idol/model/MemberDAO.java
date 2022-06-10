package com.idol.model;

import java.util.HashMap;

import org.springframework.web.multipart.MultipartHttpServletRequest;

public interface MemberDAO {

	int idcheck(String id);
	int insertMember(MemberDTO dto);
	int updateMember(MemberDTO dto);
	int login(MemberDTO dto);
	String findIdPwd(HashMap<String, String> params, String find);
	MemberDTO getMemInfo(String id);
	int profileUpload(MemberDTO dto);
	
}
