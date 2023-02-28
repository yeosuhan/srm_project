package com.oti.team2.member.dto;

import java.util.List;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.User;

public class Users extends User {
	private String flnm;

	public Users(
		String memberId,
		String pswd,
		boolean enabled,
		List<GrantedAuthority> authority,	
		String flnm) {
	super(memberId, pswd, enabled, true, true, true, authority);
	this.flnm=flnm;
		}

	public String getFlnm() {
		return flnm;
	}

}