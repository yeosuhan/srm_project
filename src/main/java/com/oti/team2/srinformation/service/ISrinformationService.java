package com.oti.team2.srinformation.service;

import java.util.List;

import com.oti.team2.srinformation.dto.Srinformation;

public interface ISrinformationService {
	/**
	 * 
	 * @author 여수한
	 * @return sr진척목록 조회
	 */
	List<Srinformation> getList();

}
