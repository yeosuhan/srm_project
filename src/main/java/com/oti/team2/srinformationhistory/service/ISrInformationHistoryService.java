package com.oti.team2.srinformationhistory.service;

import java.util.List;

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
	 * SR처리 변경요청에 대한 수락 여부를 업데이트 하기 위한 메서드
	 * 
	 * @author 최은종
	 */
	public int updateSrInformationHistory();

	/**
	 * 히스토리 조회시 권한에 따라 sr요청번호를 다르게 보여 주기 위한 메서드
	 * 
	 * @author 최은종
	 */
	public String getSrNo(String dmndNo);
	
	/**
	 * SR 요청일 변경을 위한 insert 메서드
	 * 
	 * @author 최은종
	 */
	public void addSrInformationHistory(SrInformationHistory srInformationHistory);
	
}
