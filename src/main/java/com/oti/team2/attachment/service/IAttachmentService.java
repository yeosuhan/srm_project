package com.oti.team2.attachment.service;

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
}
