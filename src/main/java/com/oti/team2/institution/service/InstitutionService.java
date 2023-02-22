package com.oti.team2.institution.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.oti.team2.institution.dao.IInstitutionDao;
import com.oti.team2.institution.dto.Institution;

import lombok.extern.log4j.Log4j2;
@Service
@Log4j2
public class InstitutionService implements IInstitutionService{

	@Autowired
	IInstitutionDao institutionDao;
	
	/** 
	 * 기관 정보 조회
	 * @author 신정은
	 * @return
	 */
	@Override
	public Institution getInstitution(String instCd) {
		return institutionDao.selectByInstCd(instCd);
	}
	
	/**
	 * 내 기관 관리(조회
	 * @author 여수한
	 * @param session
	 * @param model
	 * @return
	 */
	@Override
	public Institution getInst(String memberId) {
		log.info(memberId);
		return institutionDao.selectByInst(memberId);		
	}
	
	/**
	 * 내 기관 등록
	 * @author 여수한
	 * @param session
	 * @param model
	 * @return
	 */
	@Override
	public void writeInst(Institution institution) {
		institutionDao.insertByInst(institution);
	}
	
	/**
	 * 내 기관 수정
	 * @author 여수한
	 * @param session
	 * @param model
	 * @return
	 */
	@Override
	public void updateInst(Institution institution) {
		institutionDao.updateByInst(institution);
	}
}
