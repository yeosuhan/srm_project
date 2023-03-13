package com.oti.team2.member.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.oti.team2.board.dto.BoardListDto;
import com.oti.team2.board.service.IBoardService;
import com.oti.team2.srdemand.dto.MytodoSrListDto;
import com.oti.team2.srdemand.service.ISrDemandService;
import com.oti.team2.srinformationhistory.dto.MyTodoHistoryListDto;
import com.oti.team2.srinformationhistory.service.ISrInformationHistoryService;
import com.oti.team2.util.Auth;
import com.oti.team2.util.pager.Pager;

import lombok.extern.log4j.Log4j2;

@Controller
@Log4j2
public class MainController {

	@Autowired
	private ISrDemandService srdemandService;
	
	@Autowired
	private IBoardService boardService;

	@Autowired
	private ISrInformationHistoryService srInformationHistoryService;

	@GetMapping("/myportal")
	public String mypotal(Authentication auth, Model model) {
		String role = auth.getAuthorities().stream().findFirst().get().toString();
		String memberId = auth.getName();
		model.addAttribute("memberId", memberId);
		
		List<MytodoSrListDto> srList = null;
		List<BoardListDto> qnaList = null;
		List<BoardListDto> noticeList = null;
		Pager qPager = null; // qna 페이저
		Pager nPager = null; // notice 페이저
		Pager pager = null;  //sr페이저
		int rtotal = 0;
		int dtotal = 0;
		int atotal = 0;
		
		//공지사항
		nPager = new Pager(boardService.getTotalRow("notice", null), 1);
		noticeList = boardService.getBoardList("notice", null, nPager);
		
		if (role.equals(Auth.ROLE_CLIENT.toString())) {
			pager = srdemandService.getcountsByCustIdOrPicIdAndSttsCd(auth.getName(), null, 0, 1);
			rtotal = srdemandService.getcountsByCustIdOrPicIdAndSttsCd(auth.getName(), null, 2, 1).getTotalRows();
			srList = srdemandService.getMytodoSrList(auth.getName(), null, 0, pager);			
			// qna
			qPager = new Pager(boardService.getTotalRow("qna", memberId), 1);
			qnaList = boardService.getBoardList("qna", memberId, qPager);
		}
		else if (role.equals(Auth.ROLE_DEVELOPER.toString())) {
			pager = srdemandService.getcountsByEmpIdAndSttsCd(auth.getName(), 3, 1);
			dtotal = pager.getTotalRows();
			srList = srdemandService.getMytodoSrListForDeveloper(auth.getName(), 3, pager);
		} 
		else {
			pager = srdemandService.getcountsByCustIdOrPicIdAndSttsCd(null, auth.getName(), 0, 1);
			atotal = srdemandService.getcountsByCustIdOrPicIdAndSttsCd(null, auth.getName(), 0, 1).getTotalRows();
			srList = srdemandService.getMytodoSrList(null, auth.getName(), 0, pager);

			qPager = new Pager(boardService.getTotalRow("qna", null), 1);
			qnaList = boardService.getBoardList("qna", null, qPager);
		}
		model.addAttribute("srList", srList);
		model.addAttribute("pager", pager);
		model.addAttribute("atotal", atotal); // 관리자는 [요청]건의 총 수를 보여준다.
		model.addAttribute("rtotal", rtotal); // 사용자는 [접수]건의 총 수를 보여준다.
		model.addAttribute("dtotal", dtotal); // 개발자는  [개발]건의 총 수를 보여준다.
		model.addAttribute("qnaList", qnaList);
		model.addAttribute("qPager", qPager);
		model.addAttribute("noticeList", noticeList);
		model.addAttribute("nPager", nPager);
		return "member/my-todo";
	}

	@GetMapping("/myportal/mytodo")
	public String mytodo(Authentication auth, Model model,
			@RequestParam(required = true, name = "sttsCd", defaultValue = "0") int stts,
			@RequestParam(required = true, name = "page", defaultValue = "1") int pageNo) {

		String role = auth.getAuthorities().stream().findFirst().get().toString();
		List<MytodoSrListDto> srList = null;
		Pager pager = null;
		log.info("stts   : " + stts);

		if (role.equals(Auth.ROLE_CLIENT.toString())) {
			pager = srdemandService.getcountsByCustIdOrPicIdAndSttsCd(auth.getName(), null, stts, pageNo);
			srList = srdemandService.getMytodoSrList(auth.getName(), null, stts, pager);
		} else if (role.equals(Auth.ROLE_DEVELOPER.toString())) {
			pager = srdemandService.getcountsByEmpIdAndSttsCd(auth.getName(), stts, pageNo);
			srList = srdemandService.getMytodoSrListForDeveloper(auth.getName(), stts, pager);
		} else {
			pager = srdemandService.getcountsByCustIdOrPicIdAndSttsCd(null, auth.getName(), stts, pageNo);
			srList = srdemandService.getMytodoSrList(null, auth.getName(), stts, pager);
		}

		model.addAttribute("srList", srList);
		model.addAttribute("pager", pager);
		model.addAttribute("sttsCd", stts);
		return "mytodo/srTable";
	}

	/**
	 * 나의 할 일에서 히스토리 내역 보여주기
	 *
	 * @author 최은종
	 * @param pageNo, model, auth
	 * @return 히스토리 탭 경로 리턴
	 * 
	 */
	@GetMapping("/myportal/mytodo/history")
	public String mytodo(Authentication auth, Model model,
			@RequestParam(required = true, name = "page", defaultValue = "1") int pageNo) {
		log.info("컨트롤러");

		String authRole = auth.getAuthorities().stream().findFirst().get().toString();

		int totalRows = srInformationHistoryService.getTotalRows();
		Pager pager = new Pager(totalRows, pageNo);

		List<MyTodoHistoryListDto> todoHstryList = null;

		if (authRole.equals("ROLE_ADMIN")) {
			log.info("나는 관리자");
			todoHstryList = srInformationHistoryService.getHstryTodoByPicId(pager, auth.getName());
		} else if (authRole.equals("ROLE_DEVELOPER")) {
			log.info("나는 개발자");
			todoHstryList = srInformationHistoryService.getHstryTodoByEmpId(pager, auth.getName(), auth.getName());
		} else {
			log.info("나는 고객");
			todoHstryList = srInformationHistoryService.getHstryTodoByCustId(pager, auth.getName());
		}

		model.addAttribute("todoHstryList", todoHstryList);
		model.addAttribute("authRole", authRole);
		model.addAttribute("pager", pager);

		log.info(todoHstryList);
		return "mytodo/srHstryTable";
	}

}
