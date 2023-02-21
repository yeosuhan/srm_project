package com.oti.team2.member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.oti.team2.member.dto.Member;
import com.oti.team2.member.service.IMemberService;
import com.oti.team2.util.Auth;

import lombok.extern.log4j.Log4j2;

@Controller
@Log4j2
@RequestMapping("/member")
public class MemberController {
	@Autowired
	private IMemberService memberService;
	
	/**
	 * 
	 *@author : 신정은
	 * 작성일자 : 2023.02.21
	 * @param session
	 * @param model
	 * @return
	 */
	@GetMapping("/myinfo")
	public String getMember(HttpSession session, Model model) {
		//session 에서 사용자 정보 가져오기
		Member member = memberService.getMember("client1", Auth.CLIENT.toString());
		log.info(member);
		model.addAttribute("member", member);
		return"member/myinfo";
	}
}
