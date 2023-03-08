package com.oti.team2.alert.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
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
	/* Emitter를 생성하여 클라이언트와 연결후 아이디를 키로 하여 맵에 저장
	 * @author : 안한길
	 * @param : auth
	 * @return : SseEmitter
	 * */
	@ResponseBody
	@GetMapping("/connect")
	public ResponseEntity<SseEmitter> connect(Authentication auth) {
		return ResponseEntity.ok(alertService.connectSseEmitter(auth.getName()));
	}
	@ResponseBody
	@GetMapping("/testsend")
	public int testSend(Authentication auth, @RequestParam("dmndNo")String dmndNo) {
		log.info(dmndNo);
		return alertService.sendToClient(auth.getName(), dmndNo);
		
	}
	
	@GetMapping("/checkalert")
	public String checkAlert(@ModelAttribute Alert alert,Authentication auth) {
		String url = alertService.checkAlert(alert,auth.getAuthorities().stream().findFirst().get().toString());
		return "redirect:"+url;
	}
}
