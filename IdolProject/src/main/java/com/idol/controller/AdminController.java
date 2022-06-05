package com.idol.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collection;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.annotation.processing.FilerException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.idol.model.AdminDAO;
import com.idol.model.AdminDTO;
import com.idol.model.HappyDTO;
import com.idol.model.TestDTO;

@Controller
public class AdminController {

	@Autowired
	private AdminDAO dao;
	
	@Autowired
	private Upload uplaod;
	
	@Autowired
	private MultiUpload multiUpload;
	
	@RequestMapping("admin_login.do")
	public String adminLogin() {
		
		return "admin/admin_login";
		
	}
	
	@RequestMapping("admin_login_ok.do")
	public void adminLoginOk(@RequestParam("admin_id") String id, 
			@RequestParam("admin_pwd") String pwd, HttpServletResponse response, 
				HttpServletRequest request) throws IOException {
		
		
		AdminDTO dto = this.dao.getAdminCont(id);
		
		response.setContentType("text/html; charset=UTF-8");
		
		PrintWriter out = response.getWriter();
		
		HttpSession session = request.getSession();
		
		
		if(dto.getAdmin_id().equals(id)) {   // id가 존재한 경우
			
			if(dto.getAdmin_pwd().equals(pwd)) {
					
				session.setAttribute("admin_id", dto.getAdmin_id());
				session.setAttribute("admin_pwd", dto.getAdmin_pwd());
				session.setAttribute("admin_name", dto.getAdmin_name());
				session.setAttribute("admin_email", dto.getAdmin_email());
				session.setAttribute("admin_date", dto.getAdmin_date());
							
				out.println("<script>");
				out.println("alert('로그인 성공 :)')");
				out.println("location.href='admin_main.do'");
				out.println("</script>");
				
			}else {                             // 비밀번호가 틀렸을 경우
				
				out.println("<script>");
				out.println("alert('비밀 번호가 틀립니다 :(')");
				out.println("history.back()");
				out.println("</script>");
				
			}
						
		}else {                               // id가 존재하지 않는 경우 (불일치)
			
			out.println("<script>");
			out.println("alert('아이디가 존재하지 않거나 일치 하지 않습니다 :(')");
			out.println("history.back()");
			out.println("</script>");
		}
		
	} //adminLoginOk() end 
	
	@RequestMapping("admin_main.do")
	public String adminMain() {
		return "admin/admin_main";
	}
	
	@RequestMapping("admin_celeb_insert.do")
	public String adminCelebInsert() {
		return "admin/admin_celeb_insert";
	}
	
	
	@RequestMapping("test.do")
	public String test() {
		return "admin/test_insert";
	}
	
	@RequestMapping("test1.do")
	public String insertTest(Map<String, Object> map, MultipartHttpServletRequest mRequest, 
			HttpServletRequest request) {
				
		String uplaodPath = "C:\\Users\\JUNGHWAN\\Documents\\SourceTree_Final\\IdolProject\\src\\main\\webapp\\resources\\upload\\celeb\\";
		
		Iterator<String> iterator =  mRequest.getFileNames();
		
		MultipartFile multipartFile = null;
		
		while(iterator.hasNext()) {
		
			multipartFile = mRequest.getFile(iterator.next());
			
			if(multipartFile.isEmpty() == false) {
			
				System.out.println("name : " + multipartFile.getName()); 
				System.out.println("fileName : " + multipartFile.getOriginalFilename()); 
				System.out.println("size : " + multipartFile.getSize()); 
			}
			
			String originFileName = multipartFile.getOriginalFilename();
			
			
			
			if(originFileName != null) {
				
				
				try {
					
					File origin = new File(uplaodPath + "/" + originFileName);

					multipartFile.transferTo(origin);
					
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
			
		}
		return "admin/admin_main";
	}
	
	@RequestMapping("test2.do")
	public String test2(MultipartHttpServletRequest mRequest, Model mode) {
		
		
		String uploadPath = "C:\\Users\\JUNGHWAN\\Documents\\SourceTree_Final\\IdolProject\\src\\main\\webapp\\resources\\upload\\celeb";
		
		Iterator<String> iterator = mRequest.getFileNames();
		
		while(iterator.hasNext()) {
			
			String uploadFileName = iterator.next();
			
			MultipartFile mFile = mRequest.getFile(uploadFileName);
			
			String originalFileName = mFile.getOriginalFilename();
			
			String homedir = uploadPath;
			
			File path1 = new File(homedir);
			
			if(!path1.exists()) {
				path1.mkdirs();
			}
			
			String saveFileName = originalFileName;
			
			if(saveFileName != null) {
				
				
				try {
					File origin = new File(homedir + "/" + saveFileName);

					mFile.transferTo(origin);
					
				} catch (IllegalStateException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			
			
		} // while end
		
		return "admin/admin_main";
	}
		
		
	@RequestMapping("test3.do")
    public String test3(MultipartHttpServletRequest mRequest, TestDTO dto) {
		
		
		Iterator<String> iterator = mRequest.getFileNames();
		
		String uploadFileName = iterator.next();
		
        List<MultipartFile> fileList = mRequest.getFiles(uploadFileName);
        
        String src = mRequest.getParameter("src");
        
        System.out.println("src value : " + src);

        String path = "C:\\Users\\JUNGHWAN\\Documents\\SourceTree_Final\\IdolProject\\src\\main\\webapp\\resources\\upload\\celeb\\";

        String tempName = "";
        
        for (MultipartFile mFile : fileList) {
        	
            String originFileName = mFile.getOriginalFilename(); // 원본 파일 명
                  
            long fileSize = mFile.getSize(); // 파일 사이즈

            System.out.println("originFileName : " + originFileName);
            
            System.out.println("fileSize : " + fileSize);

            String safeFile = path + System.currentTimeMillis() + originFileName;
            
            tempName += originFileName + "/";
            
            try {
            	
            	mFile.transferTo(new File(safeFile));
            	
            	
            	
            } catch (IllegalStateException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            } catch (IOException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
        }
        
        
        dto.setGood(tempName);
    	
        this.dao.insertTest(dto);
        
        return "admin/admin_main";
    }
	
	@RequestMapping("test4.do")
	public String uploadOk(MultipartHttpServletRequest mRequest, Model model, TestDTO dto) {
		
		
		if(uplaod.fileUpload(mRequest)) {
			
			model.addAttribute("test", "성공");
		}else {
			
			
		}

		return "admin/admin_main";
	}
	
	@RequestMapping("test5.do")
	public String uploadOk5(MultipartHttpServletRequest mRequest, Model model, TestDTO dto) {
		
		
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
					
					dto.setGood(saveFileName);
					
					this.dao.insertTest(dto);
					
				} catch (Exception e) {
					
				}
				
			}
			
		} // while문 end

		
		
		return "admin/admin_main";
	}
	
	
	
	@RequestMapping("test6.do")
	public String test6(MultipartHttpServletRequest mRequest, HappyDTO dto) throws FilerException {
		
		boolean flag = false;
		
		String uploadPath = "C:\\Users\\JUNGHWAN\\Documents\\SourceTree_Final\\IdolProject\\src\\main\\webapp\\resources\\upload\\celeb\\";
		
		Iterator<String> iterator = mRequest.getFileNames();
		
		System.out.println("mRequest.getfileName : " + iterator); 
		
		MultipartFile mFile = null;
		
		List<Map<String, Object>> list = new ArrayList<Map<String,Object>>();
		
		Map<String, Object> listMap = null;
		
		while(iterator.hasNext()) {
			
			mFile = mRequest.getFile(iterator.next());
			
			if(mFile.isEmpty() == false) {
				
				// 오리진 파일 이름
				
				String originName = mFile.getOriginalFilename();
				
				System.out.println("multipartFIle.getName() : " + mFile.getName());

				System.out.println("multipartFIle.getOriginFileNmae() : " + originName);
				
				// 디비에 저장할 파일 경로 + 이름
				
				File path = new File(uploadPath); 
				
				if(!path.exists()) {
					path.mkdirs();
				}
				
				// 실제 파일 만들기
				
				String saveFileName = originName;
				
				if(saveFileName != null) {
					saveFileName = System.currentTimeMillis() + "_" + saveFileName;
					
				}
				
				File dest = new File(uploadPath + "/" + saveFileName);

				try {
					
					
					mFile.transferTo(dest);
					
					flag = true;
					
				} catch (Exception e) {
					
				} 
				
				listMap = new HashMap<String, Object>();
				
				listMap.put("originName", originName);
				
				listMap.put("fileName", dest.getName());
				
				list.add(listMap);
				
			} // the end of if 
			
		} // the end of while
		
		if(flag == false) {
			throw new FilerException("파일 저장을 실패하였습니다 :(");
		}
		
		
		this.dao.insertHappy(dto);
		
		return "admin/admin_main";
    }
	
	
	
	
	
} // AdminController end
