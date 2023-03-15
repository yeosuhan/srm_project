package com.oti.team2.board.controller;

import java.io.IOException;
import java.net.MalformedURLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.oti.team2.board.dto.Board;
import com.oti.team2.board.dto.BoardFilterDto;
import com.oti.team2.board.dto.BoardListDto;
import com.oti.team2.board.dto.BoardRequestDto;
import com.oti.team2.board.dto.BoardUpdateDto;
import com.oti.team2.board.dto.SRKeyDto;
import com.oti.team2.board.service.IBoardService;
import com.oti.team2.srinformation.service.ISrinformationService;
import com.oti.team2.util.Auth;
import com.oti.team2.util.pager.Pager;

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
	public String getBoardList(@RequestParam(name = "type", required = true, defaultValue = "qna") String type,
			@ModelAttribute BoardFilterDto boardFilterDto,
			Model model, 
			Authentication auth,
			@RequestParam(required = true, name = "bbsNo", defaultValue = "") String bbsNo,
			@RequestParam(required = true, name = "view", defaultValue = "board") String view,
			@RequestParam(required = true, name = "page", defaultValue = "1") int page) throws MalformedURLException {
		String memberId = auth.getName();
		model.addAttribute("memberId", memberId);
		log.info(memberId);
		log.info(boardFilterDto);
		model.addAttribute("boardFilterDto",boardFilterDto);
		String role = auth.getAuthorities().stream().findFirst().get().toString();
		List<BoardListDto> list = null;
		Pager pager = null;
		//if(type == null) type = boardFilterDto.getType();
		boardFilterDto.setBtype(type);
		if(role.equals(Auth.ROLE_CLIENT.toString()) && type.equals("qna")) {
			pager = new Pager(boardService.getTotalRow(type, memberId, boardFilterDto), page);
			list = boardService.getBoardList(type, memberId, pager, boardFilterDto);
			model.addAttribute("qPager", pager);
			model.addAttribute("qnaList", list);
		}
		else {
			pager = new Pager(boardService.getTotalRow(type, null, boardFilterDto), page);
			list = boardService.getBoardList(type, null, pager, boardFilterDto);
			if(type.equals("qna")) {
				if(role.equals(Auth.ROLE_DEVELOPER.toString())) {
					pager = new Pager(boardService.getcountByEmpId(memberId, boardFilterDto), 1);
					list = boardService.getBoardListByEmpId(memberId, pager, boardFilterDto);
				}
				model.addAttribute("qPager", pager);
				model.addAttribute("qnaList", list);
			} else {
				model.addAttribute("nPager", pager);
				model.addAttribute("noticeList", list);
			}		
		}		
		log.info(pager);
		Board board = null;
		if(!bbsNo.equals("")) {
			board = boardService.getBoard(Integer.parseInt(bbsNo));
			model.addAttribute("board", board);
		}
		else if(list.size()>0) {
			board = boardService.getBoard(list.get(0).getBbsNo());
			model.addAttribute("board", board);
		}
		
		if(view.equals("myportal")) {
			log.info("여기 ~~~~~~");
			log.info(pager);
			return "mytodo/qna";
		}
		if(type.equals("notice")) {
			log.info("notice ~~");
			return "board/noticeList";
		}
		log.info("qna ~~");
		return "board/qnaList";
	}
	
	@GetMapping("/detail")
	public String getBoardList(@RequestParam("bbsNo") int bbsNo, Model model, Authentication auth) throws MalformedURLException {
		String memberId = auth.getName();
		model.addAttribute("memberId", memberId);
		
		Board board = boardService.getBoard(bbsNo);
		log.info(board);
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
	public String updateBoard(BoardUpdateDto updateDto) throws IllegalStateException, IOException{
		log.info(updateDto);
		boardService.updateBoard(updateDto);
		if(updateDto.getBbsType().equals("NOTICE")) return "redirect:/board/list?type=notice";
		return "redirect:/board/list?type=qna";
	}
	
	@GetMapping("/delete/{bbsNo}")
	public String deleteBoard(@PathVariable("bbsNo") int bbsNo, @RequestParam("type") String type){
		log.info("게시판 삭제 들어옴");
		boardService.deleteBoard(bbsNo);
		if(type.equals("qna")) return "redirect:/board/list?type=qna";
		
		return "redirect:/board/list?type=notice";
	}
}
