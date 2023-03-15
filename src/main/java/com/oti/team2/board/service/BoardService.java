package com.oti.team2.board.service;

import java.io.IOException;
import java.net.MalformedURLException;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.oti.team2.attachment.dto.AttachResponseDto;
import com.oti.team2.attachment.service.IAttachmentService;
import com.oti.team2.board.dao.IBoardDao;
import com.oti.team2.board.dto.Board;
import com.oti.team2.board.dto.BoardFilterDto;
import com.oti.team2.board.dto.BoardListDto;
import com.oti.team2.board.dto.BoardRequestDto;
import com.oti.team2.board.dto.BoardUpdateDto;
import com.oti.team2.comment.dto.CommentDto;
import com.oti.team2.comment.service.ICommentService;
import com.oti.team2.util.pager.Pager;

import lombok.extern.log4j.Log4j2;

@Service
@Log4j2
public class BoardService implements IBoardService {
	@Autowired
	private IBoardDao boardDao;
	
	@Autowired
	private IAttachmentService attachmentService;
	
	@Autowired
	private ICommentService commentService;
	
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
		
		if (atchYn) {	
			attachmentService.uploadFiles(boardRequestDto.getAttachFile(), boardRequestDto.getBbsNo(), null);
		}	
	}

	/**
	 * 공지사항/문의게시판 목록 페이징 처리
	 * @author 신정은
	 */
	public int getTotalRow(String type, String clientId, BoardFilterDto boardFilterDto) {
		return boardDao.countTotalByBbsType(type, clientId, boardFilterDto);
	}
	
	/**
	 * 공지사항/문의게시판 목록 조회
	 * @author 신정은
	 */
	public List<BoardListDto> getBoardList(String type, String clientId, Pager pager, BoardFilterDto boardFilterDto) {
		return boardDao.selectBoardListByBbsType(type, clientId, pager, boardFilterDto);
	}
	
	/**
	 * 공지사항/문의게시판 + 첨부파일  상세 조회
	 * @author 신정은
	 */
	public Board getBoard(int bbsNo) throws MalformedURLException {
		Board board =  boardDao.selectBoardByBbsNo(bbsNo);
		
		if(board.isAtchYn()) {
			List<AttachResponseDto> alist = attachmentService.getAttachFiles(bbsNo, null);
			board.setSrcList(alist);
		}
		if(board.getBbsType().equals("QNA")) {
			CommentDto comments = commentService.getComments(bbsNo, 1);
			board.setComments(comments);
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

	/**
	 * 게시글 수정
	 * @author 신정은
	 */
	public void updateBoard(BoardUpdateDto boardUpdateDto) throws IllegalStateException, IOException {
		int row = boardDao.updateTtlAndCn(boardUpdateDto);
		
		if(boardUpdateDto.getNattachFile().get(0).getSize() != 0) {
			log.info("첨부파일 있어요");
			attachmentService.uploadFiles(boardUpdateDto.getNattachFile(), boardUpdateDto.getBbsNo(), null);
			boardDao.updateAtchYn(boardUpdateDto.getBbsNo(), 1);
		}
	}

	/**
	 * 게시글 삭제
	 * @author 신정은
	 */
	public void deleteBoard(int bbsNo) {
		boardDao.deleteBoardByBbsNo(bbsNo);
	}

	/**
	 * 관련개발자의 문의게시글의 총 행수
	 * @author 신정은
	 */
	public int getcountByEmpId(String empId, BoardFilterDto boardFilterDto) {
		return boardDao.countByEmpId(empId, boardFilterDto);
	}
	
	/**
	 * 관련개발자의 문의게시판 목록 조회
	 * @author 신정은
	 */
	public List<BoardListDto> getBoardListByEmpId(String empId, Pager pager,  BoardFilterDto boardFilterDto) {
		return boardDao.selectBoardByEmpId(empId, pager, boardFilterDto);
	}

}
