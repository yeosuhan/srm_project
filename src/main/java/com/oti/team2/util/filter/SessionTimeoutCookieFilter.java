package com.oti.team2.util.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import lombok.extern.log4j.Log4j2;

@Log4j2
public class SessionTimeoutCookieFilter implements Filter{

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		HttpServletResponse httpRes = (HttpServletResponse) response;
        HttpServletRequest httpReq = (HttpServletRequest) request;
 
        long currTime = System.currentTimeMillis();
        long expiryTime = currTime + (((HttpServletRequest) request).getSession().getMaxInactiveInterval() * 60000);
 
        Cookie cookie = new Cookie("serverTime", "" + currTime);
 
        cookie.setPath("/");
        httpRes.addCookie(cookie);
 
 
        Cookie cookie2 = new Cookie("sessionExpiry", "" + expiryTime);
 
        cookie2.setPath("/");
        httpRes.addCookie(cookie2);
        log.info("쿠키 필터 ~~~ ");
        log.info("serverTime ~~~ " + currTime);
        log.info("sessionExpiry ~~~ " + expiryTime);
       
        chain.doFilter(request, response);
	}

}
