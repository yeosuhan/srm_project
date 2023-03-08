package com.oti.team2.board.controller;

import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.oti.team2.board.dto.Board;
import com.oti.team2.board.dto.BoardListDto;
import com.oti.team2.board.dto.BoardRequestDto;
import com.oti.team2.board.dto.SRKeyDto;
import com.oti.team2.board.service.IBoardService;
import com.oti.team2.srinformation.service.ISrinformationService;

import lombok.extern.log4j.Log4j2;

@Controller
@RequestMapping("/board")
@Log4j2
public class BoardController {
	
	@Autowired
	private ISrinformationService srinformationService;
	
	@Autowired
	private IBoardService boardService;

	
	@GetMapping("/list")
	public String getBoardList(@RequestParam("type") String type, Model model) {
		List<BoardListDto> list = boardService.getBoardList(type);
		Board board = boardService.getBoard(list.get(0).getBbsNo());
		model.addAttribute("list", list);
		model.addAttribute("board", board);
		
		if(type.equals("notice")) {
			return "board/noticeList";
		}
		return "board/qnaList";
	}
	
	@GetMapping("/detail")
	public String getBoardList(@RequestParam("bbsNo") int bbsNo, Model model) {
		Board board = boardService.getBoard(bbsNo);
		model.addAttribute("board", board);
		
		if(board.equals("NOTICE")) {
			return "board/noticeList";
		}
		return "board/qna-detail";
	}
	
	// 문의사항 작성을 위해 현재 사용자의 요청번호 모두 가져오기
	@GetMapping("/write")
	public String getSrNoList(Authentication auth, Model model) {
		String clientId = auth.getName();
		 List<SRKeyDto> list = srinformationService.getSrNoAndDmndNo(clientId);
		 model.addAttribute("srList", list);
		 model.addAttribute("clientId", clientId);
		 log.info(list);
		 return "board/qna-write";
	}
	
	@PostMapping("/write")
	public String postBoard(BoardRequestDto boardRequestDto) throws IllegalStateException, IOException {
		log.info(boardRequestDto);
		
		boardService.addBoard(boardRequestDto);
		return "redirect:/board/list?type=qna";
	}
}
