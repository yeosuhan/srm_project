package com.oti.team2.member.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.oti.team2.member.dao.IMemberDao;
import com.oti.team2.member.dto.Member;
import com.oti.team2.util.Auth;
import com.oti.team2.util.pager.Pager;

@Service
public class MemberService implements IMemberService {
	@Autowired
	private IMemberDao memberDao;

	@Override
	public List<Member> getMemberList(String memberType, Pager pager) {
		return memberDao.selectByMemberType(memberType, pager);
	}

	@Override
	   public int getTotalRows(String memberType) {
	      return memberDao.countByMemberType(memberType);
	   }
	/*
	 * 작성자: 안한길 
	 * 작성일: 2023.02.20. 
	 * 내용: 사원 rud
	 */
	@Override
	public Member getMember(String memberId,String memberType) {
		return memberDao.selectByMemberIdAndBymemberType(memberId,memberType);
	}

	@Override
	public int deleteDeveloper(String memberId) {
		return memberDao.deleteDeveloperByMemberId(memberId);
	}

	@Override
	public int updateDeveloper(Member member) {
		return memberDao.updateDeveloperByMemberId(member);
	}

}
