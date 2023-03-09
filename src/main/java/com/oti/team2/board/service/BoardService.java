package com.oti.team2.board.service;

import java.io.File;
import java.io.IOException;
import java.net.MalformedURLException;
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
import com.oti.team2.board.dto.Board;
import com.oti.team2.board.dto.BoardListDto;
import com.oti.team2.board.dto.BoardRequestDto;

import lombok.extern.log4j.Log4j2;

@Service
@Log4j2
public class BoardService implements IBoardService {
	@Autowired
	private IBoardDao boardDao;
	
	@Autowired
	private IAttachmentDao attachmentDao;
	
	/**
	 * 공지사항/문의게시판 + 첨부파일 글 저장
	 * @author 신정은
	 */
	@Transactional
	public void addBoard(BoardRequestDto boardRequestDto) throws IllegalStateException, IOException {		
		// attachment 저장
		// board 저장
		boolean atchYn = true;
		if(boardRequestDto.getAttachFile() == null) {
			boardRequestDto.setAtchYn(false);
			atchYn = false;
		} else boardRequestDto.setAtchYn(atchYn);
		boardDao.insertBoard(boardRequestDto);
		
		log.info("key 들어옴 ~~  " + boardRequestDto.getBbsNo());
		log.info(boardRequestDto.getAttachFile());
		log.info(atchYn);
		if (atchYn) {
			boardRequestDto.setAtchYn(true);
			
			List<MultipartFile> mfList = boardRequestDto.getAttachFile();
			List<Attachment> attachList = new ArrayList<>();
			
			for (MultipartFile mf : mfList) {
				Attachment attch = new Attachment();
				attch.setBbsNo(boardRequestDto.getBbsNo());
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
		

	}

	/**
	 * 공지사항/문의게시판 목록 조회
	 * @author 신정은
	 */
	public List<BoardListDto> getBoardList(String type) {
		return boardDao.selectBoardListByBbsType(type);
	}
	
	/**
	 * 공지사항/문의게시판 + 첨부파일  상세 조회
	 * @author 신정은
	 */
	public Board getBoard(int bbsNo) throws MalformedURLException {
		Board board =  boardDao.selectBoardByBbsNo(bbsNo);
		
		if(board.isAtchYn()) {
			List<AttachResponseDto> alist = attachmentDao.selectAttachByBbsNoOrDmndNo(bbsNo, 0);
			board.setSrcList(alist);
		}
		return board;
	}

	/**
	 * 공지사항 조회 시 : 조회수 ++
	 * @author 신정은
	 */
	public void updateInqCnt(int bbsNo) {
		boardDao.updateInqCnt(bbsNo);
	}

}
