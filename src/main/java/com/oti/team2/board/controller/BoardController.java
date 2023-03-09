package com.oti.team2.board.controller;

import java.io.IOException;
import java.net.MalformedURLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.oti.team2.board.dto.Board;
import com.oti.team2.board.dto.BoardListDto;
import com.oti.team2.board.dto.BoardRequestDto;
import com.oti.team2.board.dto.SRKeyDto;
import com.oti.team2.board.dto.boardUpdateDto;
import com.oti.team2.board.service.IBoardService;
import com.oti.team2.srinformation.service.ISrinformationService;
import com.oti.team2.util.Auth;

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
	public String getBoardList(@RequestParam("type") String type, Model model) throws MalformedURLException {
		List<BoardListDto> list = boardService.getBoardList(type);
		model.addAttribute("list", list);
		//log.info(list);
		
		Board board = null;
		if(list.size()>0) {
			board = boardService.getBoard(list.get(0).getBbsNo());
			model.addAttribute("board", board);
		}
		
		if(type.equals("notice")) {
			return "board/noticeList";
		}
		return "board/qnaList";
	}
	
	@GetMapping("/detail")
	public String getBoardList(@RequestParam("bbsNo") int bbsNo, Model model) throws MalformedURLException {
		Board board = boardService.getBoard(bbsNo);
		//log.info(board);
		model.addAttribute("board", board);
		
		if(board.getBbsType().equals("NOTICE")) {
			// 조회수 +1 증가
			//log.info("조회수 증가 ~~~ ");
			boardService.updateInqCnt(bbsNo);
			return "board/notice-detail";
		}
		
		return "board/qna-detail";
	}
	
	// 문의사항 작성을 위해 현재 사용자의 요청번호 모두 가져오기
	@GetMapping("/write")
	public String getSrNoList(@RequestParam("type") String type, Authentication auth, Model model) {
		String clientId = auth.getName();
		String role = auth.getAuthorities().stream().findFirst().get().toString();
		model.addAttribute("clientId", clientId);
//		log.info(role);
		if(type.equals("qna") && role.equals(Auth.ROLE_CLIENT.toString())) {
			List<SRKeyDto> list = srinformationService.getSrNoAndDmndNo(clientId);
			model.addAttribute("srList", list);
//			log.info(list);
			return "board/qna-write";		
		}
		return "board/notice-write";
	}
	
	@PostMapping("/write")
	public String postBoard(BoardRequestDto boardRequestDto) throws IllegalStateException, IOException {
		log.info(boardRequestDto);
		
		boardService.addBoard(boardRequestDto);
		if(boardRequestDto.getBbsType().equals("NOTICE")) return "redirect:/board/list?type=notice";
		return "redirect:/board/list?type=qna";
	}
	
	@GetMapping("/update/{bbsNo}")
	public String getUpdateForm(@PathVariable("bbsNo") int bbsNo, Authentication auth, Model model) throws MalformedURLException {
		Board board = boardService.getBoard(bbsNo);
		model.addAttribute("board", board);
		log.info(board);
		if(board.getBbsType().equals("QNA")) return "board/qna-update";
		
		return "board/notice-update";
	}
	
	@PostMapping("/update")
	public String getUpdateForm(boardUpdateDto updateDto){
		log.info(updateDto);	
		if(updateDto.getBbsType().equals("NOTICE")) return "redirect:/board/list?type=notice";
		return "redirect:/board/list?type=qna";
	}
}
