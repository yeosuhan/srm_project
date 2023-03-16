package com.oti.team2.alert.service;

import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.mvc.method.annotation.SseEmitter;

import com.oti.team2.alert.dao.IAlertDao;
import com.oti.team2.alert.dto.Alert;
import com.oti.team2.util.Auth;
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
	public List<Alert> getAlertList(String rcvrId,String role) {
		return alertDao.selectByRcvrId(rcvrId,role);
	}
	/* 새로운 알람을 추가하고 메시지를 보내는 메소드(반영 요청)
	 * @author : 안한길
	 * @param : rcvrId
	 * @param : dmndNo
	 * @return : List<Alert>
	 * */
	@Override
	public int sendToClient(String rcvrId,String dmndNo) {
		Alert alert = new Alert();
		alert.setRcvrId(rcvrId);
		alert.setDmndNo(dmndNo);
		alert.setAltType("RFLT");
		alert.setAltCn("요청에 대한 상태가 변경 되었습니다.");
		log.info("알림 테이블에 추가 호출");
		int result = alertDao.insertAlertDao(alert);
		log.info("알림 생성 결과: "+result);
		if(result==1) {
			sseEmitters.sendAlert(rcvrId);
		}
		return result;
	}
	/* 새로운 알람을 추가하고 메시지를 보내는 메소드(예정일 변경, 개발 취소)
	 * @author : 안한길
	 * @param : rcvrId
	 * @param : hstry
	 * @param : altType
	 * @return : List<Alert>
	 * */
	@Override
	public int sendToClient(String rcvrId,int hstryId,String altType) {
		Alert alert = new Alert();
		alert.setRcvrId(rcvrId);
		alert.setHstryId(hstryId);
		alert.setAltType(altType);
		if(altType.equals("CHG_YMD")) {
			alert.setAltCn("요청에 대한 변경 사항이 있습니다.");
		}else if(altType.equals("CHG_YMD_DVL")) {
			alert.setAltCn("개발중인 항목에 대해 예정일 변경 사항이 있습니다.");
		}else if(altType.equals("RTRCN")) {
			alert.setAltCn("요청에 대한 변경 사항이 있습니다.");
		}
		int result = alertDao.insertAlertDao(alert);
		log.info("알림 생성 결과: "+result);
		if(result==1) {
			sseEmitters.sendAlert(rcvrId);
		}
		return result;
	}
	
	
	/* 
	 * 이미 생성된 Emitter가 있다면 찾아서 리턴
	 * @author : 안한길
	 * @param : memberId
	 * @return : SseEmitter
	 * */
	@Override
	public SseEmitter getSseEmitter(String memberId) {
		SseEmitter emitter = sseEmitters.getEmitter(memberId);
		if(emitter == null) {
			emitter = connectSseEmitter(memberId);
		}
		return emitter;
	}
	/* Emitter를 생성하여 클라이언트와 연결후 아이디를 키로 하여 맵에 저장
	 * @author : 안한길
	 * @param : memberId
	 * @return : SseEmitter
	 * */
	@Override
	public SseEmitter connectSseEmitter(String memberId) {
		SseEmitter emitter=new SseEmitter(1000L*60L*20L);//1000ms*60*20: 20분
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
	/* 알람 확인 처리후 해당 페이지의 url을 리턴하는 서비스
	 * @author : 안한길
	 * @param : alert
	 * @return : String
	 * */
	@Override
	public String checkAlert(Alert alert, String role) {
		String url=null;
		if(alert.getAltType().equals("RFLT")) {	//반영 요청 관련
			
			url="/srdemand/list?dmndno="+alert.getDmndNo();
			if(role.equals(Auth.ROLE_ADMIN.toString())) {
				url="/admin"+url;
			}
			
			//alertDao.updateIdntyYn(alert.getAltNo()); x버튼을 눌러 알람을 닫도록 수정
		}else if(alert.getAltType().equals("CHG_YMD")){
			
			if(role.equals(Auth.ROLE_CLIENT.toString())){
				url="/srdemand/list";
			}else if(role.equals(Auth.ROLE_ADMIN.toString())) {
				url="/srinformation/list";
			}
			url=url+"?hstryId="+alert.getHstryId();
			//alertDao.updateIdntyYn(alert.getAltNo());
		}else if(alert.getAltType().equals("CHG_YMD_DVL")){
			
			url="/srinformation/list?hstryId="+alert.getHstryId();
			
			//alertDao.updateIdntyYn(alert.getAltNo());
			
		}else if(alert.getAltType().equals("RTRCN")){
			
			if(role.equals(Auth.ROLE_CLIENT.toString())){
				url="/srdemand/list?hstryId="+alert.getHstryId();
			}else if(role.equals(Auth.ROLE_ADMIN.toString())) {
				url="/srinformation/list?hstryId="+alert.getHstryId();
			}
			
			//alertDao.updateIdntyYn(alert.getAltNo());
		}
		return url;
	}
	/* 알림 확인 처리
	 * @author : 안한길
	 * @param : altNo
	 * @return : int
	 * */
	@Override
	public int closeAlert(int altNo) {
		return alertDao.updateIdntyYn(altNo);
	}
	
	
}
