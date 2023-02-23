package com.oti.team2.institution.dao;

import org.apache.ibatis.annotations.Param;

import com.oti.team2.institution.dto.Institution;

public interface IInstitutionDao {
	/**
	 * 나의 기관 조회
	 * @author 신정은
	 */
	public Institution selectByInstCd(@Param("instCd")String instCd);
	
	/**
	 * 내 기관 관리(조회)
	 * @author YEOSUHAN
	 */
	public Institution selectByInst(@Param("memberId")String memberId);
	
	/**
	 * 기관 등록 
	 * @author YEOSUHAN
	 */
	public int insertByInst(@Param("inst") Institution institution);
	
	/** 
	 * 기관 수정 
	 * @author YEOSUHAN
	 */
	public void updateByInst(@Param("inst") Institution institution);

}
