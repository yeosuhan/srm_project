package com.oti.team2.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.oti.team2.member.dto.Join;
import com.oti.team2.member.service.IJoinService;

import lombok.extern.log4j.Log4j2;
@Log4j2
@Controller
public class JoinController {
	
	@Autowired
	private IJoinService joinService;
	/**
	 * 
	 * @author 여수한
	 * 작성일자 : 2023-03-01
	 * @return join-client로 이동
	 */
	@GetMapping("/join-client")
	public String getJoinClient() {
		return "member/join-client";
	}
	/**
	 * 
	 * @author 여수한
	 * 작성일자 : 2023-03-01
	 * @return join-employee로 이동
	 */
	@GetMapping("/join-employee")
	public String getJoinEmployee() {
		return "member/join-employee";
	}
	/**
	 * 
	 * @author 여수한
	 * 작성일자 : 2023-03-01
	 * @return join
	 */
	@PostMapping("/join")
	public String getJoin(Join join) {
		log.info("join 입력값 : " + join);
		joinService.getJoin(join);
		return "member/login";
	}
}
