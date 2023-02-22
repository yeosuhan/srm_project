package com.oti.team2.system.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.oti.team2.system.dao.ISystemDao;
import com.oti.team2.system.dto.SrSystem;

@Service
public class SystemService implements ISystemService{

	@Autowired
	private ISystemDao systemDao;
	
	/**
	 * SR요청 등록시, 모든 시스템 조회
	 * @author 신정은
	 */
	public List<SrSystem> getSystemList() {
		List<SrSystem> systems = systemDao.selectAll();
		return systems;
	}
}
