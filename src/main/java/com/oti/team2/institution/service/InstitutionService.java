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
	
	/**
	 * 
	 * @author YEOSUHAN
	 * @return 내 기관 관리(조회)
	 */
	@Override
	public Institution getInst(String memberId) {
		return institutuonDao.selectByInst(memberId);		
	}
	/**
	 * 
	 * @author YEOSUHAN
	 * @param InstCd1 중복된 기관코드 저장
	 * @return 기관 등록(기관 등록)
	 */
	@Override
	public void addInst(Institution institution) {
		institutuonDao.insertByInst(institution);
	}
	/**
	 * 
	 * @author YEOSUHAN
	 * @return 내 기관 관리(조회)
	 */
	@Override
	public void updateInst(Institution institution) {
		institutuonDao.updateByInst(institution);
	}	
}
