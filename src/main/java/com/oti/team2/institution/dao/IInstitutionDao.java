package com.oti.team2.institution.dao;

import java.util.List;

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
	/**
	 * 내 기관 수정
	 * @author 여수한
	 * @return 회원가입 - 모든 기관 목록 조회
	 */
	public List<Institution> selectAllInst();

}
