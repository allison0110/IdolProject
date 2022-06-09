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
import java.util.StringTokenizer;

import javax.annotation.processing.FilerException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.MultipartRequest;

import com.idol.model.AdminDAO;
import com.idol.model.AdminDTO;
import com.idol.model.CelebDTO;
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
	
	
	// 관리자 로그인 페이지 접속
	@RequestMapping("admin_login.do")
	public String adminLogin() {
		return "admin/admin_login";
	}
	
	// 관리자 메인 페이지 접속
	@RequestMapping("admin_main.do")
	public String adminMain() {
		
		return "admin/admin_main";
	}
	
	// 관리자 로그인 확인 
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
	
	
	//가수 등록 페이지 접속
	@RequestMapping("admin_celeb_insert.do")
	public String adminCelebInsert(Model model) {
		
		// 가수 전체 리스트 불러오기
		List<CelebDTO> cList = this.dao.selectCelebList();
		// 그룹 이름 리스트 불러오기
		List<CelebDTO> gList = this.dao.selectGroupList();
		
		model.addAttribute("celebList", cList);
		
		model.addAttribute("groupList", gList);
		
		return "admin/admin_celeb_insert";
	}
	
	// 가수 등록 완료
	@RequestMapping("admin_celeb_insert_ok.do")
	public void celebInsertOk(MultipartHttpServletRequest mRequest, CelebDTO dto, 
			Model model, HttpServletResponse response) throws IOException {
		
		Iterator<String> iterator = mRequest.getFileNames();
		
		String uploadFileName = iterator.next();
		
        List<MultipartFile> fileList = mRequest.getFiles(uploadFileName);
        
        //String src = mRequest.getParameter("src");
        
        //System.out.println("src value : " + src);

        String path = "C:\\Users\\JUNGHWAN\\Documents\\SourceTree_Final\\IdolProject\\src\\main\\webapp\\resources\\upload\\celeb\\";

        String dbFileName = "";
        
        for (MultipartFile mFile : fileList) {
        	
            String originFileName = mFile.getOriginalFilename(); // 원본 파일 명
                  
            long fileSize = mFile.getSize(); // 파일 사이즈

            System.out.println("originFileName : " + originFileName);
            
            System.out.println("fileSize : " + fileSize);

            String safeFile = path + System.currentTimeMillis() + originFileName;
            
            dbFileName += System.currentTimeMillis() + originFileName + "|";
            
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
        
        // 가수 개인 이미지들 등록
        dto.setCeleb_pimage(dbFileName);
        int check = this.dao.insertCeleb(dto);
        
        response.setContentType("text/html; charset=UTF-8");
        
        PrintWriter out = response.getWriter();
        
        System.out.println("check.val " + check);

        System.out.println("dto name " + dto.getCeleb_name());

        System.out.println("dto no " + dto.getCeleb_no());
        
        if(check > 0) {
        	out.println("<script>");
        	// 가수 등록 후 오른쪽 파트로 정보 넘김 임시로 이름을 했지만 등록 번호로 넘기는 걸로 바꾸기 
        	out.println("location.href='admin_insertCeleb_next.do?name="+dto.getCeleb_name() +"'");
        	out.println("</script>");
        }else {
        	out.println("<script>");
        	out.println("alert('실패 :(')");
        	out.println("history.back()");
        	out.println("</script>");
        }
        
		
	}
	
	// 가수 등록 후 해당 가수 상세내역 불러오기 (오른쪽 파트로)
	@RequestMapping("admin_insertCeleb_next.do")
	public String insertCelebNext(@RequestParam("name") String celeb_name, Model model) {
		
		CelebDTO dto = this.dao.getCelebContByName(celeb_name);
		
		model.addAttribute("contByname", dto);
		
		String str = dto.getCeleb_pimage();
				
		System.out.println("str : " + str);
		
		StringTokenizer tokened = new StringTokenizer(str, "|");
		
		String[] arrtokened = new String[tokened.countTokens()];
		
		for(int i = 0; i < arrtokened.length; i++) {
			arrtokened[i] = tokened.nextToken();
			System.out.println("arrtokened.length : " + arrtokened.length);
			System.out.println(arrtokened[i]);

		}
	
		model.addAttribute("arrtokened", arrtokened);
		
		
		//System.out.println("그룹 이미지 등록시 가수 번호 : " + dto.getCeleb_no());
		
		return "admin/admin_celeb_insert";
	}
	
	// 가수 등록 후 그룹이면 그룹 이미지도 업로드 하는 로직
	@RequestMapping("celeb_gimage_update.do")
	public void celebGimageUpdate(MultipartHttpServletRequest mRequest, HttpServletRequest request, 
			CelebDTO dto, HttpServletResponse response) throws IOException {
		
		Iterator<String> iterator = mRequest.getFileNames();
		
		String uploadFileName = iterator.next();
		
        List<MultipartFile> fileList = mRequest.getFiles(uploadFileName);
        
        //String src = mRequest.getParameter("src");
        
        //System.out.println("src value : " + src);

        String path = "C:\\Users\\JUNGHWAN\\Documents\\SourceTree_Final\\IdolProject\\src\\main\\webapp\\resources\\upload\\celeb\\";

        String dbFileName = "";
        
        System.out.println("===========================");
        
        for (MultipartFile mFile : fileList) {
        	
            String originFileName = mFile.getOriginalFilename(); // 원본 파일 명
                  
            long fileSize = mFile.getSize(); // 파일 사이즈
            
           

            System.out.println("originFileName : " + originFileName);
            
            System.out.println("fileSize : " + fileSize);

            String safeFile = path + System.currentTimeMillis() + originFileName;
            
            dbFileName += System.currentTimeMillis() + originFileName + "|";
            
            try {
            	
            	mFile.transferTo(new File(safeFile));
       	
            } catch (Exception e) {
               
            } 
        } // for() end 
		
        dto.setCeleb_gimage(dbFileName);
        
        System.out.println("no. : " + dto.getCeleb_no());
        
        int check = this.dao.updateGroupImage(dto);
        
        response.setContentType("text/html; charset=UTF-8");
        
        System.out.println("check.val " + check);
        
        PrintWriter out = response.getWriter();
        
        System.out.println("dbFileName : " + dbFileName);
        
        System.out.println(dto.getCeleb_name());
        
        System.out.println("===========================");
     
        if(check > 0) {
        	out.println("<script>");
        	out.println("location.href='admin_insertCeleb_next.do?name="+ dto.getCeleb_name() +"'");
        	out.println("</script>");
        }else {
        	out.println("<script>");
        	out.println("alert('실패 :(')");
        	out.println("history.back()");
        	out.println("</script>");
        }
        
	}
	
	// 가수 전체 리스트 불러오기 
	@RequestMapping("admin_celeb_list.do")
	public String celebList(Model model) {
		
		List<CelebDTO> list = this.dao.celebList();
		
		model.addAttribute("celecList", list);
		
		return "admin/admin_celeb_list";
	}
	
	// 가수 상세 정보 페이지 이동 from list
	@RequestMapping("admin_celeb_content.do")
	public String celebContent(@RequestParam("no") int no, Model model) {
		
		CelebDTO dto = this.dao.getCelebContByNo(no);
		
		String str = dto.getCeleb_pimage();
		
		System.out.println("str : " + str);
		
		StringTokenizer tokened = new StringTokenizer(str, "|");
		
		String[] arrtokened = new String[tokened.countTokens()];
		
		for(int i = 0; i < arrtokened.length; i++) {
			
			arrtokened[i] = tokened.nextToken();
			
			System.out.println("arrtokened.length : " + arrtokened.length);
			
			System.out.println(arrtokened[i]);

		}
		System.out.println("dtoPimages : " + dto.getCeleb_pimage());
		model.addAttribute("arrtokened", arrtokened);
		
		model.addAttribute("celebContByNo", dto);
		
		
		return "admin/admin_celeb_content";
	}
	
	@RequestMapping("celeb_delete.do")
	public void celebDelete(@RequestParam("no") int no, 
			@RequestParam("img") String img, HttpServletResponse response) throws IOException {
		
		
		int check = this.dao.deleteCeleb(no);
		
		response.setContentType("text/html; charset=UTF-8");
		
		PrintWriter out = response.getWriter();
		
		if(check > 0) {

			String path = "C:\\Users\\JUNGHWAN\\Documents\\SourceTree_Final\\IdolProject\\src\\main\\webapp\\resources\\upload\\celeb\\";
		
			System.out.println("img : " + img);
			
			StringTokenizer tokenizer = new StringTokenizer(img, "|");
					
			String[] tokenList = new  String[tokenizer.countTokens()];
			
			for(int i = 0; i < tokenList.length; i ++) {
				
				tokenList[i] = tokenizer.nextToken();
				
				System.out.println("tokenList : " + tokenList);
				
				File file = new File(path + tokenList[i]);
				
				file.delete();
			}
		
			
			
			this.dao.updateSequen(no);
			
			out.println("<script>");
			out.println("alert('삭제 성공 :)')");
			out.println("location.href='admin_celeb_list.do'");
			out.println("</script>");
			
		}else {
			
			out.println("<script>");
			out.println("alert('삭제 실패 :(')");
			out.println("history.back()");
			out.println("</script>");
		}
		
		
	} // end of celebDelete()
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	// 테스트
	@RequestMapping("test.do")
	public String test() {
		return "admin/test_insert";
	}
	
	
	// 테스트
	@RequestMapping("test5.do")
	public String uploadOk5(MultipartHttpServletRequest mRequest, Model model, TestDTO dto) {
		
		
		String uploadPath = "C:\\Users\\JUNGHWAN\\Documents\\SourceTree_Final\\IdolProject\\src\\main\\webapp\\resources\\upload\\celeb\\";
		
		Calendar cal = Calendar.getInstance();
		
		int year = cal.get(Calendar.YEAR);
		
		int month = cal.get(Calendar.MONTH) + 1;
		
		int day =  cal.get(Calendar.DAY_OF_MONTH);
		
		// 업로드된 파일들의 이름 목록을 제공하는 메서드.
		
		Iterator<String> iterator = mRequest.getFileNames();
		
		String dbFileName = "";
        String dbFileName2 = "";
				
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
				
				dbFileName += saveFileName;
				
				// transferTo() : 파일 데이터를 지정한 폴더로 실제 저장시키는 메서드.
				try {
					
					// .......\\resources\\upload\\2022-05-30\\실제 파일
					File origin = new File(homedir + "/" + saveFileName);
					
					mFile.transferTo(origin);
					
					
				} catch (Exception e) {
					
				}
				
			}
			
		} // while문 end
		
		
		 dto.setGood(dbFileName);
	    
	    	
	     this.dao.insertTest(dto);
		
		
		return "admin/admin_main";
	}
	
	
	
	
	//테스트
	@RequestMapping("test3.do")
	public String test3(MultipartHttpServletRequest mRequest, TestDTO dto) {
		
		Iterator<String> iterator = mRequest.getFileNames();
		
		String uploadFileName = iterator.next();
		
        List<MultipartFile> fileList = mRequest.getFiles(uploadFileName);
        
       // String src = mRequest.getParameter("src");
        
        //System.out.println("src value : " + src);

        String path = "C:\\Users\\JUNGHWAN\\Documents\\SourceTree_Final\\IdolProject\\src\\main\\webapp\\resources\\upload\\celeb\\";
        System.out.println("list size:"+fileList.size());
        String dbFileName = "";
        String dbFileName2 = "";
        int count =0;
        
        for (MultipartFile mFile : fileList) {
        	
        	System.out.println("count:"+count);
        	
            String originFileName = mFile.getOriginalFilename(); // 원본 파일 명
                  
            long fileSize = mFile.getSize(); // 파일 사이즈

            System.out.println("originFileName : " + originFileName);
            
            System.out.println("fileSize : " + fileSize);

            String safeFile = path + System.currentTimeMillis() + originFileName;
            
            if(count <1) {
            
            dbFileName += originFileName + "/";
            }else {
            	dbFileName2 += originFileName+"/";
            }
            
            
            try {
            	
            	mFile.transferTo(new File(safeFile));
            	
            	
            	
            } catch (IllegalStateException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            } catch (IOException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
            count++;
        }
        
        System.out.println("======================");
        
        dto.setGood(dbFileName);
        dto.setGood2(dbFileName2);
    	
        this.dao.insertTest(dto);
		
		
		
		return "admin/admin_main";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
} // AdminController end
