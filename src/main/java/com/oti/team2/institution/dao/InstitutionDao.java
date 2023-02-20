package com.oti.team2.institution.dao;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.oti.team2.institution.dto.Institution;

@Mapper
public interface InstitutionDao {
	/* 내 기관 관리(조회) */
	Institution selectByInst(@Param("memberId")String memberId);
	/* 기관 등록 */
	void insertByInst(@Param("inst") Institution institution);
	/* 기관 수정 */
	void updateByInst(@Param("inst") Institution institution);
}
