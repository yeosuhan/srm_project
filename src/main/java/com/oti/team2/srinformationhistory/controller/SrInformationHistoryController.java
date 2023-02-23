package com.oti.team2.srinformationhistory.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.oti.team2.srinformationhistory.dto.SrHistoryListDto;
import com.oti.team2.srinformationhistory.dto.SrInformationHistory;
import com.oti.team2.srinformationhistory.service.ISrInformationHistoryService;
import com.oti.team2.util.pager.Pager;

import lombok.extern.log4j.Log4j2;

@RestController // 리턴값에 자동으로 ResponseBody 붙어서 리턴
@Log4j2
@RequestMapping("/history")
public class SrInformationHistoryController {

	@Autowired
	private ISrInformationHistoryService srInformationHistoryService;

	@GetMapping("/list/{srNo}")
	public SrHistoryListDto getSrInformationHistoryList(@RequestParam(defaultValue = "1") int pageNO,
			@PathVariable("srNo") String srNo) {
		log.info("srInformationHistoryList 조회");

		int totalRows = srInformationHistoryService.getTotalRows();
		Pager pager = new Pager(totalRows, pageNO);
		//${srInformationHistory.srNo}
		//srNo = "WOR-SR-0001";
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

	@GetMapping("/detail")
	public SrInformationHistory getSrInformationHistory(int hstryId, Model model) {
		log.info("srInformationHistory 상세조회");

		SrInformationHistory srInformationHistory = srInformationHistoryService.getSrInformationHistory(hstryId);
		model.addAttribute("srInformationHistory", srInformationHistory);

		return srInformationHistory;
	}
}
