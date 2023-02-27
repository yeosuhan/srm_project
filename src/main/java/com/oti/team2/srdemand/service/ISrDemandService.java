package com.oti.team2.srdemand.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.oti.team2.srdemand.dto.SrDemand;
import com.oti.team2.srdemand.dto.SrRequestDto;
import com.oti.team2.srdemand.dto.SrdemandDetail;

public interface ISrDemandService {

	/**
	 * sr요청 등록
	 * @author 신정은
	 */
	public int addSrDemand(SrRequestDto srRequestDto);
	
	/**
	 * 고객의 나의 sr요청 목록 조회
	 * @author 신정은
	 */
	public List<SrDemand> getSrDemandList(String custId);
	
	/** 
	 * sr요청 이 결재 전 상태이면 수정하기 위해 기존 데이터 제공
	 * @author 신정은
	 */
	public SrRequestDto getSrReuestDto(String dmndNo);
	
	/**
	 * sr요청 수정 진행
	 * @author 신정은
	 */
	public int updateSrDemand(@Param("srRequestDto")SrRequestDto srRequestDto);
	
	/**
	 * 
	 * @author 여수한
	 * 작성일자 : 2023-02-22
	 * @return sr요청 상세 조회
	 */
	SrdemandDetail getSrDemandDetail(String Detail);
}
