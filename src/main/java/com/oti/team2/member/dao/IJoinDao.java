package com.oti.team2.member.dao;

import org.apache.ibatis.annotations.Param;

import com.oti.team2.member.dto.Join;

public interface IJoinDao {

	void insertJoin(@Param("join") Join join);

	Integer checkId(@Param("memberId") String memberId);

}
