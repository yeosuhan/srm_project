package com.oti.team2.util.filter;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

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
        
        log.info("getMaxInactiveInterval");
        log.info(((HttpServletRequest) request).getSession(false).getMaxInactiveInterval());
        long expiryTime = currTime + (((HttpServletRequest) request).getSession().getMaxInactiveInterval() * 60);
        
        Cookie cookie = new Cookie("sessionExpiry", "" + expiryTime);
        Date date = new Date(expiryTime);
        log.info(currTime);
        log.info(expiryTime);
        log.info(date);
        
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("YYYY-MM-dd HH:mm:ss.SSS");
        log.info(simpleDateFormat.format(date));
        cookie.setPath("/");
        httpRes.addCookie(cookie);
 
 
        log.info("쿠키 필터 ~~~ ");       
        chain.doFilter(request, response);
	}

}
