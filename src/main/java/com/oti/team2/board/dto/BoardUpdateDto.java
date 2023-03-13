package com.oti.team2.board.dto;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class BoardUpdateDto {
	private int bbsNo;
	private String bbsType;
	private String bbsTtl;
	private String bbsCn;
	private List<MultipartFile> nattachFile;
}
