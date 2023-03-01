package com.oti.team2.member.controller;

import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.extern.log4j.Log4j2;

@Log4j2
@Controller
public class LoginController {

	/**
	 * 로그인 메소드
	 *
	 * @author 최은종, 신정은
	 * 
	 * @return 로그인 페이지로 리턴
	 */
	@GetMapping("/loginForm")
	public String getLogin() {
		return "member/login";
	}

	/**
	 * 로그인 메소드
	 *
	 * @author 최은종, 신정은
	 * @param Authentication 스프링 시큐리티가 제공하는 유저의 권한을 얻어오는 객체 매개변수로 사용
	 * @return auth 객체 리턴
	 */
	@ResponseBody
	@GetMapping("/auth")
	public Authentication postLogin(Authentication auth) {
		// Authentication auth = SecurityContextHolder.getContext().getAuthentication();

		// Id 알아오는 법
		// Authentication auth 매개변수로 가져오고 getName();
		String memberId = auth.getName();

		log.info("getName: " + memberId);

		return auth;
	}
}
