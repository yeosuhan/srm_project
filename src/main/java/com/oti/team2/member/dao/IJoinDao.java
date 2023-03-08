package com.oti.team2.member.dao;

import org.apache.ibatis.annotations.Param;

import com.oti.team2.member.dto.File;
import com.oti.team2.member.dto.Join;

public interface IJoinDao {

	void insertJoin(@Param("join") Join join);

	Integer checkId(@Param("memberId") String memberId);

	void updateFile(@Param("file") File file, @Param("memberId") String memberId);

}
