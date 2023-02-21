package com.oti.team2.member.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.oti.team2.member.dto.Member;
import com.oti.team2.util.pager.Pager;

public interface IMemberDao {
	
	public int countByMemberType(@Param("memberType")String memberType);
	public List<Member> selectByMemberType(@Param("memberType")String memberType, @Param("pager")Pager pager);
	
	public Member selectByMemberIdAndMemberType(@Param("memberId")String memberId, @Param("memberType")String memberType);
}
