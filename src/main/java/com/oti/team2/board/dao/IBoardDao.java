package com.oti.team2.board.dao;

import java.util.List;

import com.oti.team2.board.dto.Board;
import com.oti.team2.board.dto.BoardListDto;
import com.oti.team2.board.dto.BoardRequestDto;

public interface IBoardDao {
	int insertBoard(BoardRequestDto boardRequestDto);
	
	List<BoardListDto> selectBoardListByBbsType(String type);
	
	Board selectBoardByBbsNo(int bbsNo);
}
