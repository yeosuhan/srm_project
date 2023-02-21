package com.oti.team2.member.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.oti.team2.member.dao.IMemberDao;
import com.oti.team2.member.dto.Member;
import com.oti.team2.member.dto.ProfileImg;
import com.oti.team2.util.pager.Pager;

import lombok.extern.log4j.Log4j2;

@Service
@Log4j2
public class MemberService implements IMemberService {
	@Autowired
	private IMemberDao memberDao;
	
	/**
	 * 멤버 타입별 총 행수 조회
	 *@author : 신정은
	 */
	@Override
	public int getTotalRows(String memberType) {
		return memberDao.countByMemberType(memberType);
	}
	
	/**
	 * 멤버 타입 별 목록 조회 (관리자가 수행)
	 *@author : 신정은
	 */
	@Override
	public List<Member> getMemberList(String memberType, Pager pager) {
		return memberDao.selectByMemberType(memberType, pager);		
	}

	/**
	 * 멤버 타입 별 내 정보 조회
	 *@author : 신정은
	 */
	@Override
	public Member getMember(String memberId, String memberType) {
		return memberDao.selectByMemberIdAndMemberType(memberId, memberType);	
	}

	/**
	 * 멤버 타입 별 내 정보 수정
	 * 고객만 수정, 관리자/개발자 수정 필요
	 * @author : 신정은
	 */
	@Override
	public void updateMember(Member member) {		
		int row = memberDao.updateMember(member);
		log.info("row : " + row);
	}

	/**
	 * 멤버의 프로필 사진 조회
	 * 수정 필요
	 *@author : 신정은
	 */
	@Override
	public ProfileImg getProfileImg(String memberId) {
		
		return null;
	}

}
