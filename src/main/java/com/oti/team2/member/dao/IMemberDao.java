package com.oti.team2.member.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.oti.team2.member.dto.Member;
import com.oti.team2.member.dto.ProfileImg;
import com.oti.team2.util.pager.Pager;

public interface IMemberDao {
	/**
	 * 멤버 타입별 총 행수 조회
	 *@author : 신정은
	 * @param memberType
	 * @return
	 */
	public int countByMemberType(@Param("memberType")String memberType);
	
	/**
	 * 멤버 타입 별 목록 조회 (관리자가 수행)
	 *@author : 신정은
	 * @param memberType
	 * @param pager
	 * @return
	 */
	public List<Member> selectByMemberType(@Param("memberType")String memberType, @Param("pager")Pager pager);
	
	/**
	 * 멤버 타입 별 내 정보 조회
	 *@author : 신정은
	 * @param memberId
	 * @param memberType
	 * @return
	 */
	public Member selectByMemberIdAndMemberType(@Param("memberId")String memberId, @Param("memberType")String memberType);
	
	/**
	 * 멤버 타입 별 내 정보 수정
	 * 고객은 구현 완료, 사원 로직 추가 필요
	 *@author : 신정은
	 * @param member
	 * @return
	 */
	public int updateMember(@Param("member")Member member);
	
	/**
	 * 멤버의 프로필 사진 조회
	 * 추가 구현 필요
	 *@author : 신정은
	 * @param memeberId
	 * @return
	 */
	public ProfileImg selectFile(@Param("memberId")String memeberId);
	}
