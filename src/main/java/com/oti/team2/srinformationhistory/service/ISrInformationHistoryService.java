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

}
