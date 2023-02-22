package com.oti.team2.srresource.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.oti.team2.srresource.dto.SrResource;
import com.oti.team2.srresource.service.ISrResourceService;

import lombok.extern.log4j.Log4j2;

@Controller
@Log4j2
@RequestMapping("/sr-resource")
public class SrResourceController {
	
	@Autowired
	private ISrResourceService srResourceService;
	
	/**
	 * sr에 대한 자원 정보 가져오기
	 * @author : 안한길
	 * @param srNo
	 * @return List<SrResource>
	 */
	@ResponseBody
	@RequestMapping(value="/list", method=RequestMethod.GET)
	public List<SrResource> getSrResourceList(@RequestParam() String srNo, Model model){
		log.info("srNo");
		return srResourceService.getSrResourceList(srNo);
	}
}
