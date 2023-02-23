package com.oti.team2.system.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.oti.team2.system.dto.SrSystem;
import com.oti.team2.system.service.ISystemService;

import lombok.extern.log4j.Log4j2;

@Controller
@RequestMapping("/srsystem")
@Log4j2
public class SystemController {
	
	@Autowired
	private ISystemService systemService;
	
	/**
	 * 
	 * sr 요청 등록 시, 전체 시스템 목록 가져오기 위함
	 * @author 신정은
	 */
	@GetMapping("/list")
	@ResponseBody
	public List<SrSystem> getSystemList() {
		List<SrSystem> systemList =  systemService.getSystemList();
		log.info(systemList);
		return systemList;
	}
}
