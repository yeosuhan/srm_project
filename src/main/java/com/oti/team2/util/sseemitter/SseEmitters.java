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
			this.emitters.remove(memberId); //만료시 리스트에서 삭제
		});
		emitter.onTimeout(()->{
			log.info("time out");
			emitter.complete();
		});
		return emitter;
	}
	/* 클라이언트와 연결된 emitter를 가져옴
	 * @author : 안한길
	 * @param : memberId
	 * @return : SseEmitter
	 * */
	SseEmitter getSseEmitter(String memberId) {
		return this.emitters.get(memberId);
	}
}
