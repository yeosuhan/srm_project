package com.oti.team2.institution.dao;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.oti.team2.institution.dto.Institution;

@Mapper
public interface InstitutionDao {
	/**
	 * 
	 * @author YEOSUHAN
	 * @return 내 기관 관리(조회)
	 */
	Institution selectByInst(@Param("memberId")String memberId);
	/**
	 * 
	 * @author YEOSUHAN
	 * @param InstCd1 중복된 기관코드 저장
	 * @return 기관 등록(기관 등록)
	 */
	void insertByInst(@Param("inst") Institution institution);
	/**
	 * 
	 * @author YEOSUHAN
	 * @return 내 기관 관리(조회)
	 */
	void updateByInst(@Param("inst") Institution institution);
}
