package com.idol.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.StringTokenizer;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.idol.model.CelebDAO;
import com.idol.model.CelebDTO;
import com.idol.model.CommunityDAO;
import com.idol.model.CommunityDTO;
import com.idol.model.FollowDAO;
import com.idol.model.FollowDTO;
import com.idol.model.GroupDAO;
import com.idol.model.GroupDTO;
import com.idol.model.InquiryDAO;
import com.idol.model.InquiryDTO;
import com.idol.model.Inquiry_CategoryDTO;
import com.idol.model.MemberDAO;
import com.idol.model.MemberDTO;
import com.idol.model.MileageDAO;
import com.idol.model.MileageDTO;
import com.idol.model.PageDTO;

//회원과 관련된 지시를 처리하는 컨트롤러 
//회원가입, 로그인, 마이페이지, 마이피드

@Controller
public class MemberController {

	//회원
	@Autowired
	private MemberDAO dao;
	
	//가수
	@Autowired
	private CelebDAO cdao;
	
	//그룹
	@Autowired
	private GroupDAO gdao;
	
	//문의게시판
	@Autowired
	private InquiryDAO idao;
	
	//마일리지
	@Autowired
	private MileageDAO mdao;
	
	//커뮤니티게시판
	@Autowired
	private CommunityDAO comDao;
	
	//팔로워
	@Autowired
	private FollowDAO followDao;
	
	
	//게시판 페이지 관련 
	//페이지 처리용 변수
	private final int rowsize = 3;  //한 페이지당 보이는 게시글의 수
	private int totalRecord ;       //DB상 전체 게시글 수 
	
	
	// ************************************************* 회원가입 관련 *************************************************
	
	//회원가입 폼페이지 이동
	@RequestMapping("join.do")
	public String join(Model model){
		
		//대표 그룹 리스트
		List<CelebDTO> totalList = this.cdao.representList();
		
		//솔로가수 리스트
		List<CelebDTO> cList = this.cdao.soloList();
		
		
		for(int i=0; i<cList.size() ; i++) {
			totalList.add(cList.get(i)); //솔로리스트를 totalList에 추가하기
		}
		
		
		model.addAttribute("totalList", totalList);
		
		return "member/join";
	}
	
	
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
		
		String fav = request.getParameter("checked_celeb"); //쉼표로 구분되어 저장됨
		
		
		
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
			
			MemberDTO login = this.dao.getMemInfo(dto.getMember_id());
			//회원가입 완료 후, 자동 로그인  (회원정보 저장)
			session.setAttribute("loginInfo", login);
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
	
	
	//************************************************* 로그인 관련 *************************************************
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
			
			MemberDTO login = this.dao.getMemInfo(dto.getMember_id());
			
			session.setAttribute("loginInfo", login);
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
	public String findId(MemberDTO dto, HttpServletRequest request, Model model)  {
		
		String vf = request.getParameter("verification"); //인증방법(email, phone)
		String find = request.getParameter("find_word"); //구분(id, pwd)
		String phone = request.getParameter("phone1").trim()+request.getParameter("phone2").trim()
					+request.getParameter("phone3").trim();
		
		//핸드폰번호 저장하기
		dto.setMember_phone(phone);

		String result = "";
		String path ="";
		//파라미터 저장 
		HashMap<String, String> params = new HashMap<String, String>();
		
		
		if(find.equals("id")) {//아이디찾기라면 
			if(vf.equals("email")) {//아이디-이메일로 찾기
				params.put("member_name", dto.getMember_name());
				params.put("member_email",dto.getMember_email());
			}else if(vf.equals("phone")) {//아이디-전화번호로 찾기
				params.put("member_name", dto.getMember_name());
				params.put("member_phone",dto.getMember_phone());
			}else {
				System.out.println("아이디 - 이메일,휴대폰으로 인증 문제발생");
			}
		}else if(find.equals("pwd")) {//비밀번호 찾기라면
			if(vf.equals("email")) {//비밀번호-이메일로 찾기
				params.put("member_id", dto.getMember_id());
				params.put("member_name", dto.getMember_name());
				params.put("member_email",dto.getMember_email());
			}else if(vf.equals("phone")) {//비밀번호-전화번호로 찾기
				params.put("member_id", dto.getMember_id());
				params.put("member_name", dto.getMember_name());
				params.put("member_phone",dto.getMember_phone());
			}else {
				System.out.println("비밀번호 - 이메일,휴대폰으로 인증 문제발생");
			}
		}else {
			System.out.println("아이디,비밀번호찾기 문제발생");
		}
		
		
		result = this.dao.findIdPwd(params, find);
		
		if(result == null) {
			
			model.addAttribute("find_result", "null");
			return "member/idpwd_find";
			
		}
			System.out.println("result:"+result);
			System.out.println("find"+find);
			
			model.addAttribute("result", result); //아이디,비밀번호찾기 겨로가
			model.addAttribute("find", find);//아이디, 비밀번호 구분 
		
		 return "member/idpwd_result";
	}
	
	@RequestMapping("idpwd_result.do")
	public String idpwd_result() {
		
		return "member/idpwd_result";
	}
	
	//************************************************* 마이페이지 *************************************************
	
	//마이페이지 이동 
	@RequestMapping("mypage.do")
	public String mypage(HttpSession session, HttpServletRequest request, Model model) {
		
		//로그인한 회원정보
		MemberDTO dto = (MemberDTO)session.getAttribute("loginInfo");
		session.setAttribute("memInfo", dto);//회원정보 세션저장
		
		//마일리지 정보
		MileageDTO mdto = this.mdao.memMileage(dto);
		
		//문의내역
		List<InquiryDTO> iList = this.idao.getInquiryList(dto.getMember_id());
		
		
		//문의내역 - 답변대기중인 게시글 수
		int waiting = this.idao.watingReply(dto.getMember_id());
		
		
		//값전달
		model.addAttribute("mileage", mdto); //회원에 대한 마일리지 정보
		model.addAttribute("waiting", waiting);//답변대기 문의글
		model.addAttribute("iList",iList); //문의내역
		
		
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
		
		
		//대표 그룹 리스트
		List<CelebDTO> totalList = this.cdao.representList();
				
		//솔로가수 리스트
		List<CelebDTO> cList = this.cdao.soloList();
				
				
		for(int i=0; i<cList.size() ; i++) {
		
			totalList.add(cList.get(i)); //솔로리스트를 totalList에 추가하기
		}
				
				
		model.addAttribute("totalList", totalList);
		
		
		model.addAttribute("celebList", cList);
		
		session.setAttribute("loginInfo", dto);
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
	
	//프로필 사진 수정 - 마이페이지 또는 피드 
	@RequestMapping("editProfile.do")
	public void editProfile(MultipartHttpServletRequest multi, MemberDTO dto, HttpServletResponse response, HttpServletRequest request) throws IOException {
		
		//요청을 넘기는 곳의 정보  - mypage_*.jsp 또는 feed_*.jsp
		String uri = request.getParameter("uri");
		String path = "/controller/WEB-INF/views/member";
		System.out.println("uri"+uri);
		System.out.println("path"+path);
		
		
		String command = uri.substring(path.length()+1);
		System.out.println("command:"+command);
		
		//저장되었던 이미지 이름
		String old_img = multi.getParameter("old_img");
		
		
		
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
					
					//원래있던 저장되어있던 이미지 삭제해주기
					if( path1.exists() && old_img != null) {
						
						File file = new File(homedir+"/"+old_img);
						file.delete();
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
				
				String redirect="";
				
				if(command.substring(0,1).equals("m")) {//마이페이지에서 프로필 수정한 경우
					redirect = "mypage.do";
				}else if(command.substring(0, 1).equals("f")){
					
					redirect = "myfeed.do?id="+dto.getMember_id();
				}
				
				System.out.println("redirect:"+redirect);
				
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter out = response.getWriter();
				
				if(result>0) {
					out.println("<script>");
					out.println("alert('프로필 사진 업로드 성공')");
					out.println("location.href='"+redirect+"'");
					out.println("</script>");
					
				}else {
					out.println("<script>");
					out.println("alert('프로필 사진 업로드 실패')");
					out.println("history.back()");
					out.println("</script>");
				}
	}
	
	//피드 커버사진 수정
	@RequestMapping("editCover.do")
	public void editCover(MultipartHttpServletRequest multi, MemberDTO dto, HttpServletResponse response) throws IOException {
		
		//저장되었던 이미지 이름
		String old_img = multi.getParameter("old_img");
		System.out.println("old_img:"+old_img);
		
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
					
					//원래있던 저장되어있던 이미지 삭제해주기
					if(  path1.exists() && old_img != null) {
						
						File file = new File(homedir+"/"+old_img);
						file.delete();
					}
					
					//실제 파일만들기
					String saveFileName = "head_"+originalFileName;
					
					dto.setMember_cover(saveFileName);
					
					result = this.dao.coverUpload(dto);
					
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
					out.println("alert('커버 사진 업로드 성공')");
					out.println("location.href='myfeed.do?id="+dto.getMember_id()+"'");
					out.println("</script>");
					
				}else {
					out.println("<script>");
					out.println("alert('커버 사진 업로드 실패')");
					out.println("history.back()");
					out.println("</script>");
				}
	}
	
	
	
	
	//마이페이지 - 구매내역페이지 이동
	@RequestMapping("order_list.do")
	public String order_list() {
		
		return"member/mypage_orderList" ;
	}
	
	
	//마이페이지 - 문의내역페이지 이동
	@RequestMapping("inquiry_list.do")
	public String qnaist(HttpServletRequest request, Model model,
				HttpSession session) {
		
		String login_id = (String)session.getAttribute("login_id");
		
		int page; //현재 페이지 변수
		
		if(request.getParameter("page") != null) {
			page= Integer.parseInt(request.getParameter("page"));
		}else {
			page =1; //넘겨받은 page 변수가 없다면 1페이지로 설정 
		}
		
		//DB상 리스트 전체 게시물 수 확인하기
		totalRecord = this.idao.getBoardCount(login_id);
		
		PageDTO pdto = new PageDTO(page, rowsize, totalRecord);
		
		//mybatis 다중 파라미터용 
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("inquiry_userid", login_id);
		map.put("page", pdto);
		
		//페이지에 해당하는 게시물 가져오기
		List<InquiryDTO> list = this.idao.getInquiryList(map);
		
		//답변 대기 중인 문의 수
		int waiting = this.idao.watingReply(login_id);
		
		
		model.addAttribute("List", list);
		model.addAttribute("paging", pdto);
		model.addAttribute("waiting", waiting);
		
		return "member/mypage_qnaList";
	}
	
	//마이페이지 - 문의게시글 날짜검색
	@RequestMapping("inquiry_date.do")
	public String inquiry_date(HttpServletRequest request, Model model,
			HttpSession session) throws ParseException {
		
		String login_id = (String)session.getAttribute("login_id");

		int page; //현재 페이지 변수

		if(request.getParameter("page") != null) {
			page= Integer.parseInt(request.getParameter("page"));
		}else {
			page =1; //넘겨받은 page 변수가 없다면 1페이지로 설정 
		}
		
		//날짜 조회 
		int search_date = Integer.parseInt(request.getParameter("search_date"));
		
		//오늘날짜 기준 
		Calendar cal = Calendar.getInstance();
		
		int year = cal.get(Calendar.YEAR);
		int month =cal.get(Calendar.MONTH)+1;
		int day =cal.get(Calendar.DAY_OF_MONTH);
		
		String endDate = year+"-"+month+"-"+day;
		String startDate = "";
		
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		Date date = format.parse(endDate);
		
		cal.setTime(date);
		
		switch (search_date) {
		case 0: //오늘
			startDate = endDate;
			break;
		case 7: //일주일
			cal.add(Calendar.DATE, -7);
			startDate = format.format(cal.getTime());
			break;
		case 1: //한달
			cal.add(Calendar.DATE, -30);
			startDate = format.format(cal.getTime());
			break;
		case 3: //3달
			cal.add(Calendar.DATE, -90);
			startDate = format.format(cal.getTime());
			break;
		case 6: //6달
			cal.add(Calendar.DATE, -180);
			startDate = format.format(cal.getTime());
			break;
		case 12: //1년
			cal.add(Calendar.DATE, -365);
			startDate = format.format(cal.getTime());
			break;
		}
		
		HashMap<String, Object> map = new HashMap<String, Object>();
	
		map.put("inquiry_userid", login_id);
		map.put("startDate", startDate);
		map.put("endDate", endDate);
		

		//DB상 리스트 전체 게시물 수 확인하기
		totalRecord = this.idao.getBoardCount(map);

		PageDTO pdto = new PageDTO(page, rowsize, totalRecord);

		//mybatis 다중 파라미터용 
		map.put("page", pdto);

		//페이지에 해당하는 게시물 가져오기
		List<InquiryDTO> list = this.idao.getInquiryList(map);

		//답변 대기 중인 문의 수
		int waiting = this.idao.watingReply(login_id);


		model.addAttribute("List", list);
		model.addAttribute("paging", pdto);
		model.addAttribute("search_date", search_date);
		model.addAttribute("waiting", waiting);

		return "member/mypage_qnaListDate";
		
	}
	
	
	//마이페이지 - 문의게시글 작성하기 
	@RequestMapping("inquiry_write.do")
	public String inquiry_write(@RequestParam("id")String id, HttpServletRequest request, Model model) {
		
		//문의게시판 카테고리 리스트
		List<Inquiry_CategoryDTO> cList = this.idao.getInquiryCategory();
		
		//넘겨받은 제품번호가 있다면
		try {
			
			int pno = Integer.parseInt(request.getParameter("pno"));
			
			//상품정보 가져와 저장하기 
			
			
		}catch (Exception e) {
			e.printStackTrace();
			System.out.println("문의글 작성하기 - 상품정보 없음");
		}
		
		
		
		model.addAttribute("cList", cList);
		
		
		return "member/mypage_qna_write";
	}
	
	//문의게시글 등록 완료
	@RequestMapping("inquiry_write_ok.do")
	public void qna_writeOk(InquiryDTO dto, MultipartHttpServletRequest multi, HttpServletResponse response) throws IOException {
		
		//올린 이미지 저장
		Iterator<String> iterator = multi.getFileNames();

		String uploadFileName = iterator.next();

		List<MultipartFile> fileList = multi.getFiles(uploadFileName);

		
		String path = "C:\\Users\\ayss3\\Documents\\FinalProject\\IdolProject\\src\\main\\webapp\\resources\\upload\\inquiry_board";

		String dbFileName = "";

		long fileSize = 0;
		
		
		for (MultipartFile mFile : fileList) {

			String originFileName = mFile.getOriginalFilename(); // 원본 파일 명
			
			fileSize = mFile.getSize(); // 파일 사이즈

//			System.out.println("originFileName : " + originFileName);
//			System.out.println("fileSize : " + fileSize);
			
			if(fileSize != 0) {
			String saveFile = dto.getInquiry_userid()+"_" + originFileName;

			dbFileName += dto.getInquiry_userid()+"_" + originFileName + "|";
			
			dto.setInquiry_image(dbFileName);
			
			try {

				mFile.transferTo(new File(path+"/"+saveFile));

			} catch (IllegalStateException e) {

			}
			
			}else {
				break;
			}
		}
		
		int check = this.idao.insertInquiry(dto);
		
		response.setContentType("text/html; charset=UTF-8");
		
		PrintWriter out = response.getWriter();
		
		
		if(check>0) {
			
			out.println("<script>");
			out.println("alert('게시글 작성 완료')");
			out.println("location.href='inquiry_list.do'"); 
			out.println("</script>");
		}else {
			out.println("<script>");
			out.println("alert('게시글 작성 실패')");
			out.println("history.back()");
			out.println("</script>");
		}
		
	}
	
	//마이페이지 - 문의게시글 내용 
	@RequestMapping("inquiry_cont.do")
	public String qna_cont(@RequestParam("no")int no, @RequestParam("page") int page,
						Model model) {
		
		//조회수 증가
		this.idao.updateHit(no);
		
		//문의글 내용
		InquiryDTO dto = this.idao.getInquirycont(no);
		
		//문의글 첨부파일 이미지 
		String[] img = null;

		StringTokenizer st = null;
		if(dto.getInquiry_image() != null) {
			st = new StringTokenizer(dto.getInquiry_image(),"|");

			img= new String[st.countTokens()];

			for(int i =0; i<img.length; i++){
				img[i]=st.nextToken();	
			}
		}
		
		//원글에 답변글 있는경우 
		InquiryDTO reply = this.idao.getReplyCont(no);
		
		model.addAttribute("Cont", dto);
		model.addAttribute("page", page);
		model.addAttribute("Img", img);
		model.addAttribute("Reply", reply);
		
		return "member/mypage_qnaCont";
	}
	
	//문의게시글 삭제
	@RequestMapping("inquiry_delete.do")
	public void inquiry_delete(@RequestParam("no")int no, HttpServletResponse response) throws IOException {
		
		int check = this.idao.deleteInquiry(no);
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		if(check>0) {
			
			this.idao.adjustIno(no);
			
			out.println("<script>");
			out.println("alert('삭제 완료')");
			out.println("location.href='inquiry_list.do'");
			out.println("</script>");
			
		}else {
			out.println("<script>");
			out.println("alert('삭제 실패')");
			out.println("history.back()");
			out.println("</script>");
		}
	}
	
	//문의게시글 수정
	@RequestMapping("inquiry_update.do")
	public String inquiry_update(@RequestParam("no")int no, @RequestParam("page") int page,
			Model model) {
		
		//문의글 내용
		InquiryDTO dto = this.idao.getInquirycont(no);
		
		model.addAttribute("Cont", dto);
		model.addAttribute("page", page);
		
		return "member/mypage_qnaUpdate";
		
	}
	
	//문의게시글 수정 완료
	@RequestMapping("inquiry_updateOk.do")
	public void inquiry_updateOk(InquiryDTO dto, MultipartHttpServletRequest multi,
				HttpServletResponse response) throws IOException {
		
		//수정 이미지 파일 저장
		Iterator<String> iterator = multi.getFileNames();

		String uploadFileName = iterator.next();

		List<MultipartFile> fileList = multi.getFiles(uploadFileName);


		String path = "C:\\Users\\ayss3\\Documents\\FinalProject\\IdolProject\\src\\main\\webapp\\resources\\upload\\inquiry_board";

		String dbFileName = "";

		long fileSize = 0;


		for (MultipartFile mFile : fileList) {

			String originFileName = mFile.getOriginalFilename(); // 원본 파일 명

			fileSize = mFile.getSize(); // 파일 사이즈

//					System.out.println("originFileName : " + originFileName);
//					System.out.println("fileSize : " + fileSize);

			if(fileSize != 0) {
				String saveFile = dto.getInquiry_userid()+"_" + originFileName;

				dbFileName += dto.getInquiry_userid()+"_" + originFileName + "|";

				dto.setInquiry_image(dbFileName);

				try {

					mFile.transferTo(new File(path+"/"+saveFile));

				} catch (Exception e) {

				}

			}else {
				break;
			}
		}//for문 end
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();

		int page = Integer.parseInt(multi.getParameter("page"));

		int check = this.idao.updateInquiry(dto);

		if(check>0) {

			out.println("<script>");
			out.println("alert('수정 성공')");
			out.println("location.href='inquiry_cont.do?no="+dto.getInquiry_no()+"&page="+page+"'");
			out.println("</script>");

		}else {

			out.println("<script>");
			out.println("alert('수정 실패')");
			out.println("history.back()");
			out.println("</script>");
		}
		
		
		
	}
	
	
	
	//상품 검색
	@RequestMapping("m_qna_product.do")
	public String qna_product() {
		
		return "member/m_qna_product";
	}
	
	
	//********************************************* 마이피드 *************************************************
	
	//마이피드 메인 (about 화면이 디폴트)
	@RequestMapping("myfeed.do") //get방식으로 id가 넘어옴
	public String feed(@RequestParam("id")String id, HttpSession session, Model model) {
		
		//피드에 담길 정보들을 저장하는 map타입
		HashMap<String, Object> feedInfo = new HashMap<String, Object>();
		
		//누른 feed의 회원 정보
		MemberDTO dto = this.dao.getMemInfo(id);
		feedInfo.put("mInfo", dto);
		
		//누른 feed의 회원 게시글 리스트
		List<CommunityDTO> commList = this.comDao.getCommunityList(id);
		feedInfo.put("commList", commList);
		
		//누른 feed의 회원의 팔로우,팔로워 정보
		//내가 팔로우 하는 사람들 팔로잉 follow
		List<FollowDTO> following = this.followDao.getFollowList(id);
		feedInfo.put("following", following);
		
		//나를 등록한 사람들 follower  
		List<FollowDTO> follower = this.followDao.getFollowerList(id);
		feedInfo.put("follower", follower);
		
		//로그인 회원 정보 받기 
		String login_id = (String)session.getAttribute("login_id");
		
	
		//로그인한 회원의 팔로우한 내역들
		if(login_id != null) {
		List<FollowDTO> login_follow = this.followDao.getFollowList(login_id);
		feedInfo.put("login_follow", login_follow);
		}
	
		
		//about에 나오는 정보
		//feed회원의 좋아하는 가수 정보 가져오기 
		
		// ','로 이어진 가수 번호 나눠 배열에 담기
		String fav = dto.getMember_favorite_celeb();
				
		String[] mem_fav = null;

		StringTokenizer st = null;
		if(fav != null) {
			st = new StringTokenizer(fav,",");
						
			mem_fav= new String[st.countTokens()];
						
  		    for(int i =0; i<mem_fav.length; i++){
					mem_fav[i]=st.nextToken();			
					}
		}
		
		//좋아하는 가수 정보 담은 리스트
		List<String[]> favList = new ArrayList<String[]>();

		//배열에 담긴 각각 가수에 대해 정보 불러오기
		//Celeb테이블에서 가수 정보를 불러왔기 때문에 celeb에서 1차로 정보 확인 후 그룹가수일 경우 group테이블에서 확인 필요 
		if(mem_fav != null) {
		for(int i=0; i<mem_fav.length; i++) {
			CelebDTO celebDto = this.cdao.getCelebInfo(Integer.parseInt(mem_fav[i]));
			
			String [] img = null;//가수,그룹이미지 담을 배열
			
			//솔로+그룹 가수 통합 정보 담는 배열 
			String [] groupCeleb = new String [4]; // 0: 번호 , 1:이름, 2:이미지, 3:그룹,솔로 구분 

			if(celebDto.getCeleb_group().equalsIgnoreCase("solo")) {//솔로 가수일 경우
				
				st= new StringTokenizer(celebDto.getCeleb_pimage(), "|");
				img = new String[st.countTokens()];
				
				for(int z =0; z<img.length; z++) {
					img[z] = st.nextToken();
				}
				
				groupCeleb[0] = celebDto.getCeleb_no()+"";
				groupCeleb[1] = celebDto.getCeleb_name();
				groupCeleb[2] = img[0];
				groupCeleb[3] = "solo";

			}else {//그룹 가수라면 
				
				GroupDTO groupDto = this.gdao.getGroupInfo(celebDto.getCeleb_group());
				
				st= new StringTokenizer(groupDto.getGroup_image(), "|");
				img = new String[st.countTokens()];
				
				for(int z =0; z<img.length; z++) {
					img[z] = st.nextToken();
				}
				
				groupCeleb[0] = groupDto.getGroup_no()+"";
				groupCeleb[1] = groupDto.getGroup_name();
				groupCeleb[2] = img[0];
				groupCeleb[3] = "group";

			}
			

			favList.add(groupCeleb);

		}
		}
		
		//피드 관련 include에 들어갈 정보 
		session.setAttribute("feedInfo", feedInfo); //세션에 저장
		
		model.addAttribute("id", id);
		model.addAttribute("favList", favList);
		
		
		return "member/feed_about";
	}
	
	//팔로워 리스트 
	@RequestMapping("feed_follower.do")
	public String feed_follwer(@RequestParam("id")String id, HttpSession session, Model model) {
		
		//피드 회원을 팔로우 하고있는 리스트들의 회원정보 (팔로워)
		List<MemberDTO> followerCont = new ArrayList<MemberDTO>();
		
		HashMap maps = (HashMap<String, Object>)session.getAttribute("feedInfo");
		
		//피드 회원의 follower 리스트를 불러오기
		List<FollowDTO> follower = (List<FollowDTO>)maps.get("follower");
		
		//팔로워리스트에 담겨져있는 회원들의 정보를 새로운 리스트에 저장
		for(int i=0; i<follower.size(); i++) {
			
			FollowDTO fdto = follower.get(i);
			
			//회원정보 가져오기
			MemberDTO mdto = this.dao.getMemInfo(fdto.getFollower_name());
			
			//회원정보 저장
			followerCont.add(mdto);
		}
		
		model.addAttribute("followerCont", followerCont);
		model.addAttribute("id", id); //피드 아이디
		
		return "member/feed_follower";
	}
	
	//팔로워 리스트 
	@RequestMapping("feed_following.do")
	public String feed_following(@RequestParam("id")String id, HttpSession session, Model model) {
			
		//피드 회원을 팔로우 하고있는 리스트들의 회원정보 (팔로워)
		List<MemberDTO> followingCont = new ArrayList<MemberDTO>();
			
		HashMap maps = (HashMap<String, Object>)session.getAttribute("feedInfo");
		List<FollowDTO> following = (List<FollowDTO>)maps.get("following");
			
		//팔로워리스트에 담겨져있는 회원들의 정보를 새로운 리스트에 저장
		for(int i=0; i<following.size(); i++) {
				
			FollowDTO fdto = following.get(i);
				
			//회원정보 가져오기
			MemberDTO mdto = this.dao.getMemInfo(fdto.getFollow_name());
				
			//회원정보 저장
			followingCont.add(mdto);
		}
			
		model.addAttribute("followingCont", followingCont);
		model.addAttribute("id", id); //피드 아이디
			
		return "member/feed_following";
		}
	
	//언팔 기능
	@RequestMapping("unfollow.do")
	public void unfollow(@RequestParam("id")String id, HttpServletResponse response, HttpSession session) throws IOException {
		
		String login = (String)session.getAttribute("login_id");
		
		int check = this.followDao.deleteFollow(login, id);
		response.setContentType("text/html; charset=UTF-8");
		
		String redirect ="";
		
		if(login.equals(id)) {
			redirect = login;
		}else {
			redirect = id;
		}
		
		PrintWriter out = response.getWriter();
		if(check>0) {
			out.println("<script>");
			out.println("alert('언팔 완료')");
			out.println("location.href='myfeed.do?id="+redirect+"'");
			out.println("</script>");
			
		}else {
			out.println("<script>");
			out.println("alert('언팔 실패')");
			out.println("history.back()");
			out.println("</script>");
		}
		
	}
	
	//팔로우기능
	@RequestMapping("follow.do")
	public void follow(@RequestParam("id")String id, HttpServletResponse response, HttpSession session) throws IOException {
		
		//피드아이디 정보
		MemberDTO feed = this.dao.getMemInfo(id);
		
		//로그인아이디 정보
		MemberDTO login = this.dao.getMemInfo((String)session.getAttribute("login_id"));
		
		int check = this.followDao.insertFollow(login, feed);
		response.setContentType("text/html; charset=UTF-8");
		
		PrintWriter out = response.getWriter();
		
		String redirect ="";
		
		if(login.equals(id)) {
			redirect = login.getMember_id();
		}else {
			redirect = id;
		}
		
		
		
		if(check>0) {
			out.println("<script>");
			out.println("alert('팔로우 성공')");
			out.println("location.href='myfeed.do?id="+redirect+"'");
			out.println("</script>");
			
		}else {
			out.println("<script>");
			out.println("alert('팔로우 실패')");
			out.println("history.back()");
			out.println("</script>");
		}
	}
	
}
