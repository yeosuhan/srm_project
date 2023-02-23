package com.oti.team2.srresource.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.oti.team2.srresource.dto.SrResource;
import com.oti.team2.srresource.dto.SrResourceOfDeveloper;
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
	public List<SrResource> getSrResourceList(@RequestParam() String srNo){
		log.info("srNo");
		return srResourceService.getSrResourceListBySrNo(srNo);
	}
	
	/** 
	 * 선택된 개발자의 일정 정보 가져오기
	 * @author : 안한길
	 * @param empId
	 * @return List<SrResourceOfDeveloper
	 * */
	@ResponseBody
	@RequestMapping(value="/resource/schedule", method=RequestMethod.GET)
	public List<SrResourceOfDeveloper> getSrResourceOfDeveloperList(@RequestParam() String empId){
		log.info(empId);
		return srResourceService.getSrResourceListByEmpId(empId);
	}
	
	/** 입력한 자원 정보 추가
	 * @author : 안한길
	 * @param SrResource
	 * @return int
	 * */
	@ResponseBody
	@RequestMapping(value="/resource/add" , method=RequestMethod.POST)
	public int addSrResource(SrResource srResource) {
		log.info(srResource);
		
		int result = srResourceService.addSrResource(srResource);
		return result;
	}
	
	/** 선택한 자원정보 삭제
	 * @author : 안한길
	 * @param SrSrc
	 * @return int
	 * */
	@ResponseBody
	@RequestMapping(value="/resource/delete" , method=RequestMethod.POST)
	public int deleteSrResource(String[] srSrc) {
		log.info(srSrc);
		
		int result = srResourceService.deleteSrResource(srSrc);
		return result;
	}
}
