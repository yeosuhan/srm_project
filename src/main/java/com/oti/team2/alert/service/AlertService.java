package com.oti.team2.alert.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.oti.team2.alert.dao.IAlertDao;
import com.oti.team2.alert.dto.Alert;
@Service
public class AlertService implements IAlertService {
	@Autowired
	IAlertDao alertDao;

	@Override
	public List<Alert> getAlertList(String rcvrId) {
		return alertDao.selectByRcvrId(rcvrId);
	}
	
}
