package com.oti.team2.institution.service;

import com.oti.team2.institution.dto.Institution;

public interface IInstitutionService {
	/**
	 * 
	 * @author YEOSUHAN
	 * @return 내 기관 관리(조회)
	 */
	Institution getInst(String memberId);
	/**
	 * 
	 * @author YEOSUHAN
	 * @param InstCd1 중복된 기관코드 저장
	 * @return 기관 등록(기관 등록)
	 */
	void addInst(Institution institution);
	/**
	 * 
	 * @author YEOSUHAN
	 * @return 내 기관 관리(조회)
	 */
	void updateInst(Institution institution);

}
