package com.oti.team2.board.service;

import java.io.IOException;
import java.util.List;

import com.oti.team2.board.dto.Board;
import com.oti.team2.board.dto.BoardListDto;
import com.oti.team2.board.dto.BoardRequestDto;

public interface IBoardService {
	void addBoard(BoardRequestDto boardRequestDto) throws IllegalStateException, IOException;
	
	List<BoardListDto> getBoardList(String type);
	
	Board getBoard(int bbsNo);
}
