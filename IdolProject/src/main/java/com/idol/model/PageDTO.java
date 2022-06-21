package com.idol.model;

import lombok.Data;

//페이지와 관련된 DTO
//페이징 처리 작업 시 작업한 내용을 설정하는 객체 

@Data
public class PageDTO {

	//페이징 처리 관련 멤버
	private int page; 			//현재페이지
	private int rowsize;		//한 페이지당 보여질 게시글 개수
	private int totalRecord; 	//DB상 전체 레코드의 수
	private int startNo;		//해당 페이지에서 시작번호
	private int endNo;			//해당 페이지에서 끝 번호
	private int startBlock; 	//해당 페이지의 시작 블럭
	private int endBlock;		//해당 페이지의 끝 블럭
	private int allPage;		//전체 페이지의 수 
	private int block =3;		//한 블럭당 보여지는 페이지의 수
	
	
	//검색관련 멤버
	private String field;
	private String word;
	
	
	
	public PageDTO() { } 		//기본생성자
	
	//일반적 페이징처리 생성자
	public PageDTO(int page, int rowsize, int totalRecord) {
		
		this.page = page;
		this.rowsize=rowsize;
		this.totalRecord=totalRecord;
		
		
		//해당페이지에서 시작번호 
		this.startNo = (this.page*this.rowsize) - (this.rowsize-1);
		
		
		//해당페이지에서 마지막번호
		this.endNo= (this.page*this.rowsize);
		
		//시작블럭
		this.startBlock = (((this.page-1)/this.block)*this.block)+1;
		//끝블럭
		this.endBlock = (((this.page-1)/this.block)*this.block)+ this.block;
		
		
		this.allPage = (int)Math.ceil(this.totalRecord/(double)this.rowsize);
		
		if(this.endBlock > this.allPage) {
			this.endBlock = this.allPage;
		}
		
	}
	
	//검색 처리 페이징 생성자
	public PageDTO (int page, int rowsize, int totalRecord, String field, String word) {
		
		this(page, rowsize,totalRecord); //이미 존재하는 생성자를 불러옴
	
		this.field = field; 
		this.word = word;
	
		
	}
	
	
}
