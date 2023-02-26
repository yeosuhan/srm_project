package com.oti.team2.deliverable.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.oti.team2.deliverable.dto.Deliverable;
import com.oti.team2.deliverable.service.IDeliverableService;
import com.oti.team2.department.dto.Department;

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
	public List<Deliverable> getDeliverableList(@RequestParam() String srNo) {
		log.info("deliverableList 조회");

		List<Deliverable> deliverableList = deliverableService.getDeliverableList(srNo);

		return deliverableList;
	}
}
