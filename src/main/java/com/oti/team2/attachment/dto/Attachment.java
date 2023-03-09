package com.oti.team2.attachment.dto;

import lombok.Data;

@Data
public class Attachment {
	private int bbsNo;
	private String dmndNo;
	
	private String orgnlFileNm;
	private String fileNm;
	private long fileSz;
	private String fileType;
}
