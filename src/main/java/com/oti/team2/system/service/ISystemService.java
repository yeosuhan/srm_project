package com.oti.team2.system.service;

import java.util.List;

import com.oti.team2.system.dto.SrSystem;

public interface ISystemService {

	/**
	 * SR요청 등록시, 모든 시스템 조회
	 * @author 신정은
	 */
	public List<SrSystem> getSystemList();
}
