package com.oti.team2.system.dao;

import java.util.List;

import com.oti.team2.system.dto.SrSystem;

public interface ISystemDao {
	
	/**
	 * 모든 시스템 조회
	 * @author 신정은
	 */
	public List<SrSystem> selectAll();

}
