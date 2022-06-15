package com.idol.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
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
import com.idol.model.MemberDAO;
import com.idol.model.MemberDTO;
import com.idol.model.MileageDAO;
import com.idol.model.MileageDTO;

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
	
	@Autowired
	private GroupDAO gdao;
	
	//마일리지
	@Autowired
	private MileageDAO mdao;
	
	//커뮤니티게시판
	@Autowired
	private CommunityDAO comDao;
	
	//팔로워
	@Autowired
	private FollowDAO followDao;
	
	
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
	public String mypage(HttpSession session, Model model) {
		
		//로그인한 회원정보
		MemberDTO dto = (MemberDTO)session.getAttribute("loginInfo");
//		session.setAttribute("memInfo", dto);//회원정보 세션저장
		
		
		MileageDTO mdto = this.mdao.memMileage(dto);
		
		
		
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
	@RequestMapping("myOrderlist.do")
	public String myorderlist() {
		
		return"member/mypage_orderList" ;
	}
	
	
	//마이페이지 - 문의내역페이지 이동
	@RequestMapping("myQnalist.do")
	public String qnaist() {
		
		return "member/mypage_qnaList";
	}
	
	
	//********************************************* 마이피드 *************************************************
	
	//마이피드 메인 (about 화면이 디폴트)
	@RequestMapping("myfeed.do")
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
		
		
		
		//피드 관련 include에 들어갈 정보 
		session.setAttribute("feedInfo", feedInfo); //세션에 저장
		model.addAttribute("commList", commList);
		model.addAttribute("id", id);
		
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
