package com.oti.team2.srinformationhistory.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.oti.team2.srdemand.dao.ISrDemandDao;
import com.oti.team2.srdemand.service.SrDemandService;
import com.oti.team2.srinformation.service.SrinformationService;
import com.oti.team2.srinformationhistory.dao.ISrInformationHistoryDao;
import com.oti.team2.srinformationhistory.dto.SrHistoryDetailDto;
import com.oti.team2.srinformationhistory.dto.SrInformationHistory;
import com.oti.team2.srresource.dao.ISrResourceDao;
import com.oti.team2.srresource.dto.SrResource;
import com.oti.team2.srresource.service.SrResourceService;
import com.oti.team2.util.pager.Pager;

import lombok.extern.log4j.Log4j2;

@Service
@Log4j2
public class SrInformationHistoryService implements ISrInformationHistoryService {
	@Autowired
	private ISrInformationHistoryDao srInformationHistoryDao;

	@Autowired
	private ISrDemandDao srDemandDao;

	@Autowired
	private SrDemandService srDemandService;

	@Autowired
	private ISrResourceDao srResourceDao;

	@Autowired
	private SrinformationService srInformationService;

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
	
	@Override
	public List<SrInformationHistory> getSrInformationHistoryListForClient(Pager pager, String srNo, String role) {
		List<SrInformationHistory> srInformationHistoryList = srInformationHistoryDao.selectForClientBySrNo(pager, srNo);
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
	 * 결재자의 결재 전 요청을 수정하는 메서드
	 * 
	 * @author 최은종
	 */
	@Transactional
	public int updateSrInformationHistory() {
		// TODO Auto-generated method stub
		return 0;
	}

	/**
	 * SR 히스토리 등록을 위한 insert 메서드
	 * 
	 * @author 최은종
	 * @see 개발자, 관리자
	 */
	@Transactional
	public void addSrInformationHistory(SrInformationHistory srInformationHistory) {
		log.info("서비스----insert");
		String hstryType = srInformationHistory.getHstryType();
		log.info("서비스----hstryType: " + hstryType);

		// 요청일 변경
		if (hstryType == "A") {
			srInformationHistoryDao.updateHstryStts(srInformationHistory.getHstryId());
		}
		srInformationHistoryDao.insertSrHistory(srInformationHistory);
	}

	/**
	 * SR 개발취소시 상태값 변경을 위한 update 메서드
	 * 
	 * @author 최은종 여러 서비스들을 호출해서 관련 날짜 및 상태값 모두 업데이트
	 * @see 관리자, 고객
	 */
	@Transactional
	public void updateHstryStts(HashMap<String, String> map) {
		log.info("서비스----update Status");
		log.info(map);

		int hstryId = Integer.parseInt(map.get("hstryId"));
		String srNo = (String) map.get("srNo");

		log.info("서비스 히스토리넘버: " + hstryId);
		log.info("서비스 SR넘버: " + srNo);
		// 여러 서비스 연결
		srInformationHistoryDao.updateHstryStts(hstryId);
		srDemandService.updateSrDemandStts(srNo, 6);
		// srResourceDao.updateSrResource(srNo);
		// srInformationService.updatePrgrsBySrNo(srNo);

	}

	/**
	 * SR 승인 전 요청 변경을 위한 update 메서드
	 * 
	 * @author 최은종
	 */
	@Transactional
	public void updateHstry(SrInformationHistory srInformationHistory) {
		log.info("서비스----요청 수정");

		int row = srInformationHistoryDao.updateHstry(srInformationHistory);
		log.info("서비스----요청 수정row " + row);
		log.info("서비스----요청 수정22 " + srInformationHistory);

	}


}
