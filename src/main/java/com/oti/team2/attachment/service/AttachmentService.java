package com.oti.team2.attachment.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.oti.team2.attachment.dao.IAttachmentDao;
import com.oti.team2.attachment.dto.AttachResponseDto;

@Service
public class AttachmentService implements IAttachmentService{
	
	@Autowired
	private IAttachmentDao attachmentDao;

	/**
	 * 파일 다운로드
	 * @author 신정은
	 */
	public AttachResponseDto downloadAttach(int fileSn) {
		return attachmentDao.selectAttachByFileSn(fileSn);
	}

	/**
	 * 파일 삭제
	 * @author 신정은
	 */
	public void deleteAttach(int fileSn) {
		attachmentDao.deleteAttachByFileSn(fileSn);
	}

}
