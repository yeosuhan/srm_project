package com.oti.team2.board.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.oti.team2.board.dto.Board;
import com.oti.team2.board.dto.BoardListDto;
import com.oti.team2.board.dto.BoardRequestDto;
import com.oti.team2.board.dto.BoardUpdateDto;

public interface IBoardDao {
	/**
	 * 공지사항/문의게시판 + 첨부파일 글 저장
	 * @author 신정은
	 */
	int insertBoard(BoardRequestDto boardRequestDto);
	
	/**
	 * 공지사항/문의게시판 목록 조회
	 * @author 신정은
	 */
	List<BoardListDto> selectBoardListByBbsType(String type);
	
	/**
	 * 공지사항/문의게시판 + 첨부파일  상세 조회
	 * @author 신정은
	 */
	Board selectBoardByBbsNo(@Param("bbsNo")int bbsNo);
	
	/**
	 * 공지사항 조회 시 : 조회수 ++
	 * @author 신정은
	 */
	int updateInqCnt(@Param("bbsNo")int bbsNo);
	
	/**
	 * 게시글 수정
	 * @author 신정은
	 */
	int updateTtlAndCn(BoardUpdateDto boardUpdateDto);
}
