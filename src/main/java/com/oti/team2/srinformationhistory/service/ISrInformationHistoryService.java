package com.oti.team2.srinformationhistory.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.security.core.Authentication;

import com.oti.team2.srinformationhistory.dto.SrHistoryDetailDto;
import com.oti.team2.srinformationhistory.dto.SrInformationHistory;
import com.oti.team2.util.pager.Pager;

public interface ISrInformationHistoryService {

	/**
	 * SR처리 히스토리 내역 조회 메서드
	 * 
	 * @author 최은종
	 */
	public List<SrInformationHistory> getSrInformationHistoryList(Pager pager, String srNo);

	public List<SrInformationHistory> getSrInformationHistoryListForClient(Pager pager, String srNo, String role);

	/**
	 * SR처리 히스토리 목록 페이징을 위한 메서드
	 * 
	 * @author 최은종
	 */
	public int getTotalRows();

	/**
	 * SR처리 히스토리 상세 조회 메서드
	 * 
	 * @author 최은종
	 */
	public SrHistoryDetailDto getSrInformationHistory(int hstryId);

	/**
	 * 히스토리 조회시 권한에 따라 sr요청번호를 다르게 보여 주기 위한 메서드
	 * 
	 * @author 최은종
	 */
	public String getSrNo(String dmndNo);

	/**
	 * SR 히스토리 등록& 요청 결재를 위한 insert 메서드
	 * 
	 * @author 최은종
	 */
	public void addSrInformationHistory(SrInformationHistory srInformationHistory, String role);

	/**
	 * SR 히스토리 수정을 위한 update 메서드
	 * 
	 * @author 최은종
	 * 
	 */
	public void updateHstry(SrInformationHistory srInformationHistory);

}
