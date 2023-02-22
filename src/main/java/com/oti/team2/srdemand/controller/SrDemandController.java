package com.oti.team2.srdemand.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.log4j.Log4j2;

@Controller
@Log4j2
@RequestMapping("/srdemand")
public class SrDemandController {

	@GetMapping("/list")
	public String getSrDemandList(Model model) {
		log.info("srDemandList 조회");
		
		model.addAttribute("srNo", "WOR-SR-0001");
		log.info(model.getAttribute("srNo"));
		return "srDemand/userSrDemandList";
	}
}
