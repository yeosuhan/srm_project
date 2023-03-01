package com.oti.team2.srinformationhistory.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.oti.team2.srdemand.dao.ISrDemandDao;
import com.oti.team2.srinformation.dao.ISrinformationDao;
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

	@Autowired
	private ISrDemandDao srDemandDao;

	/**
	 * SR처리 히스토리 내역 조회 메서드
	 * 
	 * @author 최은종
	 */
	@Override
	public List<SrInformationHistory> getSrInformationHistoryList(Pager pager, String srNo) {
		List<SrInformationHistory> srInformationHistoryList = srInformationHistoryDao.selectBySrNo(pager, srNo);
		return srInformationHistoryList;
	}

	/**
	 * 히스토리 조회시 권한에 따라 sr요청번호를 다르게 보여 주기 위한 메서드
	 * 
	 * @author 최은종
	 */
	@Override
	public String getSrNo(String dmndNo) {
		String srNo = srDemandDao.selectBySrDmndNo(dmndNo);

		log.info(srNo);
		return srNo;
	}

	/**
	 * SR처리 히스토리 목록 페이징을 위한 메서드
	 * 
	 * @author 최은종
	 */
	@Override
	public int getTotalRows() {
		int rows = srInformationHistoryDao.countAll();
		return rows;
	}

	/**
	 * SR처리 히스토리 상세 조회 메서드
	 * 
	 * @author 최은종
	 */
	@Override
	public SrHistoryDetailDto getSrInformationHistory(int hstryId) {
		SrHistoryDetailDto srHistoryDetailDto = srInformationHistoryDao.selectByHstryId(hstryId);
		return srHistoryDetailDto;
	}

	/**
	 * SR처리 변경요청에 대한 수락 여부를 업데이트 하기 위한 메서드
	 * 
	 * @author 최은종
	 */
	@Transactional
	public int updateSrInformationHistory() {
		// TODO Auto-generated method stub
		return 0;
	}

	/**
	 * SR 요청일 변경을 위한 insert 메서드
	 * 
	 * @author 최은종
	 */
	@Transactional
	public void addSrInformationHistory(SrInformationHistory srInformationHistory) {
		log.info("서비스----등록");
		srInformationHistoryDao.insertSrHistory(srInformationHistory);
	}

}
