package com.oti.team2.attachment.service;

import java.io.IOException;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.oti.team2.attachment.dto.AttachResponseDto;

public interface IAttachmentService {
	
	/**
	 * 파일 다운로드
	 * @author 신정은
	 */
	AttachResponseDto downloadAttach(int fileSn);
	
	/**
	 * 파일 삭제
	 * @author 신정은
	 */
	void deleteAttach(int fileSn);
		
	/**
	 * 파일 업로드
	 * @author 신정은
	 */
	void uploadFiles(List<MultipartFile> mfList, int bbsNo, String dmndNo) throws IllegalStateException, IOException;
	
	/**
	 * 파일 조회
	 * @author 신정은
	 */
	List<AttachResponseDto> getAttachFiles(Integer bbsNo, String dmndNo);
}
