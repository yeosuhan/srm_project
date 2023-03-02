package com.oti.team2.srinformation.service;

import java.util.List;

import com.oti.team2.srdemand.dto.SdApprovalDto;
import com.oti.team2.srinformation.dto.SrinformationList;
import com.oti.team2.srinformation.dto.SrplanInfomaion;

public interface ISrinformationService {
	/**
	 * 
	 * @author 여수한
	 * 작성일자 : 2023-02-22
	 * @return sr진척 목록 조회
	 */
	List<SrinformationList> getList();
	
	/**
	 * 
	 * @author 여수한
	 * 작성일자 : 2023-02-23
	 * @return sr진척 계획정보 조회
	 */
	SrplanInfomaion getPlan(String Plan);
	
	/**
	 * 관리자의 sr요청 승인 시 -> srInformation에 insert하기
	 * @author 신정은
	 */
	public void insertInformation(SdApprovalDto sdApprovalDt);
	
}
