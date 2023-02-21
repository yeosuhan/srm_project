package com.oti.team2.institution.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.oti.team2.institution.controller.InstitutionController;
import com.oti.team2.institution.dao.InstitutionDao;
import com.oti.team2.institution.dto.Institution;
@Service
public class InstitutionService implements IInstitutionService{

	@Autowired
	InstitutionDao institutuonDao;
	
	@Autowired
	InstitutionController institutionController;
	/* 내 기관 관리(조회) */
	@Override
	public Institution getInst(String memberId) {
		return institutuonDao.selectByInst(memberId);		
	}
	/* 기관 등록 */
	@Override
	public void writeInst(Institution institution) {
		institutuonDao.insertByInst(institution);
	}
	/* 기관 수정 */
	@Override
	public void updateInst(Institution institution) {
		institutuonDao.updateByInst(institution);
	}	
}
