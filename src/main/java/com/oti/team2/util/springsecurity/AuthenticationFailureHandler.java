package com.oti.team2.util.springsecurity;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.web.authentication.SimpleUrlAuthenticationFailureHandler;

import lombok.extern.log4j.Log4j2;

@Log4j2
public class AuthenticationFailureHandler extends SimpleUrlAuthenticationFailureHandler {

	/**
	 * 스프링 시큐리티 적용한 로그인 실패 핸들러메서드
	 *
	 * @author 최은종, 신정은
	 * 
	 */
	@Override
	public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response,
			org.springframework.security.core.AuthenticationException exception) throws IOException, ServletException {
		log.info("로그인 실패");
		super.onAuthenticationFailure(request, response, exception);
	}
}
