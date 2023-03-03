package com.oti.team2.member.dto;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class Join {
	private String memberId;
	private String pswd;
	private String flnm;
	private String addr;
	private String addrDetail;
	private String telNo;
	private String eml;
	private String instCd;  // 고객
	private String jbgdCd;  // 사원
	private String deptCd;  // 사원
	private String memberType;
	private MultipartFile file;
	private String fileType;
	private byte[] fileData;
}
