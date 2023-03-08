package com.oti.team2.alert.service;

import java.util.List;

import org.springframework.web.servlet.mvc.method.annotation.SseEmitter;

import com.oti.team2.alert.dto.Alert;

public interface IAlertService {

	List<Alert> getAlertList(String rcvrId);

	int sendToClient(String rcvrId, String srNo, String altType);

	int sendToClient(String rcvrId, int hstryId, String altType);

	SseEmitter connectSseEmitter(String memberId);

}
