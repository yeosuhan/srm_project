package com.oti.team2.srdemand.dto;

import lombok.Data;

@Data
/**
 * SR 요청을 수정할떄 전달, 사용되는 객체
 * @author 신정은
 *
 */
public class SrUpdateDto {
	private String sysCd;
	private String taskSeCd;
	private String ttl; 
	private String cn;
	private String relGrund; // 관련 근거
	private String cmptnDmndYmd; // 완료 요청일
}
