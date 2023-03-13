package com.oti.team2.util.sseemitter;

import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.mvc.method.annotation.SseEmitter;

import lombok.extern.log4j.Log4j2;

@Component
@Log4j2
public class SseEmitters {
	//안전한 스레드 처리를 위한 동시성 컬렉션 라이브러리 사용
	private final Map<String,SseEmitter> emitters = new ConcurrentHashMap<>(); 
	/* SseEmitter 사용하여 sse 연결 생성후 리스트에 저장
	 * @author : 안한길
	 * @param : SseEmitter
	 * @return : SseEmitter
	 * */
	public SseEmitter add(String memberId,SseEmitter emitter) {
		this.emitters.put(memberId,emitter);
		emitter.onCompletion(()->{
			log.info("연결 만료");
			log.info(this.emitters);
			this.emitters.remove(memberId); //만료시 리스트에서 삭제
		});
		emitter.onTimeout(()->{
			log.info("time out"+this.toString());
			emitter.complete();
		});
		log.info(memberId+" 연결");
		log.info(emitters.get(memberId));
		return emitter;
	}
	
	/* 클라이언트에게 알람을 전송
	 * @author : 안한길
	 * @param : alert
	 * 
	 * */
	public void sendAlert(String memberId) {
		SseEmitter emitter = this.emitters.get(memberId);
		log.info(emitter);
		String data = "new message";
		try {
			emitter.send(SseEmitter.event()
					.name("alert")
					.data(data)
					);
			log.info(memberId+" 에게 메시지 전송 완료");
		}catch(Exception ex) {
			emitter.completeWithError(ex);
		}
	}
	/* 기존의 연결을 가져오는 메소드
	 * @author : 안한길
	 * @param : name
	 * @return : SseEmitter
	 * */
	public SseEmitter getEmitter(String memberId) {
		SseEmitter emitter = this.emitters.get(memberId);
		log.info("연결 불러옴"+emitter);
		if(emitter != null) {
			return emitter;
		}
		return null;
	}
}
