package com.idol.model;

import java.util.List;

public interface AdminNoticeDAO {
	
	// 공지 사항 작성 하기
	public int insertNotice(NoticeDTO dto);
	// 공지 리스트 불러오기
	public List<NoticeDTO> getNoticeList();
	// 공지 상세 정보 불러오기
	public NoticeDTO getNoticeContent(int no);
	// 공지 삭제 하기
	public int deleteNotice(int no);
	// 공자 삭제 후 넘버링 재정의
	public void updateNoticeSeque(int no);
	
	
	
	
}
