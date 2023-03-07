package com.oti.team2.srinformation.dto;

import java.sql.Date;

import lombok.Data;

@Data
public class SrinformationList {
	
	//srinformation 테이블
	private String srNo;
	private String dmndNo;
	private Date bgngYmd;
	private Date endYmd;
	
	//sr요청 테이블 - 내용
	private String ttl;
	
	//members 테이블 - 등록자 이름, 아이디
	private String flnm;
	
	//시스템 테이블 - 시스템 이름
	private String sysNm;
	
	//업무 구분 테이블 - 	업무 구분
	private String taskSeNm;
	
	//진행상태 테이블 - 진행상태
	private String sttsNm;
	
}
