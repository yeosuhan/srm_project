package com.oti.team2.srinformation.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.oti.team2.srinformation.dto.SrdemandDetail;
import com.oti.team2.srinformation.dto.SrinformationList;
import com.oti.team2.srinformation.service.ISrinformationService;

import lombok.extern.log4j.Log4j2;

@Controller
@Log4j2
public class SrinformationController {
	
	@Autowired
	ISrinformationService srinformationService;
	
	/**
	 * 
	 * @author 여수한
	 * 작성일자 : 2023-02-22
	 * @return sr요청 상세 조회
	 */
	@RequestMapping(value="/srinformationlist", method=RequestMethod.GET)
	public String getList(Model model) {
		List<SrinformationList> srlist = srinformationService.getList();
		model.addAttribute("srlist", srlist);
		return "srInfo/srInformationList";
	}
	
	/**
	 * 
	 * @author 여수한
	 * 작성일자 : 2023-02-22
	 * @return sr요청 상세 조회
	 */
	@ResponseBody
	@RequestMapping(value="/srinformation/{dmndNo}", method=RequestMethod.GET)
	public SrdemandDetail getDetail(@PathVariable("dmndNo")String dmndNo, Model model) {
		SrdemandDetail dd = srinformationService.getInfoDetail(dmndNo);
		return dd;
	}
}
