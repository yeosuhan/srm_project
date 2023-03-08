package com.oti.team2.board.service;

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
import com.oti.team2.attachment.dto.Attachment;
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
	
	@Transactional
	public void addBoard(BoardRequestDto boardRequestDto) throws IllegalStateException, IOException {		
		// attachment 저장
		// board 저장
		if(boardRequestDto.getAttachFile().size() > 0) boardRequestDto.setAtchYn(true);
		boardDao.insertBoard(boardRequestDto);
		
		log.info("key 들어옴 ~~  " + boardRequestDto.getBbsNo());
		
		if (boardRequestDto.getAttachFile().size() > 0) {
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
				File file = new File("c:/Oti2/" + fiileName);
				mf.transferTo(file);
				log.info(attch);
			}
			attachmentDao.insertAttachment(attachList);
		}
		

	}

	public List<BoardListDto> getBoardList(String type) {
		return boardDao.selectBoardListByBbsType(type);
	}
	
	public Board getBoard(int bbsNo) {
		return boardDao.selectBoardByBbsNo(bbsNo);
	}

}
