package com.oti.team2.srinformationhistory.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.oti.team2.srinformationhistory.dto.SrHistoryDetailDto;
import com.oti.team2.srinformationhistory.dto.SrInformationHistory;
import com.oti.team2.util.pager.Pager;

public interface ISrInformationHistoryDao {

	/**
	 * SR처리 히스토리 내역 조회 메서드
	 * 
	 * @author 최은종
	 */
	public List<SrInformationHistory> selectBySrNo(@Param("pager") Pager pager, @Param("srNo") String srNo);
	
	public List<SrInformationHistory> selectForClientBySrNo(@Param("pager") Pager pager, @Param("srNo") String srNo);

	/**
	 * SR처리 히스토리 목록 페이징을 위한 메서드
	 * 
	 * @author 최은종
	 */
	public int countAll();

	/**
	 * SR처리 히스토리 상세 조회 메서드
	 * 
	 * @author 최은종
	 */
	public SrHistoryDetailDto selectByHstryId(@Param("hstryId") int hstryId);

	/**
	 * SR처리 히스토리 등록 메서드 
	 * 
	 * @author 최은종
	 */
	public void insertSrHistory(SrInformationHistory srInformationHistory);
	
	/**
	 * SR처리 히스토리 상태 업데이트 메서드
	 * 
	 * @author 최은종
	 */
	public void updateHstryStts(@Param("hstryId") int hstryId, @Param("hstryStts") String hstryStts);

	/**
	 * SR처리 히스토리 수정 메서드
	 * 
	 * @author 최은종
	 */
	public int updateHstry(SrInformationHistory srInformationHistory);
	
}
