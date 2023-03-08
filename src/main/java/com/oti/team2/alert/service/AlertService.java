package com.oti.team2.alert.service;

import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.mvc.method.annotation.SseEmitter;

import com.oti.team2.alert.dao.IAlertDao;
import com.oti.team2.alert.dto.Alert;
import com.oti.team2.util.sseemitter.SseEmitters;

import lombok.extern.log4j.Log4j2;
@Service
@Log4j2
public class AlertService implements IAlertService {
	@Autowired
	IAlertDao alertDao;
	@Autowired
	SseEmitters sseEmitters;
	/* 새로운 알람을 가져오는 메소드
	 * @author : 안한길
	 * @param : rcvrId
	 * @return : List<Alert>
	 * */
	@Override
	public List<Alert> getAlertList(String rcvrId) {
		return alertDao.selectByRcvrId(rcvrId);
	}
	/* 새로운 알람을 추가하고 메시지를 보내는 메소드
	 * @author : 안한길
	 * @param : rcvrId
	 * @param : srNo
	 * @param : altType
	 * @return : List<Alert>
	 * */
	@Override
	public int sendToClient(String rcvrId,String srNo,String altType) {
		return 0;
	}
	/* 새로운 알람을 추가하고 메시지를 보내는 메소드
	 * @author : 안한길
	 * @param : rcvrId
	 * @param : hstry
	 * @param : altType
	 * @return : List<Alert>
	 * */
	@Override
	public int sendToClient(String rcvrId,int hstryId,String altType) {
		return 0;
	}
	@Override
	public SseEmitter connectSseEmitter(String memberId) {
		SseEmitter emitter = new SseEmitter();
		try {
			emitter.send(SseEmitter.event()
					.name("connect")
					.data("connected")
					);//더미 데이터 전송
		}catch(IOException e) {
			log.info(e.getStackTrace());
		}
		return sseEmitters.add(memberId,emitter);
	}
}
