package com.oti.team2.srinformationhistory.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.oti.team2.srinformationhistory.dto.SrHistoryDetailDto;
import com.oti.team2.srinformationhistory.dto.SrHistoryListDto;
import com.oti.team2.srinformationhistory.dto.SrInformationHistory;
import com.oti.team2.srinformationhistory.service.ISrInformationHistoryService;
import com.oti.team2.util.pager.Pager;

import lombok.extern.log4j.Log4j2;

@Controller
@Log4j2
@RequestMapping("/history")
public class SrInformationHistoryController {

	@Autowired
	private ISrInformationHistoryService srInformationHistoryService;

	/**
	 * SR처리 히스토리 내역 조회 메서드
	 *
	 * @author 최은종
	 * @param pageNo, dmndNo/srNo 각 요청번호의 히스토리 목록을 조회하고 페이징처리를 하기 위해 pageNo와 sr번호를
	 *        매개변수로 설정함
	 * @return srHistoryList 히스토리 리스트와 페이징 객체를 담은 Dto 리턴
	 */
	@ResponseBody
	@GetMapping("/list")
	public SrHistoryListDto getSrInformationHistoryList(@RequestParam String dmndNo, @RequestParam(defaultValue = "1") int pageNo, Authentication auth) {
		log.info("srInformationHistoryList 조회");

		int totalRows = srInformationHistoryService.getTotalRows();
		Pager pager = new Pager(totalRows, pageNo);
		log.info("pageNo 조회" + pageNo);

		String srNo = srInformationHistoryService.getSrNo(dmndNo);
		log.info("dmndNo 조회" + dmndNo);

		String role = auth.getAuthorities().stream().findFirst().get().toString();
		log.info("role 조회" + role);

		List<SrInformationHistory> srInformationHistory = srInformationHistoryService
				.getSrInformationHistoryListForClient(srNo, pager, role);

		log.info("srInformationHistoryList 조회" + srInformationHistory);
		log.info("srNo 조회" + srNo);
		SrHistoryListDto srHistoryList = new SrHistoryListDto();
		srHistoryList.setSrInformationHistory(srInformationHistory);
		srHistoryList.setPager(pager);

		log.info("srHistoryList 조회" + srHistoryList);
		return srHistoryList;
	}

	@ResponseBody
	@GetMapping("/emp/list")
	public SrHistoryListDto getSrInformationHistoryList(@RequestParam(defaultValue = "1") int pageNo,
			@RequestParam String srNo) {
		log.info("srInformationHistoryList 조회");

		int totalRows = srInformationHistoryService.getTotalRows();
		Pager pager = new Pager(totalRows, pageNo);

		List<SrInformationHistory> srInformationHistory = srInformationHistoryService.getSrInformationHistoryList(pager,
				srNo);
		log.info("srInformationHistoryList 조회" + srInformationHistory);
		log.info("srNo 조회" + srNo);
		SrHistoryListDto srHistoryList = new SrHistoryListDto();
		srHistoryList.setSrInformationHistory(srInformationHistory);
		srHistoryList.setPager(pager);

		log.info("srHistoryList 조회" + srHistoryList);
		return srHistoryList;
	}

	/**
	 * SR처리 히스토리 상세 조회 메서드
	 *
	 * @author 최은종
	 * @param hstryId 히스토리 목록에서 하나의 히스토리를 상세 조회하기 위해 hstryId를 매개변수로 설정
	 * @return srHistoryDetailDto 상세 내용을 담은 srHistoryDetailDto 리턴
	 */
	@ResponseBody
	@GetMapping("/detail/{hstryId}")
	public SrHistoryDetailDto getSrInformationHistory(@PathVariable("hstryId") int hstryId, Authentication auth) {
		log.info("srInformationHistory 상세조회");

		SrHistoryDetailDto srHistoryDetailDto = srInformationHistoryService.getSrInformationHistory(hstryId);
		srHistoryDetailDto.setAuth(auth.getAuthorities().stream().findFirst().get().toString());
		log.info(hstryId);
		log.info("srHistoryDetailDto 조회 : " + srHistoryDetailDto + "/" + "hstryId : " + hstryId);

		return srHistoryDetailDto;
	}

	/**
	 * SR처리 히스토리 등록 & 요청결재 메서드 (POST)
	 *
	 * @author 최은종
	 * @param SrInformationHistory 객체에 데이터를 입출력하기 위해 매개변수로 설정
	 * @return 진척정보 페이지 리턴
	 * @see 개발자(히스토리 등록), 관리자(히스토리 등록&등록 요청에 대한 수락상태 업데이트)
	 */
	@PostMapping("/add")
	public String addSrInformationHistory(SrInformationHistory srInformationHistory, Authentication auth) {
		log.info("addSrInformationHistory 등록");

		String role = auth.getAuthorities().stream().findFirst().get().toString();
		log.info("role 조회" + role);

		if (role.equals("ROLE_CLIENT")) {
			String srNo = srInformationHistoryService.getSrNo(srInformationHistory.getSrNo());
			srInformationHistory.setSrNo(srNo);
		}

		srInformationHistoryService.addSrInformationHistory(srInformationHistory, role);
		log.info("컨트롤러" + srInformationHistory);

		if (!role.equals("ROLE_CLIENT")) {
			return "redirect:/srinformation/list";
		} else {
			return "redirect:/srdemand/list";
		}
	}

	/**
	 * SR처리 히스토리 수정 메서드 (POST)
	 *
	 * @author 최은종
	 * @param SrInformationHistory 객체에 데이터를 입출력하기 위해 매개변수로 설정
	 * @return 진척정보 페이지 리턴
	 * @see 개발자, 관리자 (자신의 글에 한해 수정 가능, 결재처리 전에만 수정 가능)
	 */
	@PostMapping("/modify")
	public String updateHstry(SrInformationHistory srInformationHistory) {
		log.info("컨트롤러: 수정");
		log.info(srInformationHistory.getHstryType());

		srInformationHistoryService.updateHstry(srInformationHistory);
		log.info("컨트롤러22: 수정");
		return "redirect:/srinformation/list";
	}
}
