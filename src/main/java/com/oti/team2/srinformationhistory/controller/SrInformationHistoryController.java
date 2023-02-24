package com.oti.team2.srinformationhistory.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.oti.team2.srinformationhistory.dto.SrHistoryDetailDto;
import com.oti.team2.srinformationhistory.dto.SrHistoryListDto;
import com.oti.team2.srinformationhistory.dto.SrInformationHistory;
import com.oti.team2.srinformationhistory.service.ISrInformationHistoryService;
import com.oti.team2.util.pager.Pager;

import lombok.extern.log4j.Log4j2;

@RestController
@Log4j2
@RequestMapping("/history")
public class SrInformationHistoryController {

	@Autowired
	private ISrInformationHistoryService srInformationHistoryService;

	/**
	 * SR처리 히스토리 내역 조회 메서드
	 *
	 * @author 최은종
	 * @param pageNo, srNo srNo의 히스토리 목록을 조회하고 페이징처리를 하기 위해 pageNo와 srNo를 매개변수로 설정함
	 * @return srHistoryList 히스토리 리스트와 페이징 객체를 담은 Dto 리턴
	 */
	/*
	 * @GetMapping("/list/{srNo}") public SrHistoryListDto
	 * getSrInformationHistoryList(@RequestParam(defaultValue = "1") int pageNO,
	 * 
	 * @PathVariable("srNo") String srNo) { log.info("srInformationHistoryList 조회");
	 * 
	 * int totalRows = srInformationHistoryService.getTotalRows(); Pager pager = new
	 * Pager(totalRows, pageNO); //${srInformationHistory.srNo} //srNo =
	 * "WOR-SR-0001"; List<SrInformationHistory> srInformationHistory =
	 * srInformationHistoryService.getSrInformationHistoryList(pager, srNo);
	 * log.info("srInformationHistoryList 조회" + srInformationHistory);
	 * log.info("srNo 조회" + srNo); SrHistoryListDto srHistoryList = new
	 * SrHistoryListDto();
	 * srHistoryList.setSrInformationHistory(srInformationHistory);
	 * srHistoryList.setPager(pager);
	 * 
	 * log.info("srHistoryList 조회" + srHistoryList); return srHistoryList; }
	 */

	@GetMapping("/list")
	public SrHistoryListDto getSrInformationHistoryList(@RequestParam(defaultValue = "1") int pageNO,
			@RequestParam String dmndNo) {
		log.info("srInformationHistoryList 조회");

		int totalRows = srInformationHistoryService.getTotalRows();
		Pager pager = new Pager(totalRows, pageNO);
		String srNo = srInformationHistoryService.getSrNo(dmndNo);
		// ${srInformationHistory.srNo}
		// srNo = "WOR-SR-0001";
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
	@GetMapping("/detail/{hstryId}")
	public SrHistoryDetailDto getSrInformationHistory(@PathVariable("hstryId") int hstryId) {
		log.info("srInformationHistory 상세조회");

		SrHistoryDetailDto srHistoryDetailDto = srInformationHistoryService.getSrInformationHistory(hstryId);
		log.info(hstryId);
		log.info("srHistoryDetailDto 조회 : " + srHistoryDetailDto + "/" + "hstryId : " + hstryId);

		return srHistoryDetailDto;
	}
}
