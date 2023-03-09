package com.oti.team2.srresource.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
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
	@GetMapping("/list")
	public List<SrResource> getSrResourceList(@RequestParam("srNo") String srNo){
		log.info(srNo);
		return srResourceService.getSrResourceListBySrNo(srNo);
	}
	
	/** 
	 * 선택된 개발자의 일정 정보 가져오기
	 * @author : 안한길
	 * @param empId
	 * @return List<SrResourceOfDeveloper
	 * */
	@ResponseBody
	@GetMapping("/resource/schedule")
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
	@PostMapping("/resource/add" )
	public int addSrResource(SrResource srResource) {
		log.info(srResource);
		
		int result =0;
		if(srResource.getFirstResource()) {
			result=srResourceService.addFirstSrResource(srResource);
		}else {
			log.info("첫번째 자원정보 추가");
			result=srResourceService.addSrResource(srResource);
		}
		return result;
	}
	
	/** 선택한 자원정보 삭제
	 * @author : 안한길
	 * @param SrSrc
	 * @return int
	 * */
	@ResponseBody
	@GetMapping("/resource/delete")
	public int deleteSrResource(@RequestParam(value="srSrc[]" , required=false) List<String> srSrcList) {
		log.info(srSrcList);
		
		int result = srResourceService.deleteSrResource(srSrcList);
		return result;
	}
	
	/** 입력한 자원 정보 수정
	 * @author : 안한길
	 * @param SrResource
	 * @return int
	 * */
	@ResponseBody
	@PostMapping(value="/resource/modify")
	public int modifySrResource(SrResource srResource) {
		log.info(srResource);
		
		int result = srResourceService.modifySrResource(srResource);
		return result;
	}
}
