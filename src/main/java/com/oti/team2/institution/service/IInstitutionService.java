package com.oti.team2.institution.service;

import com.oti.team2.institution.dto.Institution;

public interface IInstitutionService {
	/** 
	 * 기관 정보 조회
	 * @author 신정은
	 * @return
	 */
	public Institution getInstitution(String instCd);

	/**
	 * 내 기관 관리(조회
	 * @author 여수한
	 * @param session
	 * @param model
	 * @return
	 */
	public Institution getInst(String memberId);
	
	/**
	 * 내 기관 등록
	 * @author 여수한
	 * @param session
	 * @param model
	 * @return
	 */
	public void addInst(Institution institution);
	
	/**
	 * 내 기관 수정
	 * @author 여수한
	 * @param session
	 * @param model
	 * @return
	 */
	public void updateInst(Institution institution);
}
