package com.oti.team2.member.service;

import java.util.List;

import com.oti.team2.member.dto.Member;
import com.oti.team2.util.pager.Pager;

public interface IMemberService {

	public List<Member> getMemberList(String memberType, Pager pager);
	
	public int getTotalRows(String memberType);
	
	public Member getMember(String memberId, String memberType);
}
