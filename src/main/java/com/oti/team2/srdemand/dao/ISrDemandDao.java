package com.oti.team2.srdemand.dao;

import java.util.List;

import com.oti.team2.srdemand.dto.SrDemand;
import com.oti.team2.srdemand.dto.SrRequestDto;

public interface ISrDemandDao {

	/**
	 * sr요청 등록
	 * @author 신정은
	 */
	public int insertSrDemand(SrRequestDto srRequestDto);
	
	/**
	 * SR230222(SR+현재날짜)~ 로 시작하는 요청의 개수 구하기
	 * @author 신정은
	 */
	public int countByDmndNo(String srCode);
	
	/**
	 * 고객의 나의 요청 목록 조회 기능
	 * @author 신정은
	 */
	public List<SrDemand> selectByCustId(String custId);
	
	/** 
	 * sr요청 이 결재 전 상태이면 수정하기 위해 기존 데이터 제공
	 * @author 신정은
	 */
	public SrRequestDto selectSdByDmnNo(String dmndNo);
	
	/**
	 * sr요청 수정 진행
	 * @author 신정은
	 */
	public int updateByDmndNo(SrRequestDto srRequestDto);
}
