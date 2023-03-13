package com.oti.team2.attachment.service;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.oti.team2.attachment.dao.IAttachmentDao;
import com.oti.team2.attachment.dto.AttachResponseDto;
import com.oti.team2.attachment.dto.Attachment;
import com.oti.team2.attachment.dto.OTIFilePath;
import com.oti.team2.board.dao.IBoardDao;

import lombok.extern.log4j.Log4j2;

@Service
@Log4j2
public class AttachmentService implements IAttachmentService{
	
	@Autowired
	private IAttachmentDao attachmentDao;
	
	@Autowired
	private IBoardDao boardDao;

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
	@Transactional
	public void deleteAttach(int fileSn) {
		int bbsNo = attachmentDao.selectBbsNoByFilseSn(fileSn);
		attachmentDao.deleteAttachByFileSn(fileSn);
		
		// 해당 게시글의 첨부파일 갯수 보고 게시글의 첨부파일 유무 상태 update
		int countFile = attachmentDao.countFilesByBbsNo(bbsNo);
		if(countFile == 0) {
			log.info("첨부 이제 없다.");
			boardDao.updateAtchYn(bbsNo, 0);
		}
	}
	
	/**
	 * 파일 업로드
	 * @author 신정은
	 */
	public void uploadFiles(List<MultipartFile> mfList, int bbsNo, String dmndNo) throws IllegalStateException, IOException {
		List<Attachment> attachList = new ArrayList<>();
		
		for (MultipartFile mf : mfList) {
			Attachment attch = new Attachment();
			
			if(dmndNo == null) attch.setBbsNo(bbsNo);
			else attch.setDmndNo(dmndNo);
			
			attch.setOrgnlFileNm(mf.getOriginalFilename());

			String fiileName = new Date().getTime() + "-" + mf.getOriginalFilename(); // 저장될 이름
			attch.setFileNm(fiileName);
			attch.setFileSz(mf.getSize());
			attch.setFileType(mf.getContentType());
			attachList.add(attch);
			// 서버 파일 시스템에 파일로 저장
			File file = new File(OTIFilePath.filePath + fiileName);
			mf.transferTo(file);
			log.info(attch);
		}
		attachmentDao.insertAttachment(attachList);
	}
	
	/**
	 * 파일 조회
	 * @author 신정은
	 */
	public List<AttachResponseDto> getAttachFiles(Integer bbsNo, String dmndNo) {
		return attachmentDao.selectAttachByBbsNoOrDmndNo(bbsNo, dmndNo);
	}

}
