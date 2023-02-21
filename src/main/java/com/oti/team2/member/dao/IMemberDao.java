package com.oti.team2.member.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.oti.team2.member.dto.Member;
import com.oti.team2.util.pager.Pager;

public interface IMemberDao {

	public int countByMemberType(@Param("memberType")String memberType);
	/*
	 * 작성자: 안한길
	 * 작성일: 2023.02.20.
	 * 내용: 사원 rud
	 * */
	public List<Member> selectByMemberType(@Param("memberType")String memberType, @Param("pager")Pager pager);

	public Member selectByMemberIdAndBymemberType(@Param("memberId")String memberId,@Param("memberType")String memberType);

	public int deleteDeveloperByMemberId(String memberId);
	
	public int updateDeveloperByMemberId(Member member);
	
}
