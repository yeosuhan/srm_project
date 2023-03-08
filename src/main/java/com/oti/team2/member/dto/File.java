package com.oti.team2.member.dto;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class File {
	private byte[] fileData;
	private String fileContentType;
	private MultipartFile file;
}
