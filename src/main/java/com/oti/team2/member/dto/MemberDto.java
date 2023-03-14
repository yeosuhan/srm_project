package com.oti.team2.member.dto;

import lombok.Data;

@Data
public class MemberDto {
	private String memberId;
	private String pswd;
	private boolean enabled;
	private String flnm;
	private String telNo;
	private String eml;
}
