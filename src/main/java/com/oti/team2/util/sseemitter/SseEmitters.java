package com.oti.team2.util.sseemitter;

import java.util.List;
import java.util.concurrent.CopyOnWriteArrayList;

import org.springframework.stereotype.Component;

import lombok.extern.log4j.Log4j2;

@Component
@Log4j2
public class SseEmitters {
	//private final List<SeeEmitter> emitter = new CopyOnWriteArrayList<>(); //안전한 스레드 처리를 위한 동시성 컬렉션 라이브러리 사용
}
