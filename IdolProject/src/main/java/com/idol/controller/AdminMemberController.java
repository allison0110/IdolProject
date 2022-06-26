package com.idol.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.StringTokenizer;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.idol.model.AdminMemberDAO;
import com.idol.model.AdminProductDAO;
import com.idol.model.InquiryDTO;
import com.idol.model.Inquiry_CategoryDTO;
import com.idol.model.MemberDTO;
import com.idol.model.OrderDTO;
import com.idol.model.ProductDTO;

@Controller
public class AdminMemberController {

	@Autowired
	private AdminMemberDAO dao;
	
	@Autowired
	private AdminProductDAO pdao;
	
	
	// 맴버 페이지 메인화면 가기
	@RequestMapping("admin_member_main.do")
	public String AdminMemberMain(Model model) {
		
		List<MemberDTO> list = this.dao.getMemberList();
		
		model.addAttribute("mList", list);
		
		return "admin/admin_member_main";
	}
	
	// 고객 문의 페이지 가기
	@RequestMapping("admin_member_contact.do")
	public String adminMemberContact(Model model) {
		
		List<InquiryDTO> list =this.dao.getInquirList();
		
		List<Inquiry_CategoryDTO> iclist = this.dao.getInquiryCategoryList();
		
		model.addAttribute("iList", list);
		
		model.addAttribute("icList", iclist);
		
		return "admin/admin_member_contact";
	}
	
	// 문의 게시글 상세 페이지로 가기
	@RequestMapping("admin_member_inquiryCont.do")
	public String adminMemberInquiryCont(@RequestParam("no") int no, @RequestParam(value="pno", required=false, defaultValue="0") int pno, 
			@RequestParam(value="ono", required=false, defaultValue="0") int ono, 
				Model model, @RequestParam("gno") int gno) {
		
		System.out.println("no >>> " + no);
		System.out.println("ono >>> " + ono);
		System.out.println("pno >>> " + pno);
		System.out.println("gno >>> " + gno);
		
		// inquiry 상세 정보
		InquiryDTO idto = this.dao.getmemberInquiryCont(no);
		
		model.addAttribute("iCont", idto);
		
	////////////////////////////////////////////////////////////////
		String imgs = idto.getInquiry_image();
		
		if(imgs != null) {
			
			StringTokenizer tokenizer = new StringTokenizer(imgs, "|");
			
			String[] imgsList = new String[tokenizer.countTokens()];
			
			for(int i =0; i < imgsList.length; i++) {
				
				imgsList[i] = tokenizer.nextToken();
			}
			
			model.addAttribute("imgsList", imgsList);
		}else {
			
		}
		
	/////////////////////////////////////////////////////////////////	
		
		
		
		
		
		// inquiry group list 불러오기 by inquriy_group
		List<InquiryDTO> glist = this.dao.getInquiryReplyList(gno);
		
		model.addAttribute("gList", glist);
		
		if(ono != 0) {
			
			OrderDTO odto = this.dao.getOrderContByNo(ono);
			
			String oimgs = odto.getOrder_pimage();
			
			StringTokenizer tokenizerO = new StringTokenizer(oimgs, "|");

			String[] oimgsList = new String[tokenizerO.countTokens()];
			
			for(int i = 0; i< oimgsList.length; i++) {
				
				oimgsList[i] = tokenizerO.nextToken();

			}
			
			// order 상세 정보 by order_no
			model.addAttribute("odto", odto);	
			
			// order 이미지 리스트
			model.addAttribute("oimgsList", oimgsList);
			
		}else {
			
		}

		
		if(pno != 0) {
			
			ProductDTO pdto = this.pdao.getProductCont(pno);
			
			String pimgs = pdto.getProduct_image();
			
			StringTokenizer tokenizerP = new StringTokenizer(pimgs, "|");
			
			String[] pimgsList = new String[tokenizerP.countTokens()];
			
			for(int i = 0; i < pimgsList.length; i ++) {
				
				pimgsList[i] = tokenizerP.nextToken();
				
			}
			
			// product 상세 정보 by product_no
			model.addAttribute("pdto", pdto);
			
			// product 이미지 리스트
			model.addAttribute("pimgsList", pimgsList);
			
		}else {
			
		}
		
		return "admin/admin_member_inquiryCont";
		
	}
	
	// 문의게시글 답변 페이지로 가기
	@RequestMapping("admin_inquiry_reply.do")
	public String inquiryReply(@RequestParam("no") int no, Model model) {
		
		
		
		InquiryDTO idto = this.dao.getmemberInquiryCont(no);
		
		model.addAttribute("iCont", idto);	
		
		return "admin/admin_member_inquiryReply";
	}
	
	// 답글 작성 완료
	@RequestMapping("admin_inquiry_replayOk.do")
	public void inquiryReplayOk(InquiryDTO dto, HttpServletResponse response,@RequestParam("orginNo") int originNo) throws IOException {
		
		// 문의글 답변 상태 완료로 바꾸기
		this.dao.updateReplyStatus(dto);
		
		// 문의글 관련 그룹 step +1 하기
		this.dao.updateReplyStep(dto);
		
		// db에 문의 답글 저장하기
		int check = this.dao.insertInquiryReply(dto);
		
		response.setContentType("text/html; charset=UTF-8");
		
		PrintWriter out = response.getWriter();
		
		if(check > 0) {
			System.out.println("originNo : " + originNo);
			out.println("<script>");
			out.println("alert('답변 글 작성 성공 :)')");
			out.println("location.href='admin_member_inquiryCont.do?no="+originNo+"'");
			out.println("</script>");
		}else {
			
			out.println("<script>");
			out.println("alert('답변 글 작성 실패 :)')");
			out.println("history.back()");
			out.println("</script>");
			
		}
		
	}
	
	
	
	
}
