package com.oti.team2.srdemand.dao;

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
}
