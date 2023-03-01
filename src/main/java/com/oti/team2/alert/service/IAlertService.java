package com.oti.team2.alert.service;

import java.util.List;

import com.oti.team2.alert.dto.Alert;

public interface IAlertService {

	List<Alert> getAlertList(String rcvrId);

}
