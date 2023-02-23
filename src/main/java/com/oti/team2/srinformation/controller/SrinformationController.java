package com.oti.team2.srinformation.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.oti.team2.srdemand.service.ISrDemandService;
import com.oti.team2.srdemand.service.SrDemandService;
import com.oti.team2.srinformation.dto.SrTotal;
import com.oti.team2.srinformation.dto.SrdemandDetail;
import com.oti.team2.srinformation.dto.SrinformationList;
import com.oti.team2.srinformation.dto.SrplanInfomaion;
import com.oti.team2.srinformation.service.ISrinformationService;

import lombok.extern.log4j.Log4j2;

@Controller
@Log4j2
public class SrinformationController {
	
	@Autowired
	ISrinformationService srinformationService;
	
	@Autowired
	ISrDemandService srDemandService;
	
	/**
	 * 
	 * @author 여수한
	 * 작성일자 : 2023-02-22
	 * @return sr진척 목록 조회 - 완료
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
	 * @return sr요청 상세 조회 - 완료  => 계획정보도 같이 가져와야될듯
	 */
	@ResponseBody
	@RequestMapping(value="/srinformation/{Detail}", method=RequestMethod.GET)
	public SrTotal getDetail(@PathVariable("Detail")String Detail, Model model) {
		
		String Plan = Detail;
		SrdemandDetail dd = srDemandService.getInfoDetail(Detail);
		SrplanInfomaion pi = srinformationService.getPlan(Plan);
		SrTotal total = new SrTotal(dd,pi);
		log.info(total);
		return total;
	}
	
	/**
	 * 
	 * @author 여수한
	 * 작성일자 : 2023-02-23
	 * @return sr요청 계획정보 조회 - 탭 누를 때
	 */
	@ResponseBody
	@RequestMapping(value="/srinformation1/{Plan}", method=RequestMethod.GET)
	public SrplanInfomaion getPlanInfo(@PathVariable("Plan")String Plan, Model model) {
		SrplanInfomaion pi = srinformationService.getPlan(Plan);
		return pi;
	}

	
	
	
	
	
	
	
	
	
	
	
	/**
	 * 
	 * @author 여수한
	 * 작성일자 : 2023-02-23
	 * @return sr요청 진척률 조회
	 *//*
	@ResponseBody
	@RequestMapping(value="/srinformation/{dmndNo}", method=RequestMethod.GET)
	public SrdemandDetail getProgress(@PathVariable("dmndNo")String dmndNo, Model model) {
		return null;
	}
	
	*//**
	 * 
	 * @author 여수한
	 * 작성일자 : 2023-02-23
	 * @return sr요청 진척률 수정
	 *//*
	@ResponseBody
	@RequestMapping(value="/srinformation/{dmndNo}", method=RequestMethod.POST)
	public SrdemandDetail updateProgress(@PathVariable("dmndNo")String dmndNo, Model model) {
		return null;
	}
	
	*//**
	 * 
	 * @author 여수한
	 * 작성일자 : 2023-02-23
	 * @return sr요청 산출물 조회
	 *//*
	@ResponseBody
	@RequestMapping(value="/srinformation/{dmndNo}", method=RequestMethod.GET)
	public SrdemandDetail getDeliverbles(@PathVariable("dmndNo")String dmndNo, Model model) {
		return null;
	}
	
	*//**
	 * 
	 * @author 여수한	
	 * 작성일자 : 2023-02-23
	 * @return sr요청 산출물 저장 및 삭제 및 추가
	 *//*
	@ResponseBody
	@RequestMapping(value="/srinformation/{dmndNo}", method=RequestMethod.POST)
	public SrdemandDetail updateDeliverbles(@PathVariable("dmndNo")String dmndNo, Model model) {
		return null;
	}
	
	*//**
	 * 
	 * @author 여수한
	 * 작성일자 : 2023-02-23
	 * @return sr요청 히스토리 조회
	 *//*
	@ResponseBody
	@RequestMapping(value="/srinformation/{dmndNo}", method=RequestMethod.GET)
	public SrdemandDetail getHistory(@PathVariable("dmndNo")String dmndNo, Model model) {
		return null;
	}*/
}
