package com.oti.team2.member.service;

import java.util.List;

import com.oti.team2.member.dto.Member;
import com.oti.team2.util.Auth;
import com.oti.team2.util.pager.Pager;

public interface IMemberService {

	public  List<Member> getMemberList(String memberType, Pager pager);
	
	int getTotalRows(String memberType);
	
	public Member getMember(String memberId,String string);
	/*
	 * 맴버 삭제 
	 * @author 안한길
	 * @param  맴버아이디
	 * @return 반영된 행수
	 * */
	public int deleteMember(String memberId);
	/*
	 * 맴버 수정 
	 * @author 안한길
	 * @param  수정된 값
	 * @return 반영된 행수
	 * */
	public int modifyMember(Member member);
}
