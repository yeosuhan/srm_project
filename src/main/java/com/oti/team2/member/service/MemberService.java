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
	
	@Override
	public Member getMember(String memberId,String memberType) {
		return memberDao.selectByMemberIdAndBymemberType(memberId,memberType);
	}
	/*
	 * 맴버 삭제 
	 * @author 안한길
	 * @param  맴버아이디
	 * @return 반영된 행수
	 * */
	@Override
	public int deleteMember(String memberId) {
		return memberDao.deleteMemberByMemberId(memberId);
	}

	/*
	 * 맴버 수정
	 * @author 안한길
	 * @param  수정된 값
	 * @return 반영된 행수
	 * */
	@Override
	public int modifyMember(Member member) {
		return memberDao.updateMemberByMemberId(member);
	}

}
