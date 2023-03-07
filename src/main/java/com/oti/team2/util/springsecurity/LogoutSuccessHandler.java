package com.oti.team2.util.springsecurity;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.logout.SimpleUrlLogoutSuccessHandler;

import lombok.extern.log4j.Log4j2;

@Log4j2
public class LogoutSuccessHandler extends SimpleUrlLogoutSuccessHandler {

	/**
	 * 스프링 시큐리티 적용한 로그아웃 핸들러메서드
	 *
	 * @author 최은종, 신정은
	 * 
	 */
	@Override
	public void onLogoutSuccess(HttpServletRequest req, HttpServletResponse res, Authentication auth)
			throws IOException, ServletException {
		log.info("로그아웃 성공");
		super.onLogoutSuccess(req, res, auth);
	}
}
