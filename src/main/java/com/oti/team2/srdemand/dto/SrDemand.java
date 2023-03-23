package com.oti.team2.srdemand.dto;

import java.sql.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

/**
 * SR요청 목록에 사용됨
 * 
 * @author 신정은
 *
 */
@Data
public class SrDemand {
	private String dmndNo;
	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd", timezone = "Asia/Seoul")
	private Date dmndYmd; // 요청일
	private String ttl;

	// 조인
	private String custNm; // 고객 이름
	private String rvwrNm; // 검토자 이름
	private String instNm;
	private String sysNm;
	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd", timezone = "Asia/Seoul")
	private Date endYmd; // 계획 종료일
	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd", timezone = "Asia/Seoul")
	private Date cmptnDmndYmd; // 고객이 요청한 완료일
	private String sttsNm;
}