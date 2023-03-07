package com.oti.team2.deliverable.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.oti.team2.deliverable.dto.Deliverable;
import com.oti.team2.deliverable.service.IDeliverableService;

import lombok.extern.log4j.Log4j2;

@Controller
@Log4j2
@RequestMapping("/deliverable")
public class DeliverableController {
	@Autowired
	private IDeliverableService deliverableService;

	/**
	 * 산출물목록 조회 메서드
	 *
	 * @author 안한길
	 * @return 산출물 목록으로 리턴
	 */
	@ResponseBody
	@GetMapping("/list")
	public List<Deliverable> getDeliverableList(@RequestParam() String prgrsId) {
		log.info("deliverableList 조회");

		List<Deliverable> deliverableList = deliverableService.getDeliverableList(prgrsId);

		return deliverableList;
	}
	
	/**
	 * 산출물 추가 메서드
	 *
	 * @author 안한길
	 * @return 산출물 목록으로 리턴
	 */
	@ResponseBody
	@PostMapping("/add")
	public int addDeliverable(Authentication auth, Deliverable deliverable) {
		log.info("deliverable 추가");
		//session 에서 아이디 가져오기
		String rgtrId = auth.getName();
		deliverable.setRgtrId(rgtrId);
		return deliverableService.addDeliverable(deliverable);
	}
	
	/** 선택한 산출물 삭제
	 * @author : 안한길
	 * @param delivId
	 * @return int
	 * */
	@ResponseBody
	@GetMapping(value="/delete")
	public int deleteDeliverable(@RequestParam(value="delivId[]" , required=false) List<String> delivIdList) {
		log.info(delivIdList);
		
		int result = deliverableService.deleteDeliverable(delivIdList);
		return result;
	}
	
	/**
	 * 산출물 수정 메서드
	 *
	 * @author 안한길
	 * @return 산출물 목록으로 리턴
	 */
	@ResponseBody
	@PostMapping("/modify")
	public int modifyDeliverable(Deliverable deliverable) {
		log.info(deliverable);
		return deliverableService.modifyDeliverable(deliverable);
	}
}
