package com.oti.team2.srinformation.service;

import java.util.List;

import com.oti.team2.srinformation.dto.SrdemandDetail;
import com.oti.team2.srinformation.dto.SrinformationList;

public interface ISrinformationService {
	/**
	 * 
	 * @author 여수한
	 * 작성일자 : 2023-02-22
	 * @return sr요청 상세 조회
	 */
	List<SrinformationList> getList();
	
	/**
	 * 
	 * @author 여수한
	 * 작성일자 : 2023-02-22
	 * @return sr요청 상세 조회
	 */
	SrdemandDetail getInfoDetail(String dmndNo);

}
