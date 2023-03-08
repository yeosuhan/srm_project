package com.oti.team2.alert.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.method.annotation.SseEmitter;

import com.oti.team2.alert.dto.Alert;
import com.oti.team2.alert.service.IAlertService;

import lombok.extern.log4j.Log4j2;

@Controller
@Log4j2
@RequestMapping("/alert")
public class AlertController {
	@Autowired
	IAlertService alertService;
	/* 새로운 알람을 가져오는 메소드
	 * @author : 안한길
	 * @param : auth
	 * @return : List<Alert>
	 * */
	
	@ResponseBody
	@GetMapping("/list")
	public List<Alert> getAlertList(Authentication auth){
		List<Alert> alertList = alertService.getAlertList(auth.getName());
		log.info(alertList);
		return alertList;
	}
	
	@ResponseBody
	@GetMapping("/connect")
	public SseEmitter connect() {
		SseEmitter emitter = new SseEmitter();
		
		return emitter;
	}
	
}
