package com.idol.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.StringTokenizer;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.idol.model.CelebDAO;
import com.idol.model.CelebDTO;
import com.idol.model.MemberDAO;
import com.idol.model.MemberDTO;
import com.idol.model.MileageDAO;
import com.idol.model.MileageDTO;

//회원과 관련된 지시를 처리하는 컨트롤러 
//회원가입, 로그인, 마이페이지

@Controller
public class MemberController {

	@Autowired
	private MemberDAO dao;
	
	@Autowired
	private CelebDAO cdao;
	
	@Autowired
	private MileageDAO mdao;
	
	//회원가입 폼페이지 이동
	@RequestMapping("join.do")
	public String join(Model model){
		
		List<CelebDTO> cList = cdao.representList();
		model.addAttribute("celebList", cList);
		
		return "member/join";
	}
	
	// ******************** 회원가입 관련 **********************************
	
	//회원가입폼페이지 아이디중복체크 메서드
	@ResponseBody
	@RequestMapping(value="/idCheck.do", method=RequestMethod.POST)
	public int idCheck(HttpServletRequest request){
		

		String id = request.getParameter("member_id");
		
		
		int result = this.dao.idcheck(id);
		
		return result;
	}
	
	
	//회원가입폼에서  입력한 정보 DB에 저장 
	@RequestMapping("join_ok.do")
	public void joinOk(MemberDTO dto, HttpServletRequest request, HttpServletResponse response) throws IOException{
		
		//별명을 입력하지 않은 경우 아이디를 별명으로 저장
		if(dto.getMember_nickname() == null) {
			dto.setMember_nickname(dto.getMember_id());
		}
		
		//MemberDTO에 자동 저장되지 않고 폼페이지에서 넘어온 변수들 정리 
		String addr = request.getParameter("postnum").trim()+"|"+request.getParameter("addr1").trim()+"|"
					+request.getParameter("addr2").trim()+"|"+request.getParameter("addr3").trim();
		
		String phone = request.getParameter("phone1").trim()+request.getParameter("phone2").trim()
					+request.getParameter("phone3").trim();
		
		String birth = request.getParameter("year").trim()+"-"+request.getParameter("month").trim()+"-"
					+request.getParameter("day").trim();
		
		String fav = request.getParameter("checked_celeb"); //쉼표로 구분되어 저장됨ㄴ
		
		
		
		//MemberDTO에 저장 
		dto.setMember_address(addr);
		dto.setMember_phone(phone);
		dto.setMember_dateofbirth(birth);
		dto.setMember_favorite_celeb(fav);
		
		int check = dao.insertMember(dto);
		
		response.setContentType("text/html; charset=UTF-8");
		
		PrintWriter out = response.getWriter();
		
		HttpSession session = request.getSession();
		
		if(check>0) {
			
			//회원가입 완료 후, 자동 로그인 
			session.setAttribute("login_id", dto.getMember_id());
			
			out.println("<script>");
			out.println("alert('회원가입 완료되었습니다')");
			out.println("location.href='/controller/'"); //회원가입완료 후 메인화면으로 이동하기
			out.println("</script>");
		}else {
			out.println("<script>");
			out.println("alert('회원가입 실패')");
			out.println("history.back()");
			out.println("</script>");
		}
		
		//Printwriter를 안쓰면 (알림창안떠도되면
		//String타입메서드에 return "redirect:/" ; 로 쓰면 main.jsp로 갈 수 있음 
		
	}
	
	
	//************************** 로그인 관련 ************************************
	//로그인 폼페이지 이동 
	@RequestMapping("login.do")
	public String login() {
		return "member/login";
	}
	
	//로그인 완료 후 메인페이지 이동 
	@RequestMapping("login_ok.do")
	public void loginOk(MemberDTO dto, HttpServletResponse response, HttpServletRequest request) 
				throws IOException {
		
		int check = this.dao.login(dto);
		
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		HttpSession session = request.getSession();
		
		if(check > 0 ) {
			
			session.setAttribute("login_id", dto.getMember_id());
			
			out.println("<script>");
			out.println("alert('로그인 성공')");
			out.println("location.href='/controller/'");
			out.println("</script>");
			
		}else if(check == 0) {
			out.println("<script>");
			out.println("alert('없는 아이디입니다. 다시 확인해주세요')");
			out.println("history.back()");
			out.println("</script>");
			
		}else if(check == -1) {
			out.println("<script>");
			out.println("alert('비밀번호가 틀렸습니다. 다시 확인해주세요')");
			out.println("history.back()");
			out.println("</script>");
		}
	}
	
	//아이디,비밀번호찾기 폼 이동
	@RequestMapping("findIdPwd.do")
	public String findIdPwd() {
		return "member/idpwd_find";
	}
	
	//아이디,비밀번호찾기 확인 후 결과 화면 이동
	@RequestMapping("findIdPwd_ok.do")
	public String findId(MemberDTO dto, HttpServletRequest request, Model model) {
		
		String vf = request.getParameter("verification"); //인증방법(email, phone)
		String find = request.getParameter("find_word"); //구분(id, pwd)
		String phone = request.getParameter("phone1").trim()+request.getParameter("phone2").trim()
					+request.getParameter("phone3").trim();
		
		//핸드폰번호 저장하기
		dto.setMember_phone(phone);

		String result = "";
		
		//파라미터 저장 
		HashMap<String, String> params = new HashMap<String, String>();
		
		
		if(find.equals("id")) {//아이디찾기라면 
			if(vf.equals("email")) {
				params.put("member_name", dto.getMember_name());
				params.put("member_email",dto.getMember_email());
			}else if(vf.equals("phone")) {
				params.put("member_name", dto.getMember_name());
				params.put("member_phone",dto.getMember_phone());
			}else {
				System.out.println("이메일,휴대폰으로 인증 문제발생");
			}
		}else if(find.equals("pwd")) {//비밀번호 찾기라면
			if(vf.equals("email")) {
				params.put("member_id", dto.getMember_id());
				params.put("member_name", dto.getMember_name());
				params.put("member_email",dto.getMember_email());
			}else if(vf.equals("phone")) {
				params.put("member_id", dto.getMember_id());
				params.put("member_name", dto.getMember_name());
				params.put("member_phone",dto.getMember_phone());
			}else {
				System.out.println("이메일,휴대폰으로 인증 문제발생");
			}
		}else {
			System.out.println("아이디,비밀번호찾기 문제발생");
		}
		
		
		result = this.dao.findIdPwd(params, find);
		
		model.addAttribute("result", result); //아이디,비밀번호찾기 겨로가
		model.addAttribute("find", find);//아이디, 비밀번호 구분 
		
		
		return "member/idpwd_result";
	}
	
	
	//************************** 마이페이지 ************************************
	
	//마이페이지 이동 
	@RequestMapping("mypage.do")
	public String mypage(HttpSession session, Model model) {
		
		
		MemberDTO dto = this.dao.getMemInfo((String)session.getAttribute("login_id"));
		MileageDTO mdto = this.mdao.memMileage(dto);
		
		session.setAttribute("memInfo", dto);//회원정보 세션저장
		
		model.addAttribute("mileage", mdto); //회원에 대한 마일리지 정보
		
		return "member/mypage";
	}
	
	
	//로그아웃
	@RequestMapping("logout.do")
	public String logout(HttpSession session) {
		
		session.invalidate();
		
		return "main";
	}
	
	//마이페이지 - 회원정보 관리 폼으로 이동
	@RequestMapping("mySettings.do")
	public String mymanage(Model model, HttpSession session) {
		
		MemberDTO dto = this.dao.getMemInfo((String)session.getAttribute("login_id"));
		
		// '|'로 이어진 주소를 배열에 담기
		StringTokenizer st = null;
		
		
		String addr = dto.getMember_address();
		String fav = dto.getMember_favorite_celeb();
		
		st= new StringTokenizer(addr, "|");
		
		String [] mem_addr = new String[st.countTokens()];
		
		for(int i =0; i<mem_addr.length; i++){
			mem_addr[i]=st.nextToken();
		}
		
		model.addAttribute("mem_addr", mem_addr);
		
		// ','로 이어진 가수 번호 나눠 배열에 담기
		
		String[] mem_fav = null;
		
		if(fav != null) {
			
		st = new StringTokenizer(fav,",");
		
		 mem_fav= new String[st.countTokens()];
		
		for(int i =0; i<mem_fav.length; i++){
			mem_fav[i]=st.nextToken();
		}
		
		}
		model.addAttribute("mem_fav", mem_fav);
		
		List<CelebDTO> cList = cdao.representList();
		
		model.addAttribute("celebList", cList);
		
		model.addAttribute("memInfo", dto);
		
		
		return "member/mypage_settings";
		
	}
	
	//마이페이지 - 회원정보 수정
	@RequestMapping("member_update.do")
	public void memUpdate(MemberDTO dto, HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		//별명을 입력하지 않은 경우 아이디를 별명으로 저장
			if(dto.getMember_nickname() == null) {
					dto.setMember_nickname(dto.getMember_id());
		}
				
		//MemberDTO에 자동 저장되지 않고 폼페이지에서 넘어온 변수들 정리 
		String addr = request.getParameter("postnum").trim()+"|"+request.getParameter("addr1").trim()+"|"
							+request.getParameter("addr2").trim()+"|"+request.getParameter("addr3").trim();
				
		String phone = request.getParameter("phone1").trim()+request.getParameter("phone2").trim()
							+request.getParameter("phone3").trim();
			
		String fav = request.getParameter("checked_celeb"); //쉼표로 구분되어 저장됨
				
				
				
		//MemberDTO에 저장 
		dto.setMember_address(addr);
		dto.setMember_phone(phone);
		dto.setMember_favorite_celeb(fav);
		
		int check = this.dao.updateMember(dto);
		
		response.setContentType("text/html; charset=UTF-8");
		
		PrintWriter out = response.getWriter();
		
		if(check>0) {
			out.println("<script>");
			out.println("alert('회원 수정 성공')");
			out.println("location.href='mySettings.do'");
			out.println("</script>");
			
		}else {
			out.println("<script>");
			out.println("alert('회원 수정 실패')");
			out.println("location.href='history.back()'");
			out.println("</script>");
		}
		
	}
	
	@RequestMapping("editProfile.do")
	public void editProfile(MultipartHttpServletRequest multi, MemberDTO dto, HttpServletResponse response) throws IOException {
		
		int result =0;
		String uploadPath = "C:\\Users\\ayss3\\Documents\\FinalProject\\IdolProject\\src\\main\\webapp\\resources\\upload\\member_image";
				
				//업로드된 파일들의 이름 목록을 제공하는 메서드
				Iterator<String> it = multi.getFileNames();
		
				while(it.hasNext()) {
					
					String uploadFileName = it.next();
					
					MultipartFile mFile = multi.getFile(uploadFileName);
					
					//업로드한 파일의 이름을 구하는 메서드
					String originalFileName = mFile.getOriginalFilename();
					
					//실제 폴더 만들기 
					//회원번호 폴더가 생김
					String homedir = uploadPath +"/"+dto.getMember_no();
					
					File path1 = new File(homedir);
					
					//폴더가 존재하지 않으면 폴더 만들어주기
					if(! path1.exists()) {
						path1.mkdir();
					}
					
					//실제 파일만들기
					String saveFileName = originalFileName;
					
					dto.setMember_image(saveFileName);
					
					result = this.dao.profileUpload(dto);
					
					try {
						
						File origin= new File(homedir+"/"+saveFileName);
						mFile.transferTo(origin);
						
						
					} catch (Exception e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					} 
					
				}
				
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter out = response.getWriter();
				
				if(result>0) {
					out.println("<script>");
					out.println("alert('프로필 사진 업로드 성공')");
					out.println("location.href='mypage.do'");
					out.println("</script>");
					
				}else {
					out.println("<script>");
					out.println("alert('프로필 사진 업로드 실패')");
					out.println("history.back()");
					out.println("</script>");
				}
	}
	
	//마이페이지 - 구매내역페이지 이동
	@RequestMapping("myOrderlist.do")
	public String myorderlist() {
		
		return"member/mypage_orderList" ;
	}
	
	
	//마이페이지 - 문의내역페이지 이동
	@RequestMapping("myQnalist.do")
	public String qnaist() {
		
		return "member/mypage_qnaList";
	}
}
