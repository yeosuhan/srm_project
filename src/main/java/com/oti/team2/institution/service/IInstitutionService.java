package com.oti.team2.institution.service;

import com.oti.team2.institution.dto.Institution;

public interface IInstitutionService {
	// 내 기관 관리(조회)
	Institution getInst(String memberId);
	// 기관 등록
	void writeInst(Institution institution);
	// 기관 수정
	void updateInst(Institution institution);
}
