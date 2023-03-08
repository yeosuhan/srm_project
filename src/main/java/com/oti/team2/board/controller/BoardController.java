package com.oti.team2.board.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.oti.team2.board.dto.SRKeyDto;
import com.oti.team2.srinformation.service.ISrinformationService;

@Controller
@RequestMapping("/board")
public class BoardController {
	
	@Autowired
	private ISrinformationService srinformationService;

	
	@GetMapping("/list")
	public String getBoardList(@RequestParam("type") String type, Model model) {
		if(type.equals("notice")) {
			return "board/noticeList";
		}
		return "board/qnaList";
	}
	
	// 문의사항 작성을 위해 현재 사용자의 요청번호 모두 가져오기
	@GetMapping("/write")
	public String getSrNoList(Authentication auth, Model model) {
		String clientId = auth.getName();
		 List<SRKeyDto> list = srinformationService.getSrNoAndDmndNo(clientId);
		 model.addAttribute("srList", list);
		 model.addAttribute("clientId", clientId);
		 return "board/qna-write";
	}
}
