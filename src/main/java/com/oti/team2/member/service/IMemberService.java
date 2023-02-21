package com.oti.team2.member.service;

import java.util.List;

import com.oti.team2.member.dto.Member;
import com.oti.team2.util.Auth;
import com.oti.team2.util.pager.Pager;

public interface IMemberService {

	public  List<Member> getMemberList(String memberType, Pager pager);
	int getTotalRows(String memberType);
	/*
	 * 작성자: 안한길
	 * 작성일: 2023.02.20.
	 * 내용: 사원 rud
	 * */
	public Member getMember(String memberId,String string);
	
	public int deleteDeveloper(String memberId);
	
	public int updateDeveloper(Member member);
}
