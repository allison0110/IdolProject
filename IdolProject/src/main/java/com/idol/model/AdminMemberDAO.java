package com.idol.model;

import java.util.List;

public interface AdminMemberDAO {
	
	
	// 멤버 리스트 불러오기
	public List<MemberDTO> getMemberList();
	// 1:1 문의 리스트 불러오기
	public List<InquiryDTO> getInquirList();
	// inquiry category 불러오기 
	public List<Inquiry_CategoryDTO> getInquiryCategoryList();
	// 문의 게시글 상세 정보 불러오기
	public InquiryDTO getmemberInquiryCont(int no);
	// order_no 정보 불러오기 (test)
	public OrderDTO getOrderContByNo(int no);
	// 문의 답변 작성시 step +1 시켜주는 메서드
	public void updateReplyStep(InquiryDTO dto);
	// 1:1 문의 답변 작성
	public int insertInquiryReply(InquiryDTO dto);
	// 단변 완료 게시판 status 1로 변환 시키지
	public void updateReplyStatus(InquiryDTO dto);
	// 문의게시판 상세 페이지에서 답변글 불러오기 by group_no 
	public List<InquiryDTO> getInquiryReplyList(int no);
	
	
	
	
	
}
