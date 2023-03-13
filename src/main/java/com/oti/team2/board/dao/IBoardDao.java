package com.oti.team2.board.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.oti.team2.board.dto.Board;
import com.oti.team2.board.dto.BoardListDto;
import com.oti.team2.board.dto.BoardRequestDto;
import com.oti.team2.board.dto.BoardUpdateDto;
import com.oti.team2.util.pager.Pager;

public interface IBoardDao {
	/**
	 * 공지사항/문의게시판 + 첨부파일 글 저장
	 * @author 신정은
	 */
	int insertBoard(BoardRequestDto boardRequestDto);
	
	/**
	 * 공지사항/문의게시판 목록 페이징 처리
	 * @author 신정은
	 */
	int countTotalByBbsType(@Param("type")String type, @Param("clientId")String clientId);
	
	/**
	 * 공지사항/문의게시판 목록 조회
	 * @author 신정은
	 */
	List<BoardListDto> selectBoardListByBbsType(@Param("type")String type, @Param("clientId")String clientId, @Param("pager")Pager pager);
	
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
	
	/**
	 * 게시글의 첨부파일 존재 유무 상태 update
	 * @author 신정은
	 */
	int updateAtchYn(@Param("bbsNo")int bbsNo, @Param("status")int status);

	/**
	 * 게시글 삭제
	 * @author 신정은
	 */
	void deleteBoardByBbsNo(int bbsNo);
}
