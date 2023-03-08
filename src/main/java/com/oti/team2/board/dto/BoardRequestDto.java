package com.oti.team2.board.dto;

import lombok.Data;

@Data
public class BoardRequestDto {
	private String bbsType;
	private String bbsTtl;
	private String bbsCn;
	private String wrtrId; // 작성자 아이디
	private boolean atchYn; // 첨부파일 유무
	
	private String srNo; 
}
