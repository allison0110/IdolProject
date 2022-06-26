package com.idol.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class AdminMemberDAOImpl implements AdminMemberDAO{
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	// 맴버 리스트 불러오기
	@Override
	public List<MemberDTO> getMemberList() {
		return this.sqlSession.selectList("getMemberLsit");
	}
	
	// 문의 리스트 불러오기
	@Override
	public List<InquiryDTO> getInquirList() {
		return this.sqlSession.selectList("getInquirList");
	}
	
	// 문의 카테고리 불러오기
	@Override
	public List<Inquiry_CategoryDTO> getInquiryCategoryList() {
		return this.sqlSession.selectList("getInquiryCategoryList");
	}
	
	// 문의 게시글 상세 정보 불러오괴 by no
	@Override
	public InquiryDTO getmemberInquiryCont(int no) {
		return this.sqlSession.selectOne("getInquiryCont", no);
	}
	
	// test : 주문 상세 내역 가져오기 by order_no (중복로직 나중에 정리해야 됌 *일단 사용중* (productImple쪽이랑 중복 ))
	@Override
	public OrderDTO getOrderContByNo(int no) {
		return this.sqlSession.selectOne("getOrderInfoByNo", no);
	}
	
	// 문의 게시글 답글 작성 
	@Override
	public int insertInquiryReply(InquiryDTO dto) {
		return this.sqlSession.insert("insertInquiryReply", dto);
		
	}
	
	// 문의 게시글 답글 작성시 step +1 시켜주는 메서드
	@Override
	public void updateReplyStep(InquiryDTO dto) {
		this.sqlSession.update("updateReplyStep", dto);
		
	}

	@Override
	public void updateReplyStatus(InquiryDTO dto) {
		this.sqlSession.update("updateReplyStatus", dto);
		
	}

	@Override
	public List<InquiryDTO> getInquiryReplyList(int no) {
		return this.sqlSession.selectList("getInquiryReplyList", no);
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
}
