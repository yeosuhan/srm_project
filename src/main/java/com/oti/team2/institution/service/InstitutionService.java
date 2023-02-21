package com.oti.team2.institution.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.oti.team2.institution.dao.InstitutionDao;
import com.oti.team2.institution.dto.Institution;

@Service
public class InstitutionService implements IInstitutionService{
	@Autowired
	private InstitutionDao institutionDao;

	@Override
	public Institution getInstitution(String instCd) {
		return institutionDao.selectByInstCd(instCd);
	}

}
