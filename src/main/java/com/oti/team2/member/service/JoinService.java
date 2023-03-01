package com.oti.team2.member.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.factory.PasswordEncoderFactories;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.oti.team2.member.dao.IJoinDao;
import com.oti.team2.member.dto.Join;

import lombok.extern.log4j.Log4j2;
@Log4j2
@Service
public class JoinService implements IJoinService{
	
	@Autowired
	IJoinDao joinDao;
	
	
	private String getEncodedPassword(String pswd) {
		PasswordEncoder passwordEncoder = PasswordEncoderFactories.createDelegatingPasswordEncoder();
		return passwordEncoder.encode(pswd);
	}
	/**
	 * 
	 * @author 여수한
	 * 작성일자 : 2023-03-01
	 * @return join
	 */
	@Override
	public void getJoin(Join join) {
		
		join.setPswd(getEncodedPassword(join.getPswd()));
		log.info(join);
		joinDao.insertJoin(join);
	}
}
