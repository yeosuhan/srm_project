package com.oti.team2.srinformationhistory.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.oti.team2.srinformationhistory.dao.ISrInformationHistoryDao;
import com.oti.team2.srinformationhistory.dto.SrHistoryDetailDto;
import com.oti.team2.srinformationhistory.dto.SrInformationHistory;
import com.oti.team2.util.pager.Pager;

import lombok.extern.log4j.Log4j2;

@Service
@Log4j2
public class SrInformationHistoryService implements ISrInformationHistoryService {
	@Autowired
	private ISrInformationHistoryDao srInformationHistoryDao;

	@Override
	public List<SrInformationHistory> getSrInformationHistoryList(Pager pager, String srNo) {
		List<SrInformationHistory> srInformationHistoryList = srInformationHistoryDao.selectHstryList(pager, srNo);
		return srInformationHistoryList;
	}

	@Override
	public int getTotalRows() {
		int rows = srInformationHistoryDao.count();
		return rows;
	}
	
	@Override
	public SrHistoryDetailDto getSrInformationHistory(int hstryId) {
		SrHistoryDetailDto srHistoryDetailDto = srInformationHistoryDao.selectByHstryId(hstryId);
		return srHistoryDetailDto;
	}

	@Transactional
	public int updateSrInformationHistory() {
		// TODO Auto-generated method stub
		return 0;
	}





}
