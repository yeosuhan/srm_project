package com.oti.team2.member.service;

import java.util.List;

import com.oti.team2.member.dto.Member;
import com.oti.team2.member.dto.ProfileImg;
import com.oti.team2.util.pager.Pager;

public interface IMemberService {
	
	/**
	 * 멤버 타입별 총 행수 조회
	 *@author : 신정은
	 * @param memberType
	 * @return
	 */
	public int getTotalRows(String memberType);
	
	/**
	 * 멤버 타입 별 목록 조회 (관리자가 수행)
	 *@author : 신정은
	 * @param memberType
	 * @param pager
	 * @return
	 */
	public List<Member> getMemberList(String memberType, Pager pager);
	
	/**
	 * 멤버 타입 별 내 정보 조회
	 *@author : 신정은
	 * @param memberId
	 * @param memberType
	 * @return
	 */
	public Member getMember(String memberId, String memberType);
	
	/**
	 * 멤버 타입 별 내 정보 수정
	 * 고객만 수정, 관리자/개발자 수정 필요
	 *@author : 신정은
	 * @param member
	 */
	public void updateMember(Member member);
	
	/**
	 * 멤버의 프로필 사진 조회
	 * 수정 필요
	 *@author : 신정은
	 * @param memberId
	 * @return
	 */
	public ProfileImg getProfileImg(String memberId);
}
