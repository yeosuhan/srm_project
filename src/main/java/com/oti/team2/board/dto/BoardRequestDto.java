package com.oti.team2.board.dto;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class BoardRequestDto {
	private int bbsNo;
	private String bbsType;
	private String bbsTtl;
	private String bbsCn;
	private String wrtrId; // 작성자 아이디
	private boolean atchYn; // 첨부파일 유무
	
	private String srNo; 
	private List<MultipartFile> attachFile;
	
	private Integer inqCnt;
	private boolean ansYn = false;
}
