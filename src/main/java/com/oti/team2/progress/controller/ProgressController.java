package com.oti.team2.progress.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.oti.team2.progress.dto.Progress;
import com.oti.team2.progress.service.IProgressService;

@Controller
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
	@RequestMapping(value="/srinformation/progress/{dmndNo}", method=RequestMethod.GET)
	public Progress getProgress(@PathVariable("dmndNo")String dmndNo) {
		Progress pg = progressService.getProgress(dmndNo);
		return pg;
	}
	
}
