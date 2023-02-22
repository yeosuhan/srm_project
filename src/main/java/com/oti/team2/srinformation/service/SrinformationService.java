package com.oti.team2.srinformation.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.oti.team2.srinformation.dao.SrinformationDao;
import com.oti.team2.srinformation.dto.SrinformationList;
@Service
public class SrinformationService implements ISrinformationService{
	
	@Autowired
	SrinformationDao srinformationDao;
	
	/**
	 * 
	 * @author 여수한
	 * @return sr진척목록 조회
	 */
	@Override
	public List<SrinformationList> getList() {
		List<SrinformationList> srlist = srinformationDao.selectBySrinfoList();
		return srlist;
	}

}
