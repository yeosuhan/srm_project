package com.oti.team2.attachment.dto;

import lombok.Data;

@Data
public class AttachResponseDto {
	private int fileSn;
	private String orgnlFileNm;
	private String fileNm;
	private long fileSz;
	private String fileType;
}
