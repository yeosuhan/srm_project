package com.oti.team2.srdemand.service;

import com.oti.team2.srdemand.dto.SrRequestDto;

public interface ISrDemandService {

	/**
	 * sr요청 등록
	 * @author 신정은
	 */
	public int addSrDemand(SrRequestDto srRequestDto);
	
}
