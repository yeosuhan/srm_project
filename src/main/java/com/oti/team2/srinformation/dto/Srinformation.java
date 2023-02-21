package com.oti.team2.srinformation.dto;

import java.sql.Date;

import lombok.Data;

@Data
public class Srinformation {
	
	//srinformation 테이블
	private String srNo;
	private String dmndNo;
	private String rnk;
	private Date bgngYmd;
	private Date endYmd;
	private String rvwCn;
	private String deptCd;
	private String picId;
	private char prgrsYn;
	
	//sr요청 테이블
	private String ttl;
	
	//members 테이블
	private String flnm;
	
	//시스템 테이블
	private String sysNm;
	
	//업무 구분 테이블
	private String teskSeNm;
	
	//진행상태 테이블
	private String sttsNm;
	
}
