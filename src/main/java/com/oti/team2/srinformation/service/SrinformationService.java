package com.oti.team2.srinformation.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.oti.team2.srinformation.dao.ISrinformationDao;
import com.oti.team2.srinformation.dto.SrinformationList;
import com.oti.team2.srinformation.dto.SrplanInfomaion;
@Service
public class SrinformationService implements ISrinformationService{
	
	@Autowired
	ISrinformationDao srinformationDao;
	
	/**
	 * 
	 * @author 여수한
	 * 작성일자 : 2023-02-22
	 * @return sr진척 목록 조회
	 */
	@Override
	public List<SrinformationList> getList() {
		List<SrinformationList> srlist = srinformationDao.selectInfoAll();
		return srlist;
	}
	
	
	/**
	 * 
	 * @author 여수한
	 * 작성일자 : 2023-02-23
	 * @return sr진척 계획정보 조회
	 */
	@Override
	public SrplanInfomaion getPlan(String dmndNo) {
		return srinformationDao.selectPlanByDmndNo(dmndNo);
	}

}
