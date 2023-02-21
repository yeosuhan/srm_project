package com.oti.team2.member.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.oti.team2.member.dto.Member;
import com.oti.team2.util.pager.Pager;

public interface IMemberDao {

	public int countByMemberType(@Param("memberType")String memberType);
	
	public List<Member> selectByMemberType(@Param("memberType")String memberType, @Param("pager")Pager pager);

	public Member selectByMemberIdAndBymemberType(@Param("memberId")String memberId,@Param("memberType")String memberType);
	/*
	 * 맴버 삭제 
	 * @author 안한길
	 * @param  맴버아이디
	 * @return 반영된 행수
	 * */
	public int deleteMemberByMemberId(String memberId);
	/*
	 * 맴버 수정 
	 * @author 안한길
	 * @param  수정된 값
	 * @return 반영된 행수
	 * */
	public int updateMemberByMemberId(Member member);
	
}
