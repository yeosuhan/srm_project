package com.oti.team2.srdemand.dto;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class SrRequestDto {
	private String dmndNo;
	private String custId; // 고객 아이디
	private String sysCd;
	private String taskSeCd;
	private String ttl; 
	private String cn;
	private String relGrund; // 관련 근거
	private String cmptnDmndYmd; // 완료 요청일
	private List<MultipartFile> attachFile;
	private List<MultipartFile> nattachFile;

	// 첨부파일 관리 필요함
}
