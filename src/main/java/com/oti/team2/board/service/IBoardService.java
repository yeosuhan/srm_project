package com.oti.team2.board.service;

import java.io.IOException;
import java.net.MalformedURLException;
import java.util.List;

import com.oti.team2.board.dto.Board;
import com.oti.team2.board.dto.BoardFilterDto;
import com.oti.team2.board.dto.BoardListDto;
import com.oti.team2.board.dto.BoardRequestDto;
import com.oti.team2.board.dto.BoardUpdateDto;
import com.oti.team2.util.pager.Pager;

public interface IBoardService {
	/**
	 * 공지사항/문의게시판 + 첨부파일 글 저장
	 * @author 신정은
	 */
	void addBoard(BoardRequestDto boardRequestDto) throws IllegalStateException, IOException;
	
	/**
	 * 공지사항/문의게시판 목록 페이징 처리
	 * @author 신정은
	 */
	int getTotalRow(String type, String clientId, BoardFilterDto boardFilterDto);
	
	/**
	 * 공지사항/문의게시판 목록 조회
	 * @author 신정은
	 */
	List<BoardListDto> getBoardList(String type, String clientId, Pager pager, BoardFilterDto boardFilterDto);
	
	/**
	 * 공지사항/문의게시판 + 첨부파일  상세 조회
	 * @author 신정은
	 */
	Board getBoard(int bbsNo) throws MalformedURLException;
	
	/**
	 * 공지사항 조회 시 : 조회수 ++
	 * @author 신정은
	 */
	void updateInqCnt(int bbsNo);
	
	/**
	 * 게시글 수정
	 * @author 신정은
	 */
	void updateBoard(BoardUpdateDto boardUpdateDto) throws IllegalStateException, IOException;
	
	/**
	 * 게시글 삭제
	 * @author 신정은
	 */
	void deleteBoard(int bbsNo);
	
	/**
	 * 관련개발자의 문의게시글의 총 행수
	 * @author 신정은
	 */
	int getcountByEmpId(String empId, BoardFilterDto boardFilterDto);
	
	/**
	 * 관련개발자의 문의게시판 목록 조회
	 * @author 신정은
	 */
	List<BoardListDto> getBoardListByEmpId(String empId, Pager pager, BoardFilterDto boardFilterDto);
}
