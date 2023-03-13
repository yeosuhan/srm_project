package com.oti.team2.progress.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.oti.team2.progress.dto.Progress;
import com.oti.team2.progress.service.IProgressService;

import lombok.extern.log4j.Log4j2;

@Controller
@Log4j2
public class ProgressController {
	
	@Autowired
	IProgressService progressService;
	
	/**
	 * 
	 * @author 여수한
	 * 작성일자 : 2023-02-23
	 * @return sr요청 진척률 조회
	 */
	@ResponseBody
	@RequestMapping(value="/srinformation/progress/list/{srNo}", method=RequestMethod.GET)
	public List<Progress> getProgress(@PathVariable("srNo")String srNo) {
		log.info("srNo: "+ srNo);
		List<Progress> pg = progressService.getProgress(srNo);
		log.info("pg:" + pg);
		return pg;
	}
	/**
	 * 
	 * @author 여수한
	 * 작성일자 : 2023-02-27
	 * @return sr요청 진척률 수정
	 */
	@ResponseBody
	@RequestMapping(value="/srinformation/progress/update", method=RequestMethod.POST)
	public void updateProgress(@RequestParam(value="prgrsRt") int prgrsRt, 
			@RequestParam(value="bgngYmd") String bgngYmd, 
			@RequestParam(value="endYmd") String endYmd,
			@RequestParam(value="prgrsId") int prgrsId,
			@RequestParam(value="prgrsSeNm") String prgrsSeNm,
			String srNo,
			@RequestParam(value="rcvrId",required = false )String rcvrId,
			@RequestParam(value="dmndNo",required = false )String dmndNo) {
			log.info("진척률 수정 시작");
			log.info("prgrsRt: " + prgrsRt);
			log.info("bgngYmd : " + bgngYmd);
			log.info("endYmd : " + endYmd);
			log.info("prgrsId : " + prgrsId);
			log.info("prgrsSeNm : " + prgrsSeNm);
			log.info("srNo : " + srNo);
		progressService.updateProgress(prgrsRt, bgngYmd, endYmd, prgrsId, srNo,prgrsSeNm,rcvrId,dmndNo);
	}
}
